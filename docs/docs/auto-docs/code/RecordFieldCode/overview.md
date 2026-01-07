# Overview for `RecordFieldCode`

## Description

A piece of code identifying a syntactically valid record field declaration.
 This is only usable in the context of [RecordTypeAnnotationCode] objects.

 There is no distinction here made between named and positional fields.

 The name is not required because it is optional for positional fields.

 It is the job of the user to construct and combine these together in a way
 that creates valid record type annotations.

## Dependencies

- Code

## Members

- **name**: `String?`
- **type**: `TypeAnnotationCode`
## Constructors

### Unnamed Constructor


