# Overview for `DefaultTextStyle`

## Description

The text style to apply to descendant [Text] widgets which don't have an
 explicit style.

 
 This example shows how to use [DefaultTextStyle.merge] to create a default
 text style that inherits styling information from the current default text
 style and overrides some properties.

 ** See code in examples/api/lib/widgets/text/text.0.dart **
 

 See also:

  * [AnimatedDefaultTextStyle], which animates changes in the text style
    smoothly over a given duration.
  * [DefaultTextStyleTransition], which takes a provided [Animation] to
    animate changes in text style smoothly over time.

## Dependencies

- InheritedTheme

## Members

- **style**: `TextStyle`
  The text style to apply.

- **textAlign**: `TextAlign?`
  How each line of text in the Text widget should be aligned horizontally.

- **softWrap**: `bool`
  Whether the text should break at soft line breaks.

 If false, the glyphs in the text will be positioned as if there was unlimited horizontal space.

 This also decides the [overflow] property's behavior. If this is true or null,
 the glyph causing overflow, and those that follow, will not be rendered.

- **overflow**: `TextOverflow`
  How visual overflow should be handled.

 If [softWrap] is true or null, the glyph causing overflow, and those that follow,
 will not be rendered. Otherwise, it will be shown with the given overflow option.

- **maxLines**: `int?`
  An optional maximum number of lines for the text to span, wrapping if necessary.
 If the text exceeds the given number of lines, it will be truncated according
 to [overflow].

 If this is 1, text will not wrap. Otherwise, text will be wrapped at the
 edge of the box.

 If this is non-null, it will override even explicit null values of
 [Text.maxLines].

- **textWidthBasis**: `TextWidthBasis`
  The strategy to use when calculating the width of the Text.

 See [TextWidthBasis] for possible values and their implications.

- **textHeightBehavior**: `ui.TextHeightBehavior?`
  

## Constructors

### Unnamed Constructor
Creates a default text style for the given subtree.

 Consider using [DefaultTextStyle.merge] to inherit styling information
 from the current default text style for a given [BuildContext].

 The [maxLines] property may be null (and indeed defaults to null), but if
 it is not null, it must be greater than zero.

### fallback
A const-constructable default text style that provides fallback values.

 Returned from [of] when the given [BuildContext] doesn't have an enclosing default text style.

 This constructor creates a [DefaultTextStyle] with an invalid [child], which
 means the constructed value cannot be incorporated into the tree.

#### Parameters

- ``: `dynamic`
