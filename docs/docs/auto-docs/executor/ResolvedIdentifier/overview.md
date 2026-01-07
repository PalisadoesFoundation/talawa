# Overview for `ResolvedIdentifier`

## Description

A resolved [Identifier], this is used when creating augmentation libraries
 to qualify identifiers where needed.

## Dependencies

- Identifier

## Members

- **uri**: `Uri?`
  The import URI for the library that defines the member that is referenced
 by this identifier.

 If this identifier is an instance member or a built-in type, like
 `void`, [uri] is `null`.

- **kind**: `IdentifierKind`
  Type of identifier this is (instance, static, top level).

- **name**: `String`
  The unqualified name of this identifier.

- **staticScope**: `String?`
  If this is a static member, then the name of the fully qualified scope
 surrounding this member. Should not contain a trailing `.`.

 Typically this would just be the name of a type.

## Constructors

### Unnamed Constructor


