# Overview for `PlaceholderDimensions`

## Description

Holds the [Size] and baseline required to represent the dimensions of
 a placeholder in text.

 Placeholders specify an empty space in the text layout, which is used
 to later render arbitrary inline widgets into defined by a [WidgetSpan].

 See also:

  * [WidgetSpan], a subclass of [InlineSpan] and [PlaceholderSpan] that
    represents an inline widget embedded within text. The space this
    widget takes is indicated by a placeholder.
  * [RichText], a text widget that supports text inline widgets.

## Members

- **empty**: `PlaceholderDimensions`
  A constant representing an empty placeholder.

- **size**: `Size`
  Width and height dimensions of the placeholder.

- **alignment**: `ui.PlaceholderAlignment`
  How to align the placeholder with the text.

 See also:

  * [baseline], the baseline to align to when using
    [dart:ui.PlaceholderAlignment.baseline],
    [dart:ui.PlaceholderAlignment.aboveBaseline],
    or [dart:ui.PlaceholderAlignment.belowBaseline].
  * [baselineOffset], the distance of the alphabetic baseline from the upper
    edge of the placeholder.

- **baselineOffset**: `double?`
  Distance of the [baseline] from the upper edge of the placeholder.

 Only used when [alignment] is [ui.PlaceholderAlignment.baseline].

- **baseline**: `TextBaseline?`
  The [TextBaseline] to align to. Used with:

  * [ui.PlaceholderAlignment.baseline]
  * [ui.PlaceholderAlignment.aboveBaseline]
  * [ui.PlaceholderAlignment.belowBaseline]
  * [ui.PlaceholderAlignment.middle]

## Constructors

### Unnamed Constructor
Constructs a [PlaceholderDimensions] with the specified parameters.

 The `size` and `alignment` are required as a placeholder's dimensions
 require at least `size` and `alignment` to be fully defined.

