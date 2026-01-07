# Overview for `TextSelectionTheme`

## Description

An inherited widget that defines the appearance of text selection in
 this widget's subtree.

 Values specified here are used for [TextField] and [SelectableText]
 properties that are not given an explicit non-null value.

 

 Here is an example of a text selection theme that applies a blue cursor
 color with light blue selection handles to the child text field.

 ```dart
 const TextSelectionTheme(
   data: TextSelectionThemeData(
     cursorColor: Colors.blue,
     selectionHandleColor: Colors.lightBlue,
   ),
   child: ,
 )
 ```
 

 This widget also creates a [DefaultSelectionStyle] for its subtree with
 [data].

## Dependencies

- InheritedTheme

## Members

- **data**: `TextSelectionThemeData`
  The properties for descendant [TextField] and [SelectableText] widgets.

- **_child**: `Widget`
## Constructors

### Unnamed Constructor
Creates a text selection theme widget that specifies the text
 selection properties for all widgets below it in the widget tree.

