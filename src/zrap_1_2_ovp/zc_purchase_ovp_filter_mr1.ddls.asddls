@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'PO OVP filter'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@Metadata.allowExtensions: true
define view entity ZC_Purchase_OVP_Filter_mr1 as select from ZI_PURCHASEHEADERTP_MR1
{
    key PurchaseOrderno,
//    Description,
//    PurchaseTotalPrice,
//    PriceUnit,
//    Ordertype,
//    CompanyCode,
//    Organisation,
@Consumption.valueHelpDefinition: [{
    entity: {
        name: 'ZC_PURCHASESTATUS_MR1',
        element: 'PoStatus'
    }
}]
    OrderStat,
//    criticalValue,
@Consumption.valueHelpDefinition: [{
    entity: {
        name: 'ZI_PO_Priority_mr1',
        element: 'Priority'
    }
}]
    priority
//    Supplier,
//    Imageurl,
//    CreatedBy,
//    CreatedDateTime,
//    ChangedDateTime,
//    LocalLastChangedBy,
//    last_change_at,
//    /* Associations */
//    _OrderType,
//    _POAttachment,
//    _POItems,
//    _priority,
//    _PurchaseItems,
//    _Status,
//    _Supplier
}
