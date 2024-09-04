@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'attachment interface view'
define view entity ZI_PO_attachment_mr1 as select from zpo_attachment
association to parent ZI_PURCHASEHEADERTP_MR1 as _Header
    on $projection.Purchaseordernumber = _Header.PurchaseOrderno
{
    key zpo_attachment.purchaseordernumber as Purchaseordernumber,
    key zpo_attachment.attach_id as AttachId,
    @Semantics.largeObject: {
        mimeType: 'MimeType',
        fileName: 'Filename',
        contentDispositionPreference: #INLINE
    }
    zpo_attachment.attachment as Attachment,
    
    @Semantics.mimeType: true
    zpo_attachment.mimetype as MimeType,
    
    zpo_attachment.filename as Filename,
    
//     @Semantics.systemDateTime.lastChangedAt: true
//    zpo_attachment.last_change_at as LastChangeAt,
    _Header // Make association public
}
