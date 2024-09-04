INTERFACE zif_po_um_mr1
  PUBLIC .
Types: mt_po_header type STANDARD TABLE OF zpoheader_db_mr1 WITH DEFAULT KEY,
       mt_po_items type STANDARD TABLE OF zpoitems_db_mr1 WITH default key.
ENDINTERFACE.
