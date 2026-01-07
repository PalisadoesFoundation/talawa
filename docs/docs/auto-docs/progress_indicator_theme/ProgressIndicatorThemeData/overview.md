# Overview for `ProgressIndicatorThemeData`

## Description

Defines the visual properties of [ProgressIndicator] widgets.

 Used by [ProgressIndicatorTheme] to control the visual properties of
 progress indicators in a widget subtree.

 To obtain this configuration, use [ProgressIndicatorTheme.of] to access
 the closest ancestor [ProgressIndicatorTheme] of the current [BuildContext].

 See also:

  * [ProgressIndicatorTheme], an [InheritedWidget] that propagates the
    theme down its subtree.
  * [ThemeData.progressIndicatorTheme], which describes the defaults for
    any progress indicators as part of the application's [ThemeData].

## Dependencies

- Diagnosticable

## Members

- **color**: `Color?`
  The color of the [ProgressIndicator]'s indicator.

 If null, then it will use [ColorScheme.primary] of the ambient
 [ThemeData.colorScheme].

 See also:

  * [ProgressIndicator.color], which specifies the indicator color for a
    specific progress indicator.
  * [ProgressIndicator.valueColor], which specifies the indicator color
    a an animated color.

- **linearTrackColor**: `Color?`
  

- **linearMinHeight**: `double?`
  

- **circularTrackColor**: `Color?`
  

- **refreshBackgroundColor**: `Color?`
  

- **borderRadius**: `BorderRadiusGeometry?`
  Overrides the border radius of the [ProgressIndicator].

- **stopIndicatorColor**: `Color?`
  Overrides the stop indicator color of the [LinearProgressIndicator].

 If [LinearProgressIndicator.year2023] is false or [ThemeData.useMaterial3]
 is false, then no stop indicator will be drawn.

- **stopIndicatorRadius**: `double?`
  Overrides the stop indicator radius of the [LinearProgressIndicator].

 If [LinearProgressIndicator.year2023] is false or [ThemeData.useMaterial3]
 is false, then no stop indicator will be drawn.

- **strokeWidth**: `double?`
  Overrides the stroke width of the [CircularProgressIndicator].

- **strokeAlign**: `double?`
  Overrides the stroke align of the [CircularProgressIndicator].

- **strokeCap**: `StrokeCap?`
  Overrides the stroke cap of the [CircularProgressIndicator].

- **constraints**: `BoxConstraints?`
  Overrides the constraints of the [CircularProgressIndicator].

- **trackGap**: `double?`
  Overrides the active indicator and the background track.

 If [CircularProgressIndicator.year2023] is false or [ThemeData.useMaterial3]
 is false, then no track gap will be drawn.

 If [LinearProgressIndicator.year2023] is false or [ThemeData.useMaterial3]
 is false, then no track gap will be drawn.

- **circularTrackPadding**: `EdgeInsetsGeometry?`
  Overrides the padding of the [CircularProgressIndicator].

- **year2023**: `bool?`
  Overrides the [CircularProgressIndicator.year2023] and
 [LinearProgressIndicator.year2023] properties.

 When true, the [CircularProgressIndicator] and [LinearProgressIndicator]
 will use the 2023 Material Design 3 appearance. Defaults to true.

 If this is set to false, the [CircularProgressIndicator] and
 [LinearProgressIndicator] will use the latest Material Design 3 appearance,
 which was introduced in December 2023.

 If [ThemeData.useMaterial3] is false, then this property is ignored.

## Constructors

### Unnamed Constructor
Creates the set of properties used to configure [ProgressIndicator] widgets.

