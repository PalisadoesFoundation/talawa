# Overview for `Visibility`

## Description

Whether to show or hide a child.

 By default, the [visible] property controls whether the [child] is included
 in the subtree or not; when it is not [visible], the [replacement] child
 (typically a zero-sized box) is included instead.

 A variety of flags can be used to tweak exactly how the child is hidden.
 (Changing the flags dynamically is discouraged, as it can cause the [child]
 subtree to be rebuilt, with any state in the subtree being discarded.
 Typically, only the [visible] flag is changed dynamically.)

 These widgets provide some of the facets of this one:

  * [Opacity], which can stop its child from being painted.
  * [Offstage], which can stop its child from being laid out or painted.
  * [TickerMode], which can stop its child from being animated.
  * [ExcludeSemantics], which can hide the child from accessibility tools.
  * [IgnorePointer], which can disable touch interactions with the child.

 Using this widget is not necessary to hide children. The simplest way to
 hide a child is just to not include it, or, if a child _must_ be given (e.g.
 because the parent is a [StatelessWidget]) then to use [SizedBox.shrink]
 instead of the child that would otherwise be included.

 See also:

  * [AnimatedSwitcher], which can fade from one child to the next as the
    subtree changes.
  * [AnimatedCrossFade], which can fade between two specific children.
  * [SliverVisibility], the sliver equivalent of this widget.

## Dependencies

- StatelessWidget

## Members

- **child**: `Widget`
  The widget to show or hide, as controlled by [visible].

 

- **replacement**: `Widget`
  The widget to use when the child is not [visible], assuming that none of
 the `maintain` flags (in particular, [maintainState]) are set.

 The normal behavior is to replace the widget with a zero by zero box
 ([SizedBox.shrink]).

 See also:

  * [AnimatedCrossFade], which can animate between two children.

- **visible**: `bool`
  Switches between showing the [child] or hiding it.

 The `maintain` flags should be set to the same values regardless of the
 state of the [visible] property, otherwise they will not operate correctly
 (specifically, the state will be lost regardless of the state of
 [maintainState] whenever any of the `maintain` flags are changed, since
 doing so will result in a subtree shape change).

 Unless [maintainState] is set, the [child] subtree will be disposed
 (removed from the tree) while hidden.

- **maintainState**: `bool`
  Whether to maintain the [State] objects of the [child] subtree when it is
 not [visible].

 Keeping the state of the subtree is potentially expensive (because it
 means all the objects are still in memory; their resources are not
 released). It should only be maintained if it cannot be recreated on
 demand. One example of when the state would be maintained is if the child
 subtree contains a [Navigator], since that widget maintains elaborate
 state that cannot be recreated on the fly.

 If this property is true, an [Offstage] widget is used to hide the child
 instead of replacing it with [replacement].

 If this property is false, then [maintainAnimation] must also be false.

 Dynamically changing this value may cause the current state of the
 subtree to be lost (and a new instance of the subtree, with new [State]
 objects, to be immediately created if [visible] is true).

- **maintainAnimation**: `bool`
  Whether to maintain animations within the [child] subtree when it is
 not [visible].

 To set this, [maintainState] must also be set.

 Keeping animations active when the widget is not visible is even more
 expensive than only maintaining the state.

 One example when this might be useful is if the subtree is animating its
 layout in time with an [AnimationController], and the result of that
 layout is being used to influence some other logic. If this flag is false,
 then any [AnimationController]s hosted inside the [child] subtree will be
 muted while the [visible] flag is false.

 If this property is true, no [TickerMode] widget is used.

 If this property is false, then [maintainSize] must also be false.

 Dynamically changing this value may cause the current state of the
 subtree to be lost (and a new instance of the subtree, with new [State]
 objects, to be immediately created if [visible] is true).

- **maintainSize**: `bool`
  Whether to maintain space for where the widget would have been.

 To set this, [maintainAnimation] and [maintainState] must also be set.

 Maintaining the size when the widget is not [visible] is not notably more
 expensive than just keeping animations running without maintaining the
 size, and may in some circumstances be slightly cheaper if the subtree is
 simple and the [visible] property is frequently toggled, since it avoids
 triggering a layout change when the [visible] property is toggled. If the
 [child] subtree is not trivial then it is significantly cheaper to not
 even keep the state (see [maintainState]).

 If this property is false, [Offstage] is used.

 If this property is false, then [maintainSemantics] and
 [maintainInteractivity] must also be false.

 Dynamically changing this value may cause the current state of the
 subtree to be lost (and a new instance of the subtree, with new [State]
 objects, to be immediately created if [visible] is true).

 See also:

  * [AnimatedOpacity] and [FadeTransition], which apply animations to the
    opacity for a more subtle effect.

- **maintainSemantics**: `bool`
  Whether to maintain the semantics for the widget when it is hidden (e.g.
 for accessibility).

 To set this, [maintainSize] must also be set.

 By default, with [maintainSemantics] set to false, the [child] is not
 visible to accessibility tools when it is hidden from the user. If this
 flag is set to true, then accessibility tools will report the widget as if
 it was present.

- **maintainInteractivity**: `bool`
  Whether to allow the widget to be interactive when hidden.

 To set this, [maintainSize] must also be set.

 By default, with [maintainInteractivity] set to false, touch events cannot
 reach the [child] when it is hidden from the user. If this flag is set to
 true, then touch events will nonetheless be passed through.

## Constructors

### Unnamed Constructor
Control whether the given [child] is [visible].

 The [maintainSemantics] and [maintainInteractivity] arguments can only be
 set if [maintainSize] is set.

 The [maintainSize] argument can only be set if [maintainAnimation] is set.

 The [maintainAnimation] argument can only be set if [maintainState] is
 set.

### maintain
Control whether the given [child] is [visible].

 This is equivalent to the default [Visibility] constructor with all
 "maintain" fields set to true. This constructor should be used in place of
 an [Opacity] widget that only takes on values of `0.0` or `1.0`, as it
 avoids extra compositing when fully opaque.

#### Parameters

- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
