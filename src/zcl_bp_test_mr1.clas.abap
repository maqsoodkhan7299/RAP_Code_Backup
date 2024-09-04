CLASS zcl_bp_test_mr1 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_BP_TEST_MR1 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    DATA: lt_keys TYPE TABLE FOR READ IMPORT ZC_PURCHASEHEADERTP_mr1.

*    lt_keys = VALUE #( ( %key-PurchaseOrderno = '0000001000'
*                         %control-Description = 01
*                         %control-CompanyCode = 01 ) ).
*    READ ENTITY ZC_PURCHASEHEADERTP_mr1 FROM lt_keys RESULT DATA(lt_result).
*    out->write( lt_result ).


*  modify entity ZC_PURCHASEHEADERTP_mr1
*  create FIELDS ( Description CompanyCode )
*  with value #( ( %cid = 'C1'
*                  Description = 'test create'
*                  CompanyCode = '1001'
*                 ) )
*                 mapped data(lt_mapped).
*                 COMMIT ENTITIES.
*                 out->write( lt_mapped ).

*    MODIFY ENTITY ZC_PURCHASEHEADERTP_mr1
*    CREATE BY \_POItems
*    FIELDS ( plant ItemPrice Material MatGroup )
*    WITH VALUE #( ( PurchaseOrderno = '0000001011'
*                    %target = VALUE #( ( %cid = 'c2'
**                                         PurchaseItem = '0010'
*                                         plant = '1010'
*                                         ItemPrice = 100
*                                         Material = 'materialNew'
*                                         MatGroup = '001' )
*
*                                         ( %cid = 'c3'
**                                         PurchaseItem = '0020'
*                                         plant = '1012'
*                                         ItemPrice = 120
*                                         Material = 'materialNew2'
*                                         MatGroup = '002' )
*
*                                      )
*                  )
*                )
*    FAILED DATA(lt_failed)
*    MAPPED DATA(lt_mapped)
*    REPORTED DATA(lt_reported).
*    COMMIT ENTITIES.
*    out->write( lt_mapped ).

*////delete a entity row

*modify ENTITIES OF ZC_PURCHASEHEADERTP_mr1 in local mode
modify ENTITY ZC_PURCHASEHEADERTP_mr1
DELETE FROM
VALUE #( ( %key-PurchaseOrderno = '0000001012' ) )
FAILED data(lt_failed)
REPORTED data(reported_commit).
COMMIT ENTITIES.




  ENDMETHOD.
ENDCLASS.
