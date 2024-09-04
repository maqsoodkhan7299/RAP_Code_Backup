@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'PO items comsumption view'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@Metadata.allowExtensions: true
@Search.searchable: true
@ObjectModel.semanticKey: [ 'PurchaseOrderno', 'PurchaseItem' ]
define view entity ZC_PURCHASEITEMS_mr1 as select from ZI_PURCHASEITEMS_mr1
{
    key PurchaseOrderno,
    @ObjectModel.text.element: [ 'ShortText' ]
    @Search.defaultSearchElement: true
    @Search.fuzzinessThreshold: 0.7
    key PurchaseItem,
    @Search.defaultSearchElement: true
    @Search.fuzzinessThreshold: 0.7
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
    _PurchaseOrder
}
