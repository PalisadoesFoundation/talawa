# Overview for `Link`

## Description

References to filesystem links.

## Dependencies

- FileSystemEntity

## Constructors

### Unnamed Constructor
Creates a Link object.

### fromRawPath


#### Parameters

- `rawPath`: `Uint8List`
### fromUri
Creates a [Link] object.

 If [path] is a relative path, it will be interpreted relative to the
 current working directory (see [Directory.current]), when used.

 If [path] is an absolute path, it will be immune to changes to the
 current working directory.

#### Parameters

- `uri`: `Uri`
