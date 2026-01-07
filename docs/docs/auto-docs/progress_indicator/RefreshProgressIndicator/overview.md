# Overview for `RefreshProgressIndicator`

## Description

An indicator for the progress of refreshing the contents of a widget.

 Typically used for swipe-to-refresh interactions. See [RefreshIndicator] for
 a complete implementation of swipe-to-refresh driven by a [Scrollable]
 widget.

 The indicator arc is displayed with [valueColor], an animated value. To
 specify a constant color use: `AlwaysStoppedAnimation&lt;Color&gt;(color)`.

 See also:

  * [RefreshIndicator], which automatically displays a [CircularProgressIndicator]
    when the underlying vertical scrollable is overscrolled.

## Dependencies

- CircularProgressIndicator

## Members

- **elevation**: `double`
  

- **indicatorMargin**: `EdgeInsetsGeometry`
  The amount of space by which to inset the whole indicator.
 It accommodates the [elevation] of the indicator.

- **indicatorPadding**: `EdgeInsetsGeometry`
  The amount of space by which to inset the inner refresh indicator.

- **defaultStrokeWidth**: `double`
  Default stroke width.

## Constructors

### Unnamed Constructor
Creates a refresh progress indicator.

 Rather than creating a refresh progress indicator directly, consider using
 a [RefreshIndicator] together with a [Scrollable] widget.

 

