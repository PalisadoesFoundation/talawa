# Overview for `SliverAnimatedOpacity`

## Description

Animated version of [SliverOpacity] which automatically transitions the
 sliver child's opacity over a given duration whenever the given opacity
 changes.

 Animating an opacity is relatively expensive because it requires painting
 the sliver child into an intermediate buffer.

 Here's an illustration of what using this widget looks like, using a [curve]
 of [Curves.fastOutSlowIn].

 
 Creates a [CustomScrollView] with a [SliverFixedExtentList] and a
 [FloatingActionButton]. Pressing the button animates the lists' opacity.

 ** See code in examples/api/lib/widgets/implicit_animations/sliver_animated_opacity.0.dart **
 

 ## Hit testing

 Setting the [opacity] to zero does not prevent hit testing from being
 applied to the descendants of the [SliverAnimatedOpacity] widget. This can
 be confusing for the user, who may not see anything, and may believe the
 area of the interface where the [SliverAnimatedOpacity] is hiding a widget
 to be non-interactive.

 With certain widgets, such as [Flow], that compute their positions only when
 they are painted, this can actually lead to bugs (from unexpected geometry
 to exceptions), because those widgets are not painted by the
 [SliverAnimatedOpacity] widget at all when the [opacity] animation reaches
 zero.

 To avoid such problems, it is generally a good idea to use a
 [SliverIgnorePointer] widget when setting the [opacity] to zero. This
 prevents interactions with any children in the subtree when the [sliver] is
 animating away.

 See also:

  * [SliverFadeTransition], an explicitly animated version of this widget, where
    an [Animation] is provided by the caller instead of being built in.
  * [AnimatedOpacity], for automatically transitioning a box child's
    opacity over a given duration whenever the given opacity changes.

## Dependencies

- ImplicitlyAnimatedWidget

## Members

- **sliver**: `Widget?`
  The sliver below this widget in the tree.

- **opacity**: `double`
  The target opacity.

 An opacity of 1.0 is fully opaque. An opacity of 0.0 is fully transparent
 (i.e., invisible).

- **alwaysIncludeSemantics**: `bool`
  Whether the semantic information of the children is always included.

 Defaults to false.

 When true, regardless of the opacity settings the sliver child's semantic
 information is exposed as if the widget were fully visible. This is
 useful in cases where labels may be hidden during animations that
 would otherwise contribute relevant semantics.

## Constructors

### Unnamed Constructor
Creates a widget that animates its opacity implicitly.

 The [opacity] argument must be between zero and one, inclusive.

