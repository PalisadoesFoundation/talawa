# Overview for `ProgressIndicator`

## Description

A base class for Material Design progress indicators.

 This widget cannot be instantiated directly. For a linear progress
 indicator, see [LinearProgressIndicator]. For a circular progress indicator,
 see [CircularProgressIndicator].

 See also:

  * <https://material.io/components/progress-indicators>

## Dependencies

- StatefulWidget

## Members

- **value**: `double?`
  If non-null, the value of this progress indicator.

 A value of 0.0 means no progress and 1.0 means that progress is complete.
 The value will be clamped to be in the range 0.0-1.0.

 If null, this progress indicator is indeterminate, which means the
 indicator displays a predetermined animation that does not indicate how
 much actual progress is being made.

- **backgroundColor**: `Color?`
  The progress indicator's background color.

 It is up to the subclass to implement this in whatever way makes sense
 for the given use case. See the subclass documentation for details.

- **color**: `Color?`
  
 The progress indicator's color.

 This is only used if [ProgressIndicator.valueColor] is null.
 If [ProgressIndicator.color] is also null, then the ambient
 [ProgressIndicatorThemeData.color] will be used. If that
 is null then the current theme's [ColorScheme.primary] will
 be used by default.
 

- **valueColor**: `Animation<Color?>?`
  The progress indicator's color as an animated value.

 If null, the progress indicator is rendered with [color]. If that is null,
 then it will use the ambient [ProgressIndicatorThemeData.color]. If that
 is also null then it defaults to the current theme's [ColorScheme.primary].

- **semanticsLabel**: `String?`
  
 The [SemanticsProperties.label] for this progress indicator.

 This value indicates the purpose of the progress bar, and will be
 read out by screen readers to indicate the purpose of this progress
 indicator.
 

- **semanticsValue**: `String?`
  
 The [SemanticsProperties.value] for this progress indicator.

 This will be used in conjunction with the [semanticsLabel] by
 screen reading software to identify the widget, and is primarily
 intended for use with determinate progress indicators to announce
 how far along they are.

 For determinate progress indicators, this will be defaulted to
 [ProgressIndicator.value] expressed as a percentage, i.e. `0.1` will
 become '10%'.
 

## Constructors

### Unnamed Constructor
Creates a progress indicator.

 
 The [value] argument can either be null for an indeterminate
 progress indicator, or a non-null value between 0.0 and 1.0 for a
 determinate progress indicator.

 ## Accessibility

 The [semanticsLabel] can be used to identify the purpose of this progress
 bar for screen reading software. The [semanticsValue] property may be used
 for determinate progress indicators to indicate how much progress has been made.
 

