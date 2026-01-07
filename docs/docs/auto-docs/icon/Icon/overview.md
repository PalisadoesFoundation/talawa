# Overview for `Icon`

## Description

A graphical icon widget drawn with a glyph from a font described in
 an [IconData] such as material's predefined [IconData]s in [Icons].

 Icons are not interactive. For an interactive icon, consider material's
 [IconButton].

 There must be an ambient [Directionality] widget when using [Icon].
 Typically this is introduced automatically by the [WidgetsApp] or
 [MaterialApp].

 This widget assumes that the rendered icon is squared. Non-squared icons may
 render incorrectly.

 

 This example shows how to create a [Row] of [Icon]s in different colors and
 sizes. The first [Icon] uses a [semanticLabel] to announce in accessibility
 modes like TalkBack and VoiceOver.

 ![The following code snippet would generate a row of icons consisting of a pink heart, a green musical note, and a blue umbrella, each progressively bigger than the last.](https://flutter.github.io/assets-for-api-docs/assets/widgets/icon.png)

 ```dart
 const Row(
   mainAxisAlignment: MainAxisAlignment.spaceAround,
   children: <Widget>[
     Icon(
       Icons.favorite,
       color: Colors.pink,
       size: 24.0,
       semanticLabel: 'Text to announce in accessibility modes',
     ),
     Icon(
       Icons.audiotrack,
       color: Colors.green,
       size: 30.0,
     ),
     Icon(
       Icons.beach_access,
       color: Colors.blue,
       size: 36.0,
     ),
   ],
 )
 ```
 

 See also:

  * [IconButton], for interactive icons.
  * [Icons], for the list of available Material Icons for use with this class.
  * [IconTheme], which provides ambient configuration for icons.
  * [ImageIcon], for showing icons from [AssetImage]s or other [ImageProvider]s.

## Dependencies

- StatelessWidget

## Members

- **icon**: `IconData?`
  The icon to display. The available icons are described in [Icons].

 The icon can be null, in which case the widget will render as an empty
 space of the specified [size].

- **size**: `double?`
  The size of the icon in logical pixels.

 Icons occupy a square with width and height equal to size.

 Defaults to the nearest [IconTheme]'s [IconThemeData.size].

 If this [Icon] is being placed inside an [IconButton], then use
 [IconButton.iconSize] instead, so that the [IconButton] can make the splash
 area the appropriate size as well. The [IconButton] uses an [IconTheme] to
 pass down the size to the [Icon].

- **fill**: `double?`
  The fill for drawing the icon.

 Requires the underlying icon font to support the `FILL` [FontVariation]
 axis, otherwise has no effect. Variable font filenames often indicate
 the supported axes. Must be between 0.0 (unfilled) and 1.0 (filled),
 inclusive.

 Can be used to convey a state transition for animation or interaction.

 Defaults to nearest [IconTheme]'s [IconThemeData.fill].

 See also:
  * [weight], for controlling stroke weight.
  * [grade], for controlling stroke weight in a more granular way.
  * [opticalSize], for controlling optical size.

- **weight**: `double?`
  The stroke weight for drawing the icon.

 Requires the underlying icon font to support the `wght` [FontVariation]
 axis, otherwise has no effect. Variable font filenames often indicate
 the supported axes. Must be greater than 0.

 Defaults to nearest [IconTheme]'s [IconThemeData.weight].

 See also:
  * [fill], for controlling fill.
  * [grade], for controlling stroke weight in a more granular way.
  * [opticalSize], for controlling optical size.
  * https://fonts.google.com/knowledge/glossary/weight_axis

- **grade**: `double?`
  The grade (granular stroke weight) for drawing the icon.

 Requires the underlying icon font to support the `GRAD` [FontVariation]
 axis, otherwise has no effect. Variable font filenames often indicate
 the supported axes. Can be negative.

 Grade and [weight] both affect a symbol's stroke weight (thickness), but
 grade has a smaller impact on the size of the symbol.

 Grade is also available in some text fonts. One can match grade levels
 between text and symbols for a harmonious visual effect. For example, if
 the text font has a -25 grade value, the symbols can match it with a
 suitable value, say -25.

 Defaults to nearest [IconTheme]'s [IconThemeData.grade].

 See also:
  * [fill], for controlling fill.
  * [weight], for controlling stroke weight in a less granular way.
  * [opticalSize], for controlling optical size.
  * https://fonts.google.com/knowledge/glossary/grade_axis

- **opticalSize**: `double?`
  The optical size for drawing the icon.

 Requires the underlying icon font to support the `opsz` [FontVariation]
 axis, otherwise has no effect. Variable font filenames often indicate
 the supported axes. Must be greater than 0.

 For an icon to look the same at different sizes, the stroke weight
 (thickness) must change as the icon size scales. Optical size offers a way
 to automatically adjust the stroke weight as icon size changes.

 Defaults to nearest [IconTheme]'s [IconThemeData.opticalSize].

 See also:
  * [fill], for controlling fill.
  * [weight], for controlling stroke weight.
  * [grade], for controlling stroke weight in a more granular way.
  * https://fonts.google.com/knowledge/glossary/optical_size_axis

- **color**: `Color?`
  The color to use when drawing the icon.

 Defaults to the nearest [IconTheme]'s [IconThemeData.color].

 The color (whether specified explicitly here or obtained from the
 [IconTheme]) will be further adjusted by the nearest [IconTheme]'s
 [IconThemeData.opacity].

 
 Typically, a Material Design color will be used, as follows:

 ```dart
 Icon(
   Icons.widgets,
   color: Colors.blue.shade400,
 )
 ```
 

- **shadows**: `List&lt;Shadow&gt;?`
  A list of [Shadow]s that will be painted underneath the icon.

 Multiple shadows are supported to replicate lighting from multiple light
 sources.

 Shadows must be in the same order for [Icon] to be considered as
 equivalent as order produces differing transparency.

 Defaults to the nearest [IconTheme]'s [IconThemeData.shadows].

- **semanticLabel**: `String?`
  Semantic label for the icon.

 Announced by assistive technologies (e.g TalkBack/VoiceOver).
 This label does not show in the UI.

  * [SemanticsProperties.label], which is set to [semanticLabel] in the
    underlying	 [Semantics] widget.

- **textDirection**: `TextDirection?`
  The text direction to use for rendering the icon.

 If this is null, the ambient [Directionality] is used instead.

 Some icons follow the reading direction. For example, "back" buttons point
 left in left-to-right environments and right in right-to-left
 environments. Such icons have their [IconData.matchTextDirection] field
 set to true, and the [Icon] widget uses the [textDirection] to determine
 the orientation in which to draw the icon.

 This property has no effect if the [icon]'s [IconData.matchTextDirection]
 field is false, but for consistency a text direction value must always be
 specified, either directly using this property or using [Directionality].

- **applyTextScaling**: `bool?`
  Whether to scale the size of this widget using the ambient [MediaQuery]'s [TextScaler].

 This is specially useful when you have an icon associated with a text, as
 scaling the text without scaling the icon would result in a confusing
 interface.

 Defaults to the nearest [IconTheme]'s
 [IconThemeData.applyTextScaling].

- **blendMode**: `BlendMode?`
  The [BlendMode] to apply to the foreground of the icon.

 Defaults to [BlendMode.srcOver]

## Constructors

### Unnamed Constructor
Creates an icon.

