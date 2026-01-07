# Method: `getData`

## Description

Retrieves data from the clipboard that matches the given format.

 The `format` argument specifies the media type, such as `text/plain`, of
 the data to obtain.

 Returns a future which completes to null if the data could not be
 obtained, and to a [ClipboardData] object if it could.

## Return Type
`Future<ClipboardData?>`

## Parameters

- `format`: `String`
