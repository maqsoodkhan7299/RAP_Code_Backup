@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'PO header basic view'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZI_PURCHASEHEADER_mr1 
 as select from zpoheader_db_mr1
  association [0..*] to ZI_PURCHASEITEMS_mr1 as _PurchaseItems on $projection.PurchaseOrderno = _PurchaseItems.PurchaseOrderno
  association [1]    to ZI_ORDERTYPE_mr1     as _OrderType     on $projection.Ordertype = _OrderType.PoType
  association [1]    to ZI_SUPPLIER_mr1     as _Supplier      on $projection.Supplier = _Supplier.Supplierid
 association [1]    to ZI_PurchaseStatus_mr1      as _Status        on $projection.OrderStat = _Status.PoStatus
{
  key po_order              as PurchaseOrderno,
      po_desc               as Description,
      po_type               as Ordertype,
      comp_code             as CompanyCode,
      po_org                as Organisation,
      po_status             as OrderStat,
      supplier              as Supplier,
      imageurl              as Imageurl,
      created_by            as CreatedBy,
      created_date_time     as CreatedDateTime,
      changed_date_time     as ChangedDateTime,
      local_last_changed_by as LocalLastChangedBy,
      last_change_at,
      _PurchaseItems,
      _OrderType,
      _Supplier,
      _Status,
     _Status.StatusDesc

}
