@EndUserText.label: 'consumption PO root view'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true
@ObjectModel.semanticKey: [ 'PurchaseOrderno' ]
@Search.searchable: true
define root view entity ZC_PURCHASEHEADERTP_mr1
  provider contract transactional_query as projection on ZI_PURCHASEHEADERTP_MR1
  association[1..1] to ZC_SUPPLIER_MR1 as _Supplier on $projection.Supplier = _Supplier.Supplierid
{
    @ObjectModel.text.element: [ 'Description' ]
    key PurchaseOrderno,
    @Search.defaultSearchElement: true
    @Search.fuzzinessThreshold: 0.7
    Description,
    PurchaseTotalPrice,
     @Consumption.valueHelpDefinition: [{ entity: {
        name: 'ZC_PURCHASEHEADERTP_mr1',
        element: 'PriceUnit'} }]
    PriceUnit,
    @Consumption.valueHelpDefinition: [{ entity: {
        name: 'ZC_ORDERTYPE_MR1',
        element: 'PoType'
    } }]
    Ordertype,
    CompanyCode,
    Organisation,
    @ObjectModel.text.element: [ 'statusDescription' ]
    @Consumption.valueHelpDefinition: [{ 
        entity: {
            name: 'ZC_PURCHASESTATUS_MR1',
            element: 'PoStatus'
        }
     }]
    OrderStat,
    _Status.StatusDesc as statusDescription,
    criticalValue,
    @Consumption.valueHelpDefinition: [{ entity: {
        name: 'ZC_SUPPLIER_MR1',
        element: 'Supplierid'
    } }]
    Supplier,
    Imageurl,
    CreatedBy,
    CreatedDateTime,
    ChangedDateTime,
    LocalLastChangedBy,
    /* Associations */
    _OrderType,
    _POItems : redirected to composition child ZC_PURCHASEITEMSTP_MR1,
    _POAttachment : redirected to composition child ZC_PO_Attachment_mr1,
    _PurchaseItems,
    _Status,
    _Supplier
}
