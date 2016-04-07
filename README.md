# FileUploader
An image uploader for TinyMCE written in JQuery, JAVA, with Spring and Bootstrap frameworks

### App Info
- TinyMCE integration on index.jsp
- Bootstrap modals appear upon clicking "Show Uploaded Images" and the TinyMCE tool button "Upload an Image"
- There is no "Post Blog" or "Submit" button because this app is just the uploader, not a CMS system
- app-upload.js contains all JQuery and Ajax calls for opening the modals and sending the file information to the back-end
- At the back-end the data flows >> controller >> dao >> MySql and results in the file bite array being written as a MySQL blob
- From back to front the data flows >> MySQL >> dao >> controller at which a REST endpoint (/upload/showImage/{id}) can be turned into a standard image tag &lt;img src="yourbaseurl/upload/showImage/{id}"&gt; and is popped to the TinyMCE editor
