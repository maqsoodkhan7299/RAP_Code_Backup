@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'PO header comsumption view'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@Metadata.allowExtensions: true
@ObjectModel.semanticKey: [ 'PurchaseOrderno' ]
@Search.searchable: true
define view entity ZC_PurchaseHeaderDetails_mr1 as select from ZI_OVERALLPOPRICE_mr1
association[0..*] to ZC_PURCHASEITEMS_mr1 as _PurchaseItems on $projection.PurchaseOrderno = _PurchaseItems.PurchaseOrderno
association[1..1] to ZC_SUPPLIER_MR1 as _Supplier on $projection.Supplier = _Supplier.Supplierid
association[1..1]  to ZC_PURCHASESTATUS_MR1 as _Status on $projection.OrderStat = _Status.PoStatus
{
@ObjectModel.text.element: [ 'Description' ]
    key PurchaseOrderno,
    @Search.defaultSearchElement: true
    @Search.fuzzinessThreshold: 0.7
    @Search.ranking: #HIGH
    Description,
    PurchaseTotalPrice,
    PriceUnit,
    Ordertype,
    CompanyCode,
    Organisation,
    @Consumption.valueHelpDefinition: [{
        entity: {
            name: 'ZC_PURCHASESTATUS_MR1',
            element: 'PoStatus'
        }}]
    @ObjectModel.text.element: [ 'statusDesc' ]
    OrderStat,
    _Status.StatusDesc as statusDesc,
    case 
    when OrderStat = '01' then 1
    when OrderStat = '02' then 2
    when OrderStat = '03' then 3
    else 0
    end as criticalValue,
    @Search.defaultSearchElement: true
    @Search.ranking: #MEDIUM
    @Consumption.valueHelpDefinition: [{
        entity: {
            name: 'ZC_SUPPLIER_MR1',
            element: 'Supplierid'
        },
        additionalBinding: [{ element: 'companyCodeSupplier', localElement: 'CompanyCode' }]
    }]
    @ObjectModel.text.element: [ 'supplierName' ]
    Supplier,
    _Supplier.SupplierName as supplierName,
    @Semantics.imageUrl: true
    Imageurl,
    CreatedBy,
    CreatedDateTime,
    ChangedDateTime,
    LocalLastChangedBy,
    /* Associations */
    _OrderType,
    @Search.defaultSearchElement: true
    _PurchaseItems,
    _Supplier
}
