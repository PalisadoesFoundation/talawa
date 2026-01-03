# Method: `prepareAttachmentData`

## Description

Prepares attachment data for upload.

 **params**:
 * `objectName`: The name of the object in Minio storage.
 * `fileHash`: The SHA-256 hash of the file.
 * `name`: The name of the file.
 * `mimeType`: The MIME type of the file.

 **returns**:
 * `Map<String, String>`: A map containing attachment data.

## Return Type
`Map<String, String>`

## Parameters

- `objectName`: `String`
- `fileHash`: `String`
- `name`: `String`
- `mimeType`: `String`
