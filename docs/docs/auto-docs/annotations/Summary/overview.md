# Overview for `Summary`

## Description

An annotation that provides a short description of a class for use
 in an index.

 Usually the first paragraph of the documentation for a class can be used
 for this purpose, but on occasion the first paragraph is either too short
 or too long for use in isolation, without the remainder of the documentation.

 

 ```dart
  A famous cat.
 
  Instances of this class can hunt small animals.
  This cat has three legs.
 @Category(<String>['Animals', 'Cats'])
 @Category(<String>['Cute', 'Pets'])
 @DocumentationIcon('https://www.examples.net/docs/images/icons/pillar.jpeg')
 @Summary('A famous three-legged cat.')
 class Pillar extends Cat 
 ```
 

 See also:

  * [Category], to help place the class in an index.
  * [DocumentationIcon], which is used to give the URL to an image that
    represents the class.

## Members

- **text**: `String`
  The text of the summary of the annotated class.

## Constructors

### Unnamed Constructor
Create an annotation to provide a short description of a class.

