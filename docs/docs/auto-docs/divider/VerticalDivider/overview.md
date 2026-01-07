# Overview for `VerticalDivider`

## Description

A thin vertical line, with padding on either side.

 In the Material Design language, this represents a divider. Vertical
 dividers can be used in horizontally scrolling lists, such as a
 [ListView] with [ListView.scrollDirection] set to [Axis.horizontal].

 The box's total width is controlled by [width]. The appropriate
 padding is automatically computed from the width.

 
 This sample shows how to display a [VerticalDivider] between a purple and orange box
 inside a [Row]. The [VerticalDivider] is 20 logical pixels in width and contains a
 horizontally centered black line that is 1 logical pixels thick. The grey
 line is indented by 20 logical pixels.

 ** See code in examples/api/lib/material/divider/vertical_divider.0.dart **
 

 
 This sample shows the creation of [VerticalDivider] widget, as described in:
 https://m3.material.io/components/divider/overview

 ** See code in examples/api/lib/material/divider/vertical_divider.1.dart **
 

 See also:

  * [ListView.separated], which can be used to generate vertical dividers.
  * [Divider], which is the horizontal analog of this widget.
  * <https://material.io/design/components/dividers.html>

## Dependencies

- StatelessWidget

## Members

- **width**: `double?`
  The divider's width.

 The divider itself is always drawn as a vertical line that is centered
 within the width specified by this value.

 If this is null, then the [DividerThemeData.space] is used. If that is
 also null, then this defaults to 16.0.

- **thickness**: `double?`
  The thickness of the line drawn within the divider.

 A divider with a [thickness] of 0.0 is always drawn as a line with a
 width of exactly one device pixel.

 If this is null, then the [DividerThemeData.thickness] is used which
 defaults to 0.0.

- **indent**: `double?`
  The amount of empty space on top of the divider.

 If this is null, then the [DividerThemeData.indent] is used. If that is
 also null, then this defaults to 0.0.

- **endIndent**: `double?`
  The amount of empty space under the divider.

 If this is null, then the [DividerThemeData.endIndent] is used. If that is
 also null, then this defaults to 0.0.

- **color**: `Color?`
  The color to use when painting the line.

 If this is null, then the [DividerThemeData.color] is used. If that is
 also null, then [ThemeData.dividerColor] is used.

 

 ```dart
 const Divider(
   color: Colors.deepOrange,
 )
 ```
 

- **radius**: `BorderRadiusGeometry?`
  The amount of radius for the border of the divider.

 If this is null, then the default radius of [BoxDecoration] will be used.

## Constructors

### Unnamed Constructor
Creates a Material Design vertical divider.

 The [width], [thickness], [indent], and [endIndent] must be null or
 non-negative.

