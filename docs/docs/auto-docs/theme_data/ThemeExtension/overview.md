# Overview for `ThemeExtension`

## Description

An interface that defines custom additions to a [ThemeData] object.

 

 Typically used for custom colors. To use, subclass [ThemeExtension],
 define a number of fields (e.g. [Color]s), and implement the [copyWith] and
 [lerp] methods. The latter will ensure smooth transitions of properties when
 switching themes.

 
 This sample shows how to create and use a subclass of [ThemeExtension] that
 defines two colors.

 ** See code in examples/api/lib/material/theme/theme_extension.1.dart **
 

## Constructors

### Unnamed Constructor
Enable const constructor for subclasses.

