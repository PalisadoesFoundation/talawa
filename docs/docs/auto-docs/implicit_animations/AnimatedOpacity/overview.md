# Overview for `AnimatedOpacity`

## Description

Animated version of [Opacity] which automatically transitions the child's
 opacity over a given duration whenever the given opacity changes.

 

 Animating an opacity is relatively expensive because it requires painting
 the child into an intermediate buffer.

 Here's an illustration of what using this widget looks like, using a [curve]
 of [Curves.fastOutSlowIn].
 

 

 ```dart
 class LogoFade extends StatefulWidget 

 class LogoFadeState extends State&lt;LogoFade&gt; 
 ```
 

 ## Hit testing

 Setting the [opacity] to zero does not prevent hit testing from being
 applied to the descendants of the [AnimatedOpacity] widget. This can be
 confusing for the user, who may not see anything, and may believe the area
 of the interface where the [AnimatedOpacity] is hiding a widget to be
 non-interactive.

 With certain widgets, such as [Flow], that compute their positions only when
 they are painted, this can actually lead to bugs (from unexpected geometry
 to exceptions), because those widgets are not painted by the [AnimatedOpacity]
 widget at all when the [opacity] animation reaches zero.

 To avoid such problems, it is generally a good idea to use an
 [IgnorePointer] widget when setting the [opacity] to zero. This prevents
 interactions with any children in the subtree when the [child] is animating
 away.

 See also:

  * [AnimatedCrossFade], for fading between two children.
  * [AnimatedSwitcher], for fading between many children in sequence.
  * [FadeTransition], an explicitly animated version of this widget, where
    an [Animation] is provided by the caller instead of being built in.
  * [SliverAnimatedOpacity], for automatically transitioning a _sliver's_
    opacity over a given duration whenever the given opacity changes.

## Dependencies

- ImplicitlyAnimatedWidget

## Members

- **child**: `Widget?`
  The widget below this widget in the tree.

 

- **opacity**: `double`
  The target opacity.

 An opacity of 1.0 is fully opaque. An opacity of 0.0 is fully transparent
 (i.e., invisible).

- **alwaysIncludeSemantics**: `bool`
  Whether the semantic information of the children is always included.

 Defaults to false.

 When true, regardless of the opacity settings the child semantic
 information is exposed as if the widget were fully visible. This is
 useful in cases where labels may be hidden during animations that
 would otherwise contribute relevant semantics.

## Constructors

### Unnamed Constructor
Creates a widget that animates its opacity implicitly.

 The [opacity] argument must be between zero and one, inclusive.

