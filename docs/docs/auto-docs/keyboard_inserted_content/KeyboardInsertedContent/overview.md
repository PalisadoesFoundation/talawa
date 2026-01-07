# Overview for `KeyboardInsertedContent`

## Description

A class representing rich content (such as a PNG image) inserted via the
 system input method.

 The following data is represented in this class:
  - MIME Type
  - Bytes
  - URI

## Members

- **mimeType**: `String`
  The mime type of the inserted content.

- **uri**: `String`
  The URI (location) of the inserted content, usually a "content://" URI.

- **data**: `Uint8List?`
  The bytedata of the inserted content.

## Constructors

### Unnamed Constructor
Creates an object to represent content that is inserted from the virtual
 keyboard.

 The mime type and URI will always be provided, but the bytedata may be null.

### fromJson
Converts JSON received from the Flutter Engine into the Dart class.

#### Parameters

- `metadata`: `Map&lt;String, dynamic&gt;`
