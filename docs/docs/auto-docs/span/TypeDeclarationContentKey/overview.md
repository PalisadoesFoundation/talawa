# Overview for `TypeDeclarationContentKey`

## Description

Content of a [TypeDeclaration].

## Dependencies

- Key

## Members

- **parent**: `Key`
- **_kind**: `_TypeDeclarationContentKind`
## Constructors

### _


#### Parameters

- `parent`: `dynamic`
- `_kind`: `dynamic`
### declaration
The declaration of the type declaration, that is, "augment class Foo " in
 `augment class Foo `.

#### Parameters

- `parent`: `Key`
### mixins
The fixed parts of a with-clause, that is, "with " and ", " in
 `augment class Foo with Bar, Baz `.

#### Parameters

- `parent`: `Key`
### interfaces
The fixed parts of an implements-clause, that is, "implements " and ", "
 in `augment class Foo implements Bar, Baz `.

#### Parameters

- `parent`: `Key`
### superclass
The fixed parts of an extends-clause, that is, "extends " in
 `augment class Foo extends Bar `.

#### Parameters

- `parent`: `Key`
### bodyStart
The start of the declaration body, that is, "\n" in

     augment class Foo implements Bar, Baz 

#### Parameters

- `parent`: `Key`
### typeParametersStart
The start of the type parameters, that is, "<" in

     augment class Foo&lt;T&gt; 

#### Parameters

- `parent`: `Key`
### typeParametersEnd
The end of the type parameters, that is, ">" in

     augment class Foo&lt;T&gt; 

#### Parameters

- `parent`: `Key`
