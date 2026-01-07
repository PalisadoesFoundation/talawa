# Overview for `SliverVisibility`

## Description

Whether to show or hide a sliver child.

 By default, the [visible] property controls whether the [sliver] is included
 in the subtree or not; when it is not [visible], the [replacementSliver] is
 included instead.

 A variety of flags can be used to tweak exactly how the sliver is hidden.
 (Changing the flags dynamically is discouraged, as it can cause the [sliver]
 subtree to be rebuilt, with any state in the subtree being discarded.
 Typically, only the [visible] flag is changed dynamically.)

 These widgets provide some of the facets of this one:

  * [SliverOpacity], which can stop its sliver child from being painted.
  * [SliverOffstage], which can stop its sliver child from being laid out or
    painted.
  * [TickerMode], which can stop its child from being animated.
  * [ExcludeSemantics], which can hide the child from accessibility tools.
  * [SliverIgnorePointer], which can disable touch interactions with the
    sliver child.

 Using this widget is not necessary to hide children. The simplest way to
 hide a child is just to not include it. If a child _must_ be given (e.g.
 because the parent is a [StatelessWidget]), then including a childless
 [SliverToBoxAdapter] instead of the child that would otherwise be included
 is typically more efficient than using [SliverVisibility].

 See also:

  * [Visibility], the equivalent widget for boxes.

## Dependencies

- StatelessWidget

## Members

- **sliver**: `Widget`
  The sliver to show or hide, as controlled by [visible].

- **replacementSliver**: `Widget`
  The widget to use when the sliver child is not [visible], assuming that
 none of the `maintain` flags (in particular, [maintainState]) are set.

 The normal behavior is to replace the widget with a childless
 [SliverToBoxAdapter], which by default has a geometry of
 [SliverGeometry.zero].

- **visible**: `bool`
  Switches between showing the [sliver] or hiding it.

 The `maintain` flags should be set to the same values regardless of the
 state of the [visible] property, otherwise they will not operate correctly
 (specifically, the state will be lost regardless of the state of
 [maintainState] whenever any of the `maintain` flags are changed, since
 doing so will result in a subtree shape change).

 Unless [maintainState] is set, the [sliver] subtree will be disposed
 (removed from the tree) while hidden.

- **maintainState**: `bool`
  Whether to maintain the [State] objects of the [sliver] subtree when it is
 not [visible].

 Keeping the state of the subtree is potentially expensive (because it
 means all the objects are still in memory; their resources are not
 released). It should only be maintained if it cannot be recreated on
 demand. One example of when the state would be maintained is if the sliver
 subtree contains a [Navigator], since that widget maintains elaborate
 state that cannot be recreated on the fly.

 If this property is true, a [SliverOffstage] widget is used to hide the
 sliver instead of replacing it with [replacementSliver].

 If this property is false, then [maintainAnimation] must also be false.

 Dynamically changing this value may cause the current state of the
 subtree to be lost (and a new instance of the subtree, with new [State]
 objects, to be immediately created if [visible] is true).

- **maintainAnimation**: `bool`
  Whether to maintain animations within the [sliver] subtree when it is
 not [visible].

 To set this, [maintainState] must also be set.

 Keeping animations active when the widget is not visible is even more
 expensive than only maintaining the state.

 One example when this might be useful is if the subtree is animating its
 layout in time with an [AnimationController], and the result of that
 layout is being used to influence some other logic. If this flag is false,
 then any [AnimationController]s hosted inside the [sliver] subtree will be
 muted while the [visible] flag is false.

 If this property is true, no [TickerMode] widget is used.

 If this property is false, then [maintainSize] must also be false.

 Dynamically changing this value may cause the current state of the
 subtree to be lost (and a new instance of the subtree, with new [State]
 objects, to be immediately created if [visible] is true).

- **maintainSize**: `bool`
  Whether to maintain space for where the sliver would have been.

 To set this, [maintainAnimation] must also be set.

 Maintaining the size when the sliver is not [visible] is not notably more
 expensive than just keeping animations running without maintaining the
 size, and may in some circumstances be slightly cheaper if the subtree is
 simple and the [visible] property is frequently toggled, since it avoids
 triggering a layout change when the [visible] property is toggled. If the
 [sliver] subtree is not trivial then it is significantly cheaper to not
 even keep the state (see [maintainState]).

 If this property is false, [SliverOffstage] is used.

 If this property is false, then [maintainSemantics] and
 [maintainInteractivity] must also be false.

 Dynamically changing this value may cause the current state of the
 subtree to be lost (and a new instance of the subtree, with new [State]
 objects, to be immediately created if [visible] is true).

- **maintainSemantics**: `bool`
  Whether to maintain the semantics for the sliver when it is hidden (e.g.
 for accessibility).

 To set this, [maintainSize] must also be set.

 By default, with [maintainSemantics] set to false, the [sliver] is not
 visible to accessibility tools when it is hidden from the user. If this
 flag is set to true, then accessibility tools will report the widget as if
 it was present.

- **maintainInteractivity**: `bool`
  Whether to allow the sliver to be interactive when hidden.

 To set this, [maintainSize] must also be set.

 By default, with [maintainInteractivity] set to false, touch events cannot
 reach the [sliver] when it is hidden from the user. If this flag is set to
 true, then touch events will nonetheless be passed through.

## Constructors

### Unnamed Constructor
Control whether the given [sliver] is [visible].

 The [maintainSemantics] and [maintainInteractivity] arguments can only be
 set if [maintainSize] is set.

 The [maintainSize] argument can only be set if [maintainAnimation] is set.

 The [maintainAnimation] argument can only be set if [maintainState] is
 set.

### maintain
Control whether the given [sliver] is [visible].

 This is equivalent to the default [SliverVisibility] constructor with all
 "maintain" fields set to true. This constructor should be used in place of
 a [SliverOpacity] widget that only takes on values of `0.0` or `1.0`, as it
 avoids extra compositing when fully opaque.

#### Parameters

- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
