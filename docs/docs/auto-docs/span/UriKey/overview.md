# Overview for `UriKey`

## Description

Use of a [Uri] defined by the [uri] and the [_kind] of use.

## Dependencies

- Key

## Members

- **uri**: `Uri`
- **_kind**: `_UriKind`
## Constructors

### _


#### Parameters

- `uri`: `dynamic`
- `_kind`: `dynamic`
### prefixDefinition
Creates a key for the definition of the prefix for [uri], that is,
 "prefix" in `import 'foo.dart' as prefix;`.

#### Parameters

- `uri`: `Uri`
### importPrefix
Creates a key for the prefix of the import of [uri], that is,
 "import 'foo.dart' as" in `import 'foo.dart' as prefix;`.

#### Parameters

- `uri`: `Uri`
### importSuffix
Creates a key for the suffix of the import of [uri], that is,
 ";\n" in

     import 'foo.dart' as prefix;

#### Parameters

- `uri`: `Uri`
