# Overview for `Code`

## Description

The base class representing an arbitrary chunk of Dart code, which may or
 may not be syntactically or semantically valid yet.

## Members

- **parts**: `List&lt;Object&gt;`
  All the chunks of [Code], raw [String]s, [Identifier]s, or
 [OmittedTypeAnnotation]s that comprise this [Code] object.

 Note that [OmittedTypeAnnotation] objects can only be provided through
 the [OmittedTypeAnnotationCode] wrapper instance, but will appear in
 the [parts] of those, so they must be handled whenever iterating [parts].

## Constructors

### fromString


#### Parameters

- `code`: `String`
### fromParts


#### Parameters

- `parts`: `dynamic`
