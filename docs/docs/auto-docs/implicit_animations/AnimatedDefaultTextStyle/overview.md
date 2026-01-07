# Overview for `AnimatedDefaultTextStyle`

## Description

Animated version of [DefaultTextStyle] which automatically transitions the
 default text style (the text style to apply to descendant [Text] widgets
 without explicit style) over a given duration whenever the given style
 changes.

 The [textAlign], [softWrap], [overflow], [maxLines], [textWidthBasis]
 and [textHeightBehavior] properties are not animated and take effect
 immediately when changed.

 Here's an illustration of what using this widget looks like, using a [curve]
 of [Curves.elasticInOut].
 

 For the animation, you can choose a [curve] as well as a [duration] and the
 widget will automatically animate to the new default text style. If you require
 more control over the animation (e.g. if you want to stop it mid-animation),
 consider using a [DefaultTextStyleTransition] instead, which takes a provided
 [Animation] as argument. While that allows you to fine-tune the animation,
 it also requires more development overhead as you have to manually manage
 the lifecycle of the underlying [AnimationController].

## Dependencies

- ImplicitlyAnimatedWidget

## Members

- **child**: `Widget`
  The widget below this widget in the tree.

 

- **style**: `TextStyle`
  The target text style.

 When this property is changed, the style will be animated over [duration] time.

- **textAlign**: `TextAlign?`
  How the text should be aligned horizontally.

 This property takes effect immediately when changed, it is not animated.

- **softWrap**: `bool`
  Whether the text should break at soft line breaks.

 This property takes effect immediately when changed, it is not animated.

 See [DefaultTextStyle.softWrap] for more details.

- **overflow**: `TextOverflow`
  How visual overflow should be handled.

 This property takes effect immediately when changed, it is not animated.

- **maxLines**: `int?`
  An optional maximum number of lines for the text to span, wrapping if necessary.

 This property takes effect immediately when changed, it is not animated.

 See [DefaultTextStyle.maxLines] for more details.

- **textWidthBasis**: `TextWidthBasis`
  The strategy to use when calculating the width of the Text.

 See [TextWidthBasis] for possible values and their implications.

- **textHeightBehavior**: `ui.TextHeightBehavior?`
  

## Constructors

### Unnamed Constructor
Creates a widget that animates the default text style implicitly.

