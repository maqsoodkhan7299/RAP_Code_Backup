CLASS lhc_poitem DEFINITION INHERITING FROM cl_abap_behavior_handler.

  PRIVATE SECTION.

    METHODS calculateTotalPrice FOR DETERMINE ON SAVE
      IMPORTING keys FOR poitem~calculateTotalPrice.

ENDCLASS.

CLASS lhc_poitem IMPLEMENTATION.

  METHOD calculateTotalPrice.
  data(lv_test) = abap_true.
  data: lv_total_price type p LENGTH 10 DECIMALS 2.
  READ entity in local MODE
  zi_purchaseitemstp_mr1
  ALL FIELDS WITH CORRESPONDING #( keys )
  RESULT data(lt_items).


  loop at lt_items into data(ls_item).
  lv_total_price = ( ls_item-ProductPrice * ls_item-OrderQunt ) + lv_total_price.
  ENDLOOP.
  data(lv_purchaseorderno) = keys[ 1 ]-PurchaseOrderno.


  if lv_total_price > 1000.
  MODIFY entity in local mode
  zi_purchaseheadertp_mr1
  update FIELDS ( OrderStat )
  WITH VALUE #( ( PurchaseOrderno = lv_purchaseorderno OrderStat = '01' ) )
  REPORTED data(lt_reported).
  endif.

  ENDMETHOD.

ENDCLASS.

*"* use this source file for the definition and implementation of
*"* local helper classes, interface definitions and type
*"* declarations
