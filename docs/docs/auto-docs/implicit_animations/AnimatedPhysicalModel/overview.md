# Overview for `AnimatedPhysicalModel`

## Description

Animated version of [PhysicalModel].

 The [borderRadius] and [elevation] are animated.

 The [color] is animated if the [animateColor] property is set; otherwise,
 the color changes immediately at the start of the animation for the other
 two properties. This allows the color to be animated independently (e.g.
 because it is being driven by an [AnimatedTheme]).

 The [shape] is not animated.

 Here's an illustration of what using this widget looks like, using a [curve]
 of [Curves.fastOutSlowIn].
 

## Dependencies

- ImplicitlyAnimatedWidget

## Members

- **child**: `Widget`
  The widget below this widget in the tree.

 

- **shape**: `BoxShape`
  The type of shape.

 This property is not animated.

- **clipBehavior**: `Clip`
  

 Defaults to [Clip.none].

- **borderRadius**: `BorderRadius?`
  The target border radius of the rounded corners for a rectangle shape.

 If null, treated as [BorderRadius.zero].

- **elevation**: `double`
  The target z-coordinate relative to the parent at which to place this
 physical object.

 The value will always be non-negative.

- **color**: `Color`
  The target background color.

- **animateColor**: `bool`
  Whether the color should be animated.

- **shadowColor**: `Color`
  The target shadow color.

- **animateShadowColor**: `bool`
  Whether the shadow color should be animated.

## Constructors

### Unnamed Constructor
Creates a widget that animates the properties of a [PhysicalModel].

 The [elevation] must be non-negative.

 Animating [color] is optional and is controlled by the [animateColor] flag.

 Animating [shadowColor] is optional and is controlled by the [animateShadowColor] flag.

