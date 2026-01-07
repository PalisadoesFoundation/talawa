# Overview for `DefaultTextStyleTransition`

## Description

Animated version of a [DefaultTextStyle] that animates the different properties
 of its [TextStyle].

 
 The following code implements the [DefaultTextStyleTransition] that shows
 a transition between thick blue font and thin red font.

 ** See code in examples/api/lib/widgets/transitions/default_text_style_transition.0.dart **
 

 See also:

  * [AnimatedDefaultTextStyle], which animates changes in text style without
    taking an explicit [Animation] argument.
  * [DefaultTextStyle], which also defines a [TextStyle] for its descendants
    but is not animated.

## Dependencies

- AnimatedWidget

## Members

- **textAlign**: `TextAlign?`
  How the text should be aligned horizontally.

- **softWrap**: `bool`
  Whether the text should break at soft line breaks.

 See [DefaultTextStyle.softWrap] for more details.

- **overflow**: `TextOverflow`
  How visual overflow should be handled.

- **maxLines**: `int?`
  An optional maximum number of lines for the text to span, wrapping if necessary.

 See [DefaultTextStyle.maxLines] for more details.

- **child**: `Widget`
  The widget below this widget in the tree.

 

## Constructors

### Unnamed Constructor
Creates an animated [DefaultTextStyle] whose [TextStyle] animation updates
 the widget.

