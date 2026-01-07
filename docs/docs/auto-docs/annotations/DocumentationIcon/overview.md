# Overview for `DocumentationIcon`

## Description

A class annotation to provide a URL to an image that represents the class.

 Each class should only have one [DocumentationIcon].

 

 ```dart
  Utility class for beginning a dream-sharing sequence.
  ...documentation...
 @Category(<String>['Military Technology', 'Experimental'])
 @DocumentationIcon('https://docs.example.org/icons/top.png')
 class DreamSharing 
 ```
 

 See also:

  * [Category], to help place the class in an index.
  * [Summary], which is used to provide a one-line description of a
    class that overrides the inline documentations' own description.

## Members

- **url**: `String`
  The URL to an image that represents the annotated class.

## Constructors

### Unnamed Constructor
Create an annotation to provide a URL to an image describing a class.

