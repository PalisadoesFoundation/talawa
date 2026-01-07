# Overview for `ContentKey`

## Description

Content defined by its [_kind] and [index] within the [parent] key.

## Dependencies

- Key

## Members

- **parent**: `Key`
- **index**: `int`
- **_kind**: `_ContentKind`
## Constructors

### _


#### Parameters

- `parent`: `dynamic`
- `index`: `dynamic`
- `_kind`: `dynamic`
### code
Create the key for a [Code] object occurring as the [index]th part of
 [parent].

#### Parameters

- `parent`: `Key`
- `index`: `int`
### string
Create the key for a [String] occurring as the [index]th part of [parent].

#### Parameters

- `parent`: `Key`
- `index`: `int`
### implicitThis
Create the key for a `this.` occurring as the [index]th part of [parent].

#### Parameters

- `parent`: `Key`
- `index`: `int`
### prefixDot
Create the key for a `.` after a prefix occurring as the [index]th part
 of [parent].

#### Parameters

- `parent`: `Key`
- `index`: `int`
### staticScope
Create the key for a static qualifier `Foo.` of a static member access in
 `Foo` occurring as the [index]th part of [parent].

#### Parameters

- `parent`: `Key`
- `index`: `int`
### identifierName
Create the key for an [Identifier] after a prefix occurring as the
 [index]th part of [parent].

#### Parameters

- `parent`: `Key`
- `index`: `int`
### libraryAugmentation
Create the key the [index]th library augmentation in [parent].

#### Parameters

- `parent`: `Key`
- `index`: `int`
### libraryAugmentationSeparator
Create the key the separator text after the [index]th library augmentation
 in [parent].

#### Parameters

- `parent`: `Key`
- `index`: `int`
