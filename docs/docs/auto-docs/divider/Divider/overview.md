# Overview for `Divider`

## Description

A thin horizontal line, with padding on either side.

 In the Material Design language, this represents a divider. Dividers can be
 used in lists, [Drawer]s, and elsewhere to separate content.

 To create a divider between [ListTile] items, consider using
 [ListTile.divideTiles], which is optimized for this case.

 

 The box's total height is controlled by [height]. The appropriate
 padding is automatically computed from the height.

 
 This sample shows how to display a Divider between an orange and blue box
 inside a column. The Divider is 20 logical pixels in height and contains a
 vertically centered black line that is 5 logical pixels thick. The black
 line is indented by 20 logical pixels.

 ![](https://flutter.github.io/assets-for-api-docs/assets/material/divider.png)

 ** See code in examples/api/lib/material/divider/divider.0.dart **
 

 
 This sample shows the creation of [Divider] widget, as described in:
 https://m3.material.io/components/divider/overview

 ** See code in examples/api/lib/material/divider/divider.1.dart **
 

 See also:

  * [PopupMenuDivider], which is the equivalent but for popup menus.
  * [ListTile.divideTiles], another approach to dividing widgets in a list.
  * [VerticalDivider], which is the vertical analog of this widget.
  * <https://material.io/design/components/dividers.html>

## Dependencies

- StatelessWidget

## Members

- **height**: `double?`
  The divider's height extent.

 The divider itself is always drawn as a horizontal line that is centered
 within the height specified by this value.

 If this is null, then the [DividerThemeData.space] is used. If that is
 also null, then this defaults to 16.0.

- **thickness**: `double?`
  The thickness of the line drawn within the divider.

 
 A divider with a [thickness] of 0.0 is always drawn as a line with a
 height of exactly one device pixel.

 If this is null, then the [DividerThemeData.thickness] is used. If
 that is also null, then this defaults to 0.0.
 

- **indent**: `double?`
  The amount of empty space to the leading edge of the divider.

 
 If this is null, then the [DividerThemeData.indent] is used. If that is
 also null, then this defaults to 0.0.
 

- **endIndent**: `double?`
  The amount of empty space to the trailing edge of the divider.

 
 If this is null, then the [DividerThemeData.endIndent] is used. If that is
 also null, then this defaults to 0.0.
 

- **radius**: `BorderRadiusGeometry?`
  The amount of radius for the border of the divider.

 
 If this is null, then the default radius of [BoxDecoration] will be used.
 

- **color**: `Color?`
  
 The color to use when painting the line.

 If this is null, then the [DividerThemeData.color] is used. If that is
 also null, then [ThemeData.dividerColor] is used.
 

 

 ```dart
 const Divider(
   color: Colors.deepOrange,
 )
 ```
 

## Constructors

### Unnamed Constructor
Creates a Material Design divider.

 The [height], [thickness], [indent], and [endIndent] must be null or
 non-negative.

