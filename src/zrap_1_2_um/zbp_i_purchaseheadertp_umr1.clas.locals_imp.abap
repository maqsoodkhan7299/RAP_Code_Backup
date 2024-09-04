class lcl_buffer_class_umr1 DEFINITION.
public section.

class-data: mt_po_data type zif_po_um_mr1=>mt_po_header,
            mt_po_items type zif_po_um_mr1=>mt_po_items.
ENDCLASS.








CLASS lhc_ZI_PURCHASEHEADERTP_UMR1 DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR zi_purchaseheadertp_umr1 RESULT result.

    METHODS create FOR MODIFY
      IMPORTING entities FOR CREATE zi_purchaseheadertp_umr1.

    METHODS update FOR MODIFY
      IMPORTING entities FOR UPDATE zi_purchaseheadertp_umr1.

    METHODS delete FOR MODIFY
      IMPORTING keys FOR DELETE zi_purchaseheadertp_umr1.

    METHODS read FOR READ
      IMPORTING keys FOR READ zi_purchaseheadertp_umr1 RESULT result.

    METHODS lock FOR LOCK
      IMPORTING keys FOR LOCK zi_purchaseheadertp_umr1.

    METHODS rba_Poitems FOR READ
      IMPORTING keys_rba FOR READ zi_purchaseheadertp_umr1\_Poitems FULL result_requested RESULT result LINK association_links.

    METHODS cba_Poitems FOR MODIFY
      IMPORTING entities_cba FOR CREATE zi_purchaseheadertp_umr1\_Poitems.

ENDCLASS.

CLASS lhc_ZI_PURCHASEHEADERTP_UMR1 IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD create.
    data(lv_test) = abap_true.
    data: ls_header type zpoheader_db_mr1.
    loop at entities into data(ls_entity).
    ls_header = CORRESPONDING #( ls_entity MAPPING FROM ENTITY ).
    APPEND ls_header to lcl_buffer_class_umr1=>mt_po_data.

    ENDLOOP.
    mapped-poheaders = VALUE #( for ls in lcl_buffer_class_umr1=>mt_po_data ( PurchaseOrderno = ls-po_order ) ).

  ENDMETHOD.

  METHOD update.
  ENDMETHOD.

  METHOD delete.
  ENDMETHOD.

  METHOD read.
  ENDMETHOD.

  METHOD lock.
  ENDMETHOD.

  METHOD rba_Poitems.
  ENDMETHOD.

  METHOD cba_Poitems.
  ENDMETHOD.

ENDCLASS.

CLASS lhc_ZI_PURCHASEITEMSTP_UMR1 DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS update FOR MODIFY
      IMPORTING entities FOR UPDATE zi_purchaseitemstp_umr1.

    METHODS delete FOR MODIFY
      IMPORTING keys FOR DELETE zi_purchaseitemstp_umr1.

    METHODS read FOR READ
      IMPORTING keys FOR READ zi_purchaseitemstp_umr1 RESULT result.

    METHODS rba_Purchaseheader FOR READ
      IMPORTING keys_rba FOR READ zi_purchaseitemstp_umr1\_Purchaseheader FULL result_requested RESULT result LINK association_links.

ENDCLASS.

CLASS lhc_ZI_PURCHASEITEMSTP_UMR1 IMPLEMENTATION.

  METHOD update.
  ENDMETHOD.

  METHOD delete.
  ENDMETHOD.

  METHOD read.
  ENDMETHOD.

  METHOD rba_Purchaseheader.
  ENDMETHOD.

ENDCLASS.

CLASS lsc_ZI_PURCHASEHEADERTP_UMR1 DEFINITION INHERITING FROM cl_abap_behavior_saver.
  PROTECTED SECTION.

    METHODS finalize REDEFINITION.

    METHODS check_before_save REDEFINITION.

    METHODS save REDEFINITION.

    METHODS cleanup REDEFINITION.

    METHODS cleanup_finalize REDEFINITION.

ENDCLASS.

CLASS lsc_ZI_PURCHASEHEADERTP_UMR1 IMPLEMENTATION.

  METHOD finalize.
  ENDMETHOD.

  METHOD check_before_save.
  ENDMETHOD.

  METHOD save.
  data(lv_test) = abap_true.
  if lcl_buffer_class_umr1=>mt_po_data is not INITIAL.

  call FUNCTION 'ZPO_SAVE_UM_MR1'
    EXPORTING
      it_po_header = lcl_buffer_class_umr1=>mt_po_data
*      it_po_items  =
    .

  endif.
  ENDMETHOD.

  METHOD cleanup.
  ENDMETHOD.

  METHOD cleanup_finalize.
  ENDMETHOD.

ENDCLASS.
