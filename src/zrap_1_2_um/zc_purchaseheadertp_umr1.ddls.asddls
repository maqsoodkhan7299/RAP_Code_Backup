@EndUserText.label: 'consumption PO root view'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true
define root view entity ZC_PURCHASEHEADERTP_umr1
  provider contract transactional_query as projection on ZI_PURCHASEHEADERTP_UMR1
{
    key PurchaseOrderno,
    Description,
    PurchaseTotalPrice,
    PriceUnit,
    Ordertype,
    CompanyCode,
    Organisation,
    OrderStat,
    criticalValue,
    Supplier,
    Imageurl,
    CreatedBy,
    CreatedDateTime,
    ChangedDateTime,
    LocalLastChangedBy,
    last_change_at,
    /* Associations */
    _OrderType,
    _POItems: redirected to composition child ZC_PURCHASEITEMSTP_uMR1,
    _PurchaseItems,
    _Status,
    _Supplier
}
