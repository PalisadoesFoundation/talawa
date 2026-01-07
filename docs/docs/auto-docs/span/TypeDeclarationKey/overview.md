# Overview for `TypeDeclarationKey`

## Description

The root key for content of [typeDeclaration].

 This is used as the root key for the parts of the declaration of
 [typeDeclaration] that can be shared amongst members.

 For instance when to intermediate augmentation libraries generate members
 for the same class we have

     // intermediate augmentation library #0
     ...
     augment class Foo 
     ...

     // intermediate augmentation library #1
     ...
     augment class Foo 
     ...

 and the merged augmentation library merges these to same the class
 declaration:

     ...
     augment class Foo 
     ...

 In this case the declaration "augment class Foo ", the body start "\n" use keys with the same [TypeDeclarationKey] as parent.

## Dependencies

- Key

## Members

- **typeDeclaration**: `TypeDeclaration`
## Constructors

### Unnamed Constructor


