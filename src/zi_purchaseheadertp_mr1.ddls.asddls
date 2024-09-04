@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'PO root view'
define root view entity ZI_PURCHASEHEADERTP_MR1 as select from ZI_OVERALLPOPRICE_mr1
composition[*] of ZI_PURCHASEITEMSTP_MR1 as _POItems 
composition[*] of ZI_PO_attachment_mr1 as _POAttachment
association[1] to ZI_PO_Priority_mr1 as _priority on $projection.priority = _priority.Priority
{
    key PurchaseOrderno,
    Description,
    PurchaseTotalPrice,
    PriceUnit,
    Ordertype,
    CompanyCode,
    Organisation,
    OrderStat,
    case 
    when OrderStat = '01' then 1
    when OrderStat = '02' then 2
    when OrderStat = '03' then 3
    else 0
    end as criticalValue,
    case
    when PurchaseTotalPrice < 500 then '03'
    when PurchaseTotalPrice > 500 and PurchaseTotalPrice < 1000 then '02'
    when PurchaseTotalPrice > 1000 then '01'
    else '00'
    end as priority,
    Supplier,
    Imageurl,
    @Semantics.user.createdBy: true
    CreatedBy,
    @Semantics.systemDateTime.createdAt: true
    CreatedDateTime,
    @Semantics.systemDateTime.localInstanceLastChangedAt: true
    ChangedDateTime,
    @Semantics.user.lastChangedBy: true
    LocalLastChangedBy,
    @Semantics.systemDateTime.lastChangedAt: true
    last_change_at,
    /* Associations */
    _OrderType,
    _PurchaseItems,
    _Status,
    _Supplier,
    _POItems,
    _POAttachment,
    _priority
}
