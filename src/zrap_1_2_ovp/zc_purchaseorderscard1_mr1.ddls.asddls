@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'PO card'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@Metadata.allowExtensions: true
define view entity ZC_PurchaseOrdersCard1_mr1 as select from ZI_PURCHASEHEADERTP_MR1
{
    key PurchaseOrderno,
    Description,
  
   priority,
   _priority.Description as PriorityText,
   
    OrderStat,
    _Status.StatusDesc as StatusText,
    @Aggregation.default: #SUM
    1 as sumOfDocuments
}
