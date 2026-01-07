# Overview for `LinearProgressIndicator`

## Description

A Material Design linear progress indicator, also known as a progress bar.

 

 A widget that shows progress along a line. There are two kinds of linear
 progress indicators:

  * _Determinate_. Determinate progress indicators have a specific value at
    each point in time, and the value should increase monotonically from 0.0
    to 1.0, at which time the indicator is complete. To create a determinate
    progress indicator, use a non-null [value] between 0.0 and 1.0.
  * _Indeterminate_. Indeterminate progress indicators do not have a specific
    value at each point in time and instead indicate that progress is being
    made without indicating how much progress remains. To create an
    indeterminate progress indicator, use a null [value].

 The indicator line is displayed with [valueColor], an animated value. To
 specify a constant color value use: `AlwaysStoppedAnimation&lt;Color&gt;(color)`.

 The minimum height of the indicator can be specified using [minHeight].
 The indicator can be made taller by wrapping the widget with a [SizedBox].

 
 This example showcases determinate and indeterminate [LinearProgressIndicator]s.
 The [LinearProgressIndicator]s will use the ![updated Material 3 Design appearance](https://m3.material.io/components/progress-indicators/overview)
 when setting the [LinearProgressIndicator.year2023] flag to false.

 ** See code in examples/api/lib/material/progress_indicator/linear_progress_indicator.0.dart **
 

 
 This sample shows the creation of a [LinearProgressIndicator] with a changing value.
 When toggling the switch, [LinearProgressIndicator] uses a determinate value.
 As described in: https://m3.material.io/components/progress-indicators/overview

 ** See code in examples/api/lib/material/progress_indicator/linear_progress_indicator.1.dart **
 

 See also:

  * [CircularProgressIndicator], which shows progress along a circular arc.
  * [RefreshIndicator], which automatically displays a [CircularProgressIndicator]
    when the underlying vertical scrollable is overscrolled.
  * <https://material.io/design/components/progress-indicators.html#linear-progress-indicators>

## Dependencies

- ProgressIndicator

## Members

- **minHeight**: `double?`
  
 The minimum height of the line used to draw the linear indicator.

 If [LinearProgressIndicator.minHeight] is null then it will use the
 ambient [ProgressIndicatorThemeData.linearMinHeight]. If that is null
 it will use 4dp.
 

- **borderRadius**: `BorderRadiusGeometry?`
  The border radius of both the indicator and the track.

 If null, then the [ProgressIndicatorThemeData.borderRadius] will be used.
 If that is also null, then defaults to radius of 2, which produces a
 rounded shape with a rounded indicator. If [ThemeData.useMaterial3] is false,
 then defaults to [BorderRadius.zero], which produces a rectangular shape
 with a rectangular indicator.

- **stopIndicatorColor**: `Color?`
  The color of the stop indicator.

 If [year2023] is false or [ThemeData.useMaterial3] is false, then no stop
 indicator will be drawn.

 If null, then the [ProgressIndicatorThemeData.stopIndicatorColor] will be used.
 If that is null, then the [ColorScheme.primary] will be used.

- **stopIndicatorRadius**: `double?`
  The radius of the stop indicator.

 If [year2023] is false or [ThemeData.useMaterial3] is false, then no stop
 indicator will be drawn.

 Set [stopIndicatorRadius] to 0 to hide the stop indicator.

 If null, then the [ProgressIndicatorThemeData.stopIndicatorRadius] will be used.
 If that is null, then defaults to 2.

- **trackGap**: `double?`
  The gap between the indicator and the track.

 If [year2023] is false or [ThemeData.useMaterial3] is false, then no track
 gap will be drawn.

 Set [trackGap] to 0 to hide the track gap.

 If null, then the [ProgressIndicatorThemeData.trackGap] will be used.
 If that is null, then defaults to 4.

- **year2023**: `bool?`
  When true, the [LinearProgressIndicator] will use the 2023 Material Design 3
 appearance.

 If null, then the [ProgressIndicatorThemeData.year2023] will be used.
 If that is null, then defaults to true.

 If this is set to false, the [LinearProgressIndicator] will use the
 latest Material Design 3 appearance, which was introduced in December 2023.

 If [ThemeData.useMaterial3] is false, then this property is ignored.

## Constructors

### Unnamed Constructor
Creates a linear progress indicator.

 

