# Overview for `CircularProgressIndicator`

## Description

A Material Design circular progress indicator, which spins to indicate that
 the application is busy.

 

 A widget that shows progress along a circle. There are two kinds of circular
 progress indicators:

  * _Determinate_. Determinate progress indicators have a specific value at
    each point in time, and the value should increase monotonically from 0.0
    to 1.0, at which time the indicator is complete. To create a determinate
    progress indicator, use a non-null [value] between 0.0 and 1.0.
  * _Indeterminate_. Indeterminate progress indicators do not have a specific
    value at each point in time and instead indicate that progress is being
    made without indicating how much progress remains. To create an
    indeterminate progress indicator, use a null [value].

 The indicator arc is displayed with [valueColor], an animated value. To
 specify a constant color use: `AlwaysStoppedAnimation&lt;Color&gt;(color)`.

 
 This example showcases determinate and indeterminate [CircularProgressIndicator]s.
 The [CircularProgressIndicator]s will use the ![updated Material 3 Design appearance](https://m3.material.io/components/progress-indicators/overview)
 when setting the [CircularProgressIndicator.year2023] flag to false.

 ** See code in examples/api/lib/material/progress_indicator/circular_progress_indicator.0.dart **
 

 
 This sample shows the creation of a [CircularProgressIndicator] with a changing value.
 When toggling the switch, [CircularProgressIndicator] uses a determinate value.
 As described in: https://m3.material.io/components/progress-indicators/overview

 ** See code in examples/api/lib/material/progress_indicator/circular_progress_indicator.1.dart **
 

 See also:

  * [LinearProgressIndicator], which displays progress along a line.
  * [RefreshIndicator], which automatically displays a [CircularProgressIndicator]
    when the underlying vertical scrollable is overscrolled.
  * <https://material.io/design/components/progress-indicators.html#circular-progress-indicators>

## Dependencies

- ProgressIndicator

## Members

- **_indicatorType**: `_ActivityIndicatorType`
- **strokeWidth**: `double?`
  The width of the line used to draw the circle.

- **strokeAlign**: `double?`
  The relative position of the stroke on a [CircularProgressIndicator].

 Values typically range from -1.0 ([strokeAlignInside], inside stroke)
 to 1.0 ([strokeAlignOutside], outside stroke),
 without any bound constraints (e.g., a value of -2.0 is not typical, but allowed).
 A value of 0 ([strokeAlignCenter]) will center the border
 on the edge of the widget.

 If [year2023] is true, then the default value is [strokeAlignCenter].
 Otherwise, the default value is [strokeAlignInside].

- **strokeCap**: `StrokeCap?`
  The progress indicator's line ending.

 This determines the shape of the stroke ends of the progress indicator.
 By default, [strokeCap] is null.
 When [value] is null (indeterminate), the stroke ends are set to
 [StrokeCap.square]. When [value] is not null, the stroke
 ends are set to [StrokeCap.butt].

 Setting [strokeCap] to [StrokeCap.round] will result in a rounded end.
 Setting [strokeCap] to [StrokeCap.butt] with [value] == null will result
 in a slightly different indeterminate animation; the indicator completely
 disappears and reappears on its minimum value.
 Setting [strokeCap] to [StrokeCap.square] with [value] != null will
 result in a different display of [value]. The indicator will start
 drawing from slightly less than the start, and end slightly after
 the end. This will produce an alternative result, as the
 default behavior, for example, that a [value] of 0.5 starts at 90 degrees
 and ends at 270 degrees. With [StrokeCap.square], it could start 85
 degrees and end at 275 degrees.

- **constraints**: `BoxConstraints?`
  Defines minimum and maximum sizes for a [CircularProgressIndicator].

 If null, then the [ProgressIndicatorThemeData.constraints] will be used.
 Otherwise, defaults to a minimum width and height of 36 pixels.

- **trackGap**: `double?`
  The gap between the active indicator and the background track.

 If [year2023] is false or [ThemeData.useMaterial3] is false, then no track
 gap will be drawn.

 Set [trackGap] to 0 to hide the track gap.

 If null, then the [ProgressIndicatorThemeData.trackGap] will be used.
 If that is null, then defaults to 4.

- **year2023**: `bool?`
  When true, the [CircularProgressIndicator] will use the 2023 Material Design 3
 appearance.

 If null, then the [ProgressIndicatorThemeData.year2023] will be used.
 If that is null, then defaults to true.

 If this is set to false, the [CircularProgressIndicator] will use the
 latest Material Design 3 appearance, which was introduced in December 2023.

 If [ThemeData.useMaterial3] is false, then this property is ignored.

- **padding**: `EdgeInsetsGeometry?`
  The padding around the indicator track.

 If null, then the [ProgressIndicatorThemeData.circularTrackPadding] will be
 used. If that is null and [year2023] is false, then defaults to `EdgeInsets.all(4.0)`
 padding. Otherwise, defaults to zero padding.

- **strokeAlignInside**: `double`
  The indicator stroke is drawn fully inside of the indicator path.

 This is a constant for use with [strokeAlign].

- **strokeAlignCenter**: `double`
  The indicator stroke is drawn on the center of the indicator path,
 with half of the [strokeWidth] on the inside, and the other half
 on the outside of the path.

 This is a constant for use with [strokeAlign].

 This is the default value for [strokeAlign].

- **strokeAlignOutside**: `double`
  The indicator stroke is drawn on the outside of the indicator path.

 This is a constant for use with [strokeAlign].

## Constructors

### Unnamed Constructor
Creates a circular progress indicator.

 

### adaptive
Creates an adaptive progress indicator that is a
 [CupertinoActivityIndicator] on [TargetPlatform.iOS] &
 [TargetPlatform.macOS] and a [CircularProgressIndicator] in material
 theme/non-Apple platforms.

 The [valueColor], [strokeWidth], [strokeAlign], [strokeCap],
 [semanticsLabel], [semanticsValue], [trackGap], [year2023] will be
 ignored on iOS & macOS.

 

#### Parameters

- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
