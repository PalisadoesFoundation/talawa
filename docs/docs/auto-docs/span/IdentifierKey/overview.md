# Overview for `IdentifierKey`

## Description

Key defined be the [identifier] its use [_kind] occurring as the [index]th
 part of [parent].

## Dependencies

- Key

## Members

- **parent**: `Key`
- **identifier**: `Identifier`
- **index**: `int`
- **_kind**: `_IdentifierKind`
## Constructors

### _


#### Parameters

- `parent`: `dynamic`
- `index`: `dynamic`
- `identifier`: `dynamic`
- `_kind`: `dynamic`
### enum_
Identifier for an enum value.

#### Parameters

- `parent`: `Key`
- `index`: `int`
- `identifier`: `Identifier`
### superclass
Identifier for an extended type.

#### Parameters

- `parent`: `Key`
- `identifier`: `Identifier`
### mixin
Identifier for a mixed in type.

#### Parameters

- `parent`: `Key`
- `index`: `int`
- `identifier`: `Identifier`
### interface
Identifier for an implemented type.

#### Parameters

- `parent`: `Key`
- `index`: `int`
- `identifier`: `Identifier`
### member
Identifier for an augmented member.

#### Parameters

- `parent`: `Key`
- `index`: `int`
- `identifier`: `Identifier`
