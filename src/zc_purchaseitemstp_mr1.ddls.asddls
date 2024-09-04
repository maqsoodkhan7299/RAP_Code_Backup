@EndUserText.label: 'consumption PO item child view'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true
define view entity ZC_PURCHASEITEMSTP_MR1
//  provider contract transactional_query 
  as projection on ZI_PURCHASEITEMSTP_MR1
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
    _PurchaseHeader: redirected to parent ZC_PURCHASEHEADERTP_mr1,
    _PurchaseOrder
}
