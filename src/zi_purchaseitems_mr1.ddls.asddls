@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'PO item basic view'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZI_PURCHASEITEMS_mr1
  as select from ZPOITEMS_DB_MR1
  association [1] to ZI_PURCHASEHEADER_mr1 as _PurchaseOrder on $projection.PurchaseOrderno = _PurchaseOrder.PurchaseOrderno
  association [1] to I_Currency            as _Currency      on $projection.PriceUnit = _Currency.Currency
{
  key po_order                                                        as PurchaseOrderno,
  key po_item                                                         as PurchaseItem,
      short_text                                                      as ShortText,
      material                                                        as Material,
      plant                                                           as Plant,
      mat_group                                                       as MatGroup,
      @Semantics.quantity.unitOfMeasure: 'OrderUnit'
      order_qunt                                                      as OrderQunt,
      order_unit                                                      as OrderUnit,
      @Semantics.amount.currencyCode: 'PriceUnit'
      product_price                                                   as ProductPrice,
      price_unit                                                      as PriceUnit,
      @Semantics.amount.currencyCode: 'PriceUnit'
      cast( cast( order_qunt as abap.dec( 10,2 ) ) *
            cast( product_price as abap.dec(10,2)) as abap.dec(10,2)) as ItemPrice,
      local_last_changed_by                                           as LocalLastChangedBy,
      _PurchaseOrder,
      _Currency
}
