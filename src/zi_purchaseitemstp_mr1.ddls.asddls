@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'PO item child view'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZI_PURCHASEITEMSTP_MR1 as select from ZI_PURCHASEITEMS_mr1 
association to parent ZI_PURCHASEHEADERTP_mr1 as _PurchaseHeader
on $projection.PurchaseOrderno = _PurchaseHeader.PurchaseOrderno
{
    key PurchaseOrderno,
    key PurchaseItem,
    ShortText,
    Material,
    Plant,
    MatGroup,
    @Semantics.quantity.unitOfMeasure: 'OrderUnit'
    OrderQunt,
    OrderUnit,
    @Semantics.amount.currencyCode: 'PriceUnit'
    ProductPrice,
    PriceUnit,
    ItemPrice,
    LocalLastChangedBy,
    /* Associations */
    _Currency,
    _PurchaseOrder,
    _PurchaseHeader
}
