FUNCTION zpo_save_um_mr1.
*"----------------------------------------------------------------------
*"*"Local Interface:
*"  IMPORTING
*"     VALUE(IT_PO_HEADER) TYPE  ZIF_PO_UM_MR1=>MT_PO_HEADER
*"     VALUE(IT_PO_ITEMS) TYPE  ZIF_PO_UM_MR1=>MT_PO_ITEMS OPTIONAL
*"----------------------------------------------------------------------
 MODIFY zpoheader_db_mr1 FROM table @it_po_header.






ENDFUNCTION.
