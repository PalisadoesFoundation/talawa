# Overview for `SliverOpacity`

## Description

A sliver widget that makes its sliver child partially transparent.

 This class paints its sliver child into an intermediate buffer and then
 blends the sliver back into the scene partially transparent.

 For values of opacity other than 0.0 and 1.0, this class is relatively
 expensive because it requires painting the sliver child into an intermediate
 buffer. For the value 0.0, the sliver child is not painted at all.
 For the value 1.0, the sliver child is painted immediately without an
 intermediate buffer.

 

 This example shows a [SliverList] when the `_visible` member field is true,
 and hides it when it is false.

 This is more efficient than adding and removing the sliver child widget from
 the tree on demand, but it does not affect how much the list scrolls (the
 [SliverList] is still present, merely invisible).

 ** See code in examples/api/lib/widgets/sliver/sliver_opacity.1.dart **
 

 See also:

  * [Opacity], which can apply a uniform alpha effect to its child using the
    [RenderBox] layout protocol.
  * [AnimatedOpacity], which uses an animation internally to efficiently
    animate [Opacity].
  * [SliverVisibility], which can hide a child more efficiently (albeit less
    subtly, because it is either visible or hidden, rather than allowing
    fractional opacity values). Specifically, the [SliverVisibility.maintain]
    constructor is equivalent to using a sliver opacity widget with values of
    `0.0` or `1.0`.

## Dependencies

- SingleChildRenderObjectWidget

## Members

- **opacity**: `double`
  The fraction to scale the sliver child's alpha value.

 An opacity of 1.0 is fully opaque. An opacity of 0.0 is fully transparent
 (i.e. invisible).

 Values 1.0 and 0.0 are painted with a fast path. Other values
 require painting the sliver child into an intermediate buffer, which is
 expensive.

- **alwaysIncludeSemantics**: `bool`
  Whether the semantic information of the sliver child is always included.

 Defaults to false.

 When true, regardless of the opacity settings, the sliver child semantic
 information is exposed as if the widget were fully visible. This is
 useful in cases where labels may be hidden during animations that
 would otherwise contribute relevant semantics.

## Constructors

### Unnamed Constructor
Creates a sliver that makes its sliver child partially transparent.

 The [opacity] argument must be between zero and one, inclusive.

