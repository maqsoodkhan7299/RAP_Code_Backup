@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Po header composite view'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZI_OVERALLPOPRICE_mr1 as select from ZI_PURCHASEHEADER_mr1
{
key PurchaseOrderno,
      Description,
      @Semantics.amount.currencyCode: 'PriceUnit'
      sum( _PurchaseItems.ItemPrice ) as PurchaseTotalPrice,
      _PurchaseItems.PriceUnit,
      Ordertype,
      CompanyCode,
      Organisation,
      OrderStat,
      Supplier,
      Imageurl,
      CreatedBy,
      CreatedDateTime,
      ChangedDateTime,
      LocalLastChangedBy,
      last_change_at,
      /* Associations */
      _OrderType,
      _PurchaseItems,
      _Supplier,
      _Status
//      OrderStatus

}
group by
  PurchaseOrderno,
  Description,
  Ordertype,
  CompanyCode,
  Organisation,
  OrderStat,
  Supplier,
  Imageurl,
  CreatedBy,
  CreatedDateTime,
  ChangedDateTime,
  LocalLastChangedBy,
  last_change_at,
  _PurchaseItems.PriceUnit
//  OrderStat,
//  OrderStatus
