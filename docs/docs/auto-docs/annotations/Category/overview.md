# Overview for `Category`

## Description

A category with which to annotate a class, for documentation
 purposes.

 A category is usually represented as a section and a subsection, each
 of which is a string. The engineering team that owns the library to which
 the class belongs defines the categories used for classes in that library.
 For example, the Flutter engineering team has defined categories like
 "Basic/Buttons" and "Material Design/Buttons" for Flutter widgets.

 A class can have multiple categories.

 

 ```dart
  A copper coffee pot, as desired by Ben Turpin.
  ...documentation...
 @Category(<String>['Pots', 'Coffee'])
 @Category(<String>['Copper', 'Cookware'])
 @DocumentationIcon('https://example.com/images/coffee.png')
 @Summary('A proper cup of coffee is made in a proper copper coffee pot.')
 class CopperCoffeePot 
 ```
 

 See also:

  * [DocumentationIcon], which is used to give the URL to an image that
    represents the class.
  * [Summary], which is used to provide a one-line description of a
    class that overrides the inline documentations' own description.

## Members

- **sections**: `List&lt;String&gt;`
  The strings the correspond to the section and subsection of the
 category represented by this object.

 By convention, this list usually has two items. The allowed values
 are defined by the team that owns the library to which the annotated
 class belongs.

## Constructors

### Unnamed Constructor
Create an annotation to provide a categorization of a class.

