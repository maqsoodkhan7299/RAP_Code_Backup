@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'ovp PO priority'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@Search.searchable: true
define view entity ZI_PO_Priority_mr1 as select from zpo_priority_db
{
    @Search.defaultSearchElement: true
    key priority as Priority,
    
    @Search.fuzzinessThreshold: 0.7
    @Search.ranking: #HIGH
    @Search.defaultSearchElement: true
    description as Description
}
