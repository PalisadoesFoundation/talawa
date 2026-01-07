# Overview for `SliverFadeTransition`

## Description

Animates the opacity of a sliver widget.

 
 Creates a [CustomScrollView] with a [SliverFixedExtentList] that uses a
 [SliverFadeTransition] to fade the list in and out.

 ** See code in examples/api/lib/widgets/transitions/sliver_fade_transition.0.dart **
 

 Here's an illustration of the [FadeTransition] widget, the [RenderBox]
 equivalent widget, with it's [opacity] animated by a [CurvedAnimation] set
 to [Curves.fastOutSlowIn]:

 

 ## Hit testing

 Setting the [opacity] to zero does not prevent hit testing from being
 applied to the descendants of the [SliverFadeTransition] widget. This can be
 confusing for the user, who may not see anything, and may believe the area
 of the interface where the [SliverFadeTransition] is hiding a widget to be
 non-interactive.

 With certain widgets, such as [Flow], that compute their positions only when
 they are painted, this can actually lead to bugs (from unexpected geometry
 to exceptions), because those widgets are not painted by the
 [SliverFadeTransition] widget at all when the [opacity] animation reaches
 zero.

 To avoid such problems, it is generally a good idea to combine this widget
 with a [SliverIgnorePointer] that one enables when the [opacity] animation
 reaches zero. This prevents interactions with any children in the subtree
 when the sliver is not visible. For performance reasons, when implementing
 this, care should be taken not to rebuild the relevant widget (e.g. by
 calling [State.setState]) except at the transition point.

 See also:

  * [SliverOpacity], which does not animate changes in opacity.
  * [FadeTransition], the box version of this widget.

## Dependencies

- SingleChildRenderObjectWidget

## Members

- **opacity**: `Animation&lt;double&gt;`
  The animation that controls the opacity of the sliver child.

 If the current value of the opacity animation is v, the child will be
 painted with an opacity of v. For example, if v is 0.5, the child will be
 blended 50% with its background. Similarly, if v is 0.0, the child will be
 completely transparent.

- **alwaysIncludeSemantics**: `bool`
  Whether the semantic information of the sliver child is always included.

 Defaults to false.

 When true, regardless of the opacity settings the sliver child's semantic
 information is exposed as if the widget were fully visible. This is
 useful in cases where labels may be hidden during animations that
 would otherwise contribute relevant semantics.

## Constructors

### Unnamed Constructor
Creates an opacity transition.

