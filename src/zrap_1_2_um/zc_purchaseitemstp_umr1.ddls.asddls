@EndUserText.label: 'consumption PO item child view'
@AccessControl.authorizationCheck: #NOT_REQUIRED
define view entity ZC_PURCHASEITEMSTP_uMR1
//  provider contract transactional_query 
  as projection on ZI_PURCHASEITEMSTP_UMR1
{
    key PurchaseOrderno,
    key PurchaseItem,
    ShortText,
    Material,
    Plant,
    MatGroup,
    OrderQunt,
    OrderUnit,
    ProductPrice,
    PriceUnit,
    ItemPrice,
    LocalLastChangedBy,
    /* Associations */
    _Currency,
    _PurchaseHeader: redirected to parent ZC_PURCHASEHEADERTP_umr1,
    _PurchaseOrder
}
