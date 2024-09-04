@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Card 2 Bar type graph PO'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@Metadata.allowExtensions: true
define view entity ZC_PURCHASEORDERSCARD2_Bar_MR1 as select from  ZI_PURCHASEHEADERTP_MR1

{
    key PurchaseOrderno,
    Description,
    PurchaseTotalPrice,
    PriceUnit,
    OrderStat,
    priority,
    CreatedBy,
    CreatedDateTime,
    
    cast( ( PurchaseTotalPrice * 100 ) / 50000 as abap.int2 ) as BudgetUsage
}
