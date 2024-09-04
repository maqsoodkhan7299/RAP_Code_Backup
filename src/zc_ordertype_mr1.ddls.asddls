@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'po order type consumption  view'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@Search.searchable: true
define view entity ZC_ORDERTYPE_MR1 as select from ZI_ORDERTYPE_mr1
{
@Search.defaultSearchElement: true
@Search.fuzzinessThreshold: 0.7
    key PoType,
    IsActive
}
