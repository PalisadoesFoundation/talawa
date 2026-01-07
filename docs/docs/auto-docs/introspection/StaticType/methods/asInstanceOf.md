# Method: `asInstanceOf`

## Description

Returns a [NamedStaticType] having a [NamedStaticType.declaration] equal
 to the [declaration] passed here, while also being a supertype of `this`
 type.

 This is useful to obtain the type arguments required for a known
 superclass. Consider a class defined as `class MyMap implements
 Map&lt;Foo, Bar&gt;` and a macro interested in dealing with maps. Once that
 macro has resolved `MyMap` to a static type, it would call [asInstanceOf]
 with the type declaration of the `Map` type from `dart:core` to obtain the
 [NamedStaticType.typeArguments] required on `Map` to be a supertype of
 `MyMap` (`Foo` and `Bar`, in this case).

 To query whether this type is a subtype of a given type declaration, it
 is easier to resolve that type and then call [isSubtypeOf].

 Returns null if there is no instantiation of [declaration] that is a
 supertype of `this`.

## Return Type
`Future<NamedStaticType?>`

## Parameters

- `declaration`: `TypeDeclaration`
