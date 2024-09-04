CLASS lhc_poheader DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR poheader RESULT result.
    METHODS copy FOR MODIFY
      IMPORTING keys FOR ACTION poheader~copy RESULT result.

    METHODS withdraw FOR MODIFY
      IMPORTING keys FOR ACTION poheader~withdraw RESULT result.
    METHODS validatestatus FOR VALIDATE ON SAVE
      IMPORTING keys FOR poheader~validatestatus.
    METHODS earlynumbering_cba_poattachmen FOR NUMBERING
      IMPORTING entities FOR CREATE poheader\_poattachment.
    METHODS earlynumbering_cba_poitems FOR NUMBERING
      IMPORTING entities FOR CREATE poheader\_poitems.
    METHODS earlynumbering_create FOR NUMBERING
      IMPORTING entities FOR CREATE poheader.

ENDCLASS.

CLASS lhc_poheader IMPLEMENTATION.

  METHOD get_instance_authorizations.

  ENDMETHOD.

  METHOD earlynumbering_create.
    DATA lv_key TYPE ebeln.

    SELECT MAX( PurchaseOrderno ) FROM ZC_PURCHASEHEADERTP_mr1 INTO @lv_key.

    lv_key = lv_key + 1.
    if lv_key eq 1012.
    lv_key = lv_key + 1.
    endif.

    LOOP AT entities INTO DATA(ls_entity).
      ls_entity-PurchaseOrderno = |{ lv_key ALPHA = IN }|.
      APPEND VALUE #( %cid = ls_entity-%cid
                      %is_draft = ls_entity-%is_draft
                       purchaseorderno = ls_entity-PurchaseOrderno
                       ) TO mapped-poheader.
    ENDLOOP.


  ENDMETHOD.

  METHOD earlynumbering_cba_Poitems.
*  data lv_key type i.
*  lv_key = 1.
    READ ENTITY IN LOCAL MODE
    zi_purchaseheadertp_mr1 BY \_POItems
    ALL FIELDS WITH CORRESPONDING #( entities )
    RESULT DATA(lt_poitems).

*    SELECT FROM zc_purchaseitemstp_mr1
*    FIELDS PurchaseOrderno, PurchaseItem
*    FOR ALL ENTRIES IN @entities
*    WHERE PurchaseOrderno = @entities-PurchaseOrderno
*    INTO TABLE @DATA(lt_poitems).

    DATA(lt_final_key) = entities.

    LOOP AT lt_final_key INTO DATA(ls_final_key).
      "get max no of item for the PO
      SELECT FROM @lt_poitems AS itemkey
      FIELDS MAX( PurchaseItem )
      WHERE PurchaseOrderno = @ls_final_key-PurchaseOrderno
      INTO @DATA(lv_item_no).

      LOOP AT ls_final_key-%target INTO DATA(ls_item).
        IF ls_final_key-%is_draft EQ 01.
          lv_item_no += 10.
        ELSE.
          lv_item_no = ls_item-PurchaseItem.
        ENDIF.
        ls_item-PurchaseItem = |{ lv_item_no }|.
        APPEND VALUE #( %cid = ls_item-%cid
                        %tky = CORRESPONDING #( ls_final_key-%tky )
                        %key = ls_item-%key ) TO mapped-poitem.
      ENDLOOP.
    ENDLOOP.

  ENDMETHOD.

  METHOD Copy.
    DATA: lt_keys TYPE TABLE FOR READ IMPORT zi_purchaseheadertp_mr1.

    LOOP AT keys INTO DATA(ls_keys).
      APPEND VALUE #( %tky = ls_keys-%tky
                      %control-description = 01
                      %control-companycode = 01
                      %control-ordertype = 01
                      %control-Supplier = 01
                      %control-OrderStat = 01
                      %control-organisation = 01
                      ) TO lt_keys.
    ENDLOOP.

    "read the purchase order from the keys which is to be copied
    READ ENTITY IN LOCAL MODE
    ZI_purchaseheadertp_mr1 FROM lt_keys RESULT DATA(lt_purchase_data).

    "create new entry from the copied PO
    MODIFY ENTITIES OF ZI_purchaseheadertp_mr1 IN LOCAL MODE
    ENTITY poheader
    CREATE AUTO FILL CID
    FIELDS ( description companycode ordertype Supplier OrderStat Organisation )
    WITH CORRESPONDING #( lt_purchase_data )
    MAPPED DATA(mapped_created).

    "retrieve the new PO
    READ ENTITIES OF zi_purchaseheadertp_mr1 IN LOCAL MODE
    ENTITY ZI_purchaseheadertp_mr1
    ALL FIELDS WITH CORRESPONDING #( mapped_created-poheader )
    RESULT DATA(lt_new_PO).

    "send back to UI
    DATA: lt_result TYPE TABLE FOR READ RESULT zi_purchaseheadertp_mr1.

    result = VALUE #( FOR ls_new_po IN lt_new_PO INDEX INTO lv_index
                         (

                         %cid_ref = keys[ 1 ]-%cid_ref
                           %key = keys[ 1 ]-%key
                           %param = CORRESPONDING #( ls_new_po )
                          ) ).



  ENDMETHOD.

  METHOD Withdraw.
    "modify the status
    MODIFY ENTITIES OF zi_purchaseheadertp_mr1 IN LOCAL MODE
    ENTITY poheader
    UPDATE FIELDS ( OrderStat  )
    WITH VALUE #( FOR ls_keys IN keys ( %key = ls_keys-%key
                                         OrderStat = '03' ) )
                                         REPORTED DATA(reported_update).

    READ ENTITIES OF zi_purchaseheadertp_mr1 IN LOCAL MODE
    ENTITY poheader
    ALL FIELDS WITH CORRESPONDING #( keys )
    RESULT DATA(lt_new_po).

    result = VALUE #( FOR ls_new IN lt_new_po
                      ( %key = ls_new-%key
                        %param = CORRESPONDING #( ls_new ) ) ).


  ENDMETHOD.

  METHOD validateStatus.
    DATA: lo_ref TYPE REF TO cl_abap_behv.
    CREATE OBJECT lo_ref.
    READ ENTITIES OF zi_purchaseheadertp_mr1 IN LOCAL MODE
    ENTITY poheader
    FIELDS ( OrderStat )
    WITH CORRESPONDING #( keys )
    RESULT DATA(lt_new_po).

    LOOP AT lt_new_po INTO DATA(ls_new_po).
      CASE ls_new_po-OrderStat.
        WHEN '01'.
        WHEN '02'.
        WHEN '03'.
        WHEN OTHERS.
          APPEND VALUE #( %key = ls_new_po-%key ) TO failed-poheader.
          APPEND VALUE #( %key = ls_new_po-%key
                          %msg = lo_ref->new_message_with_text(
                                   severity = if_abap_behv_message=>severity-error
                                   text     = 'Purchase Status is invalid' )
*                            %element = ''
                                  ) TO reported-poheader.

      ENDCASE.
    ENDLOOP.

  ENDMETHOD.

  METHOD earlynumbering_cba_Poattachmen.
    READ ENTITY IN LOCAL MODE
  zi_purchaseheadertp_mr1 BY \_POAttachment
  ALL FIELDS WITH CORRESPONDING #( entities )
  RESULT DATA(lt_poattachment).

  DATA(lt_final_key) = entities.

    LOOP AT lt_final_key INTO DATA(ls_final_key).
      "get max no of item for the PO
      SELECT FROM @lt_poattachment AS itemkey
      FIELDS MAX( AttachId )
      WHERE Purchaseordernumber = @ls_final_key-PurchaseOrderno
      INTO @DATA(lv_attachment_no).

      LOOP AT ls_final_key-%target INTO DATA(ls_item).
        IF ls_final_key-%is_draft EQ 01.
          lv_attachment_no += 10.
        ELSE.
          lv_attachment_no = ls_item-AttachId.
        ENDIF.
        ls_item-AttachId = |{ lv_attachment_no ALPHA = IN }|.
        APPEND VALUE #( %cid = ls_item-%cid
                        %tky = CORRESPONDING #( ls_final_key-%tky )
                        %key = ls_item-%key ) TO mapped-poattachment.
      ENDLOOP.
    ENDLOOP.


  ENDMETHOD.

ENDCLASS.
