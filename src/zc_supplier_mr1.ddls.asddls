@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'supplier consumption view'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@Metadata.allowExtensions: true
@Search.searchable: true
define view entity ZC_SUPPLIER_MR1 as select from ZI_SUPPLIER_mr1
{
@ObjectModel.text.element: [ 'SupplierName' ]
    key Supplierid,
    @Search.defaultSearchElement: true
    @Search.fuzzinessThreshold: 0.7
    @Semantics.text: true
    @Semantics.name.fullName: true
    SupplierName,
    
    @Semantics.eMail.type: [ #WORK ]
    EmailAddress,
    
    @Semantics.telephone.type: [ #WORK ]
    PhoneNumber,
    
    @Semantics.telephone.type: [ #FAX ]
    FaxNumber,
    '100' as companyCodeSupplier,
    WebAddress
}
