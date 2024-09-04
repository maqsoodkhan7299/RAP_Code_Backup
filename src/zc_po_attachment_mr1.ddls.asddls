@EndUserText.label: 'consuption view of attachment'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@UI: {
    headerInfo: {
        typeName: 'Attachment',
        typeNamePlural: 'Attachments',

        title: {
            type: #STANDARD,
            value: 'Purchaseordernumber' },

        description: { type: #STANDARD,
            value: 'Purchaseordernumber' } },
            presentationVariant: [{
    sortOrder: [{ by: 'Purchaseordernumber',
        direction: #ASC }],
    visualizations: [{ type: #AS_LINEITEM }]
}]
}
define view entity ZC_PO_Attachment_mr1
  as projection on ZI_PO_attachment_mr1
{
      @UI.facet: [{
          id: 'GeneralInfo',
//          purpose: #STANDARD,
          position: 10,
          label: 'General Information',
          type: #COLLECTION
      },
      {
          id: 'Invoicedet',
          parentId: 'GeneralInfo',
          purpose: #STANDARD,
          position: 10,
          label: 'General Information',
          type: #IDENTIFICATION_REFERENCE
      },
      {
          id: 'Upload',
          parentId: 'GeneralInfo',
          purpose: #STANDARD,
          position: 30,
          label: 'General Information',
          type: #FIELDGROUP_REFERENCE,
          targetQualifier: 'Upload'
      }]
  @UI.lineItem: [{ position: 10, label: 'Purchase Order' }]
  @UI.identification: [{ position: 10, label: 'Purchase Order' }]
  key Purchaseordernumber,
  
  @UI.lineItem: [{ position: 20, label: 'Attachment Id' }]
  @UI.identification: [{ position: 20, label: 'Attachment ID' }]
  key AttachId,
  
  @UI.lineItem: [{ position: 30, label: 'Attachment' }]
 @UI.fieldGroup: [{ position: 50, label: 'Attachments', qualifier: 'Upload' }]
      Attachment,
      
      @UI.hidden: true
      MimeType,
      
      @UI.lineItem: [{ position: 40, label: 'Attachment2' }]
      @UI.hidden: true
      Filename,
      
//      @Semantics.systemDateTime.lastChangedAt: true
//      LastChangeAt,
    
      /* Associations */
      _Header : redirected to parent ZC_PURCHASEHEADERTP_mr1
}
