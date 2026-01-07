# Overview for `FadeTransition`

## Description

Animates the opacity of a widget.

 For a widget that automatically animates between the sizes of two children,
 fading between them, see [AnimatedCrossFade].

 

 Here's an illustration of the [FadeTransition] widget, with it's [opacity]
 animated by a [CurvedAnimation] set to [Curves.fastOutSlowIn]:

 
 The following code implements the [FadeTransition] using
 the Flutter logo:

 ** See code in examples/api/lib/widgets/transitions/fade_transition.0.dart **
 

 ## Hit testing

 Setting the [opacity] to zero does not prevent hit testing from being
 applied to the descendants of the [FadeTransition] widget. This can be
 confusing for the user, who may not see anything, and may believe the area
 of the interface where the [FadeTransition] is hiding a widget to be
 non-interactive.

 With certain widgets, such as [Flow], that compute their positions only when
 they are painted, this can actually lead to bugs (from unexpected geometry
 to exceptions), because those widgets are not painted by the [FadeTransition]
 widget at all when the [opacity] animation reaches zero.

 To avoid such problems, it is generally a good idea to combine this widget
 with an [IgnorePointer] that one enables when the [opacity] animation
 reaches zero. This prevents interactions with any children in the subtree
 when the [child] is not visible. For performance reasons, when implementing
 this, care should be taken not to rebuild the relevant widget (e.g. by
 calling [State.setState]) except at the transition point.

 See also:

  * [Opacity], which does not animate changes in opacity.
  * [AnimatedOpacity], which animates changes in opacity without taking an
    explicit [Animation] argument.
  * [SliverFadeTransition], the sliver version of this widget.

## Dependencies

- SingleChildRenderObjectWidget

## Members

- **opacity**: `Animation&lt;double&gt;`
  The animation that controls the opacity of the child.

 If the current value of the opacity animation is v, the child will be
 painted with an opacity of v. For example, if v is 0.5, the child will be
 blended 50% with its background. Similarly, if v is 0.0, the child will be
 completely transparent.

- **alwaysIncludeSemantics**: `bool`
  Whether the semantic information of the children is always included.

 Defaults to false.

 When true, regardless of the opacity settings the child semantic
 information is exposed as if the widget were fully visible. This is
 useful in cases where labels may be hidden during animations that
 would otherwise contribute relevant semantics.

## Constructors

### Unnamed Constructor
Creates an opacity transition.

