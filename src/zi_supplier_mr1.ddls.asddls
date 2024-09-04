@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'supplier basic view'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZI_SUPPLIER_mr1 as select from ZSUPPLIER_DB_MR1
{
    key supplierid as Supplierid,
    supplier_name as SupplierName,
    email_address as EmailAddress,
    phone_number as PhoneNumber,
    fax_number as FaxNumber,
    web_address as WebAddress
}
