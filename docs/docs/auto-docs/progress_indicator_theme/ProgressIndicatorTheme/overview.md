# Overview for `ProgressIndicatorTheme`

## Description

An inherited widget that defines the configuration for
 [ProgressIndicator]s in this widget's subtree.

 Values specified here are used for [ProgressIndicator] properties that are not
 given an explicit non-null value.

 

 Here is an example of a progress indicator theme that applies a red indicator
 color.

 ```dart
 const ProgressIndicatorTheme(
   data: ProgressIndicatorThemeData(
     color: Colors.red,
   ),
   child: 
 )
 ```
 

## Dependencies

- InheritedTheme

## Members

- **data**: `ProgressIndicatorThemeData`
  The properties for descendant [ProgressIndicator] widgets.

## Constructors

### Unnamed Constructor
Creates a theme that controls the configurations for [ProgressIndicator]
 widgets.

