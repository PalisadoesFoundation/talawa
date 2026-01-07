# Overview for `ScrollPositionWithSingleContext`

## Description

A scroll position that manages scroll activities for a single
 [ScrollContext].

 This class is a concrete subclass of [ScrollPosition] logic that handles a
 single [ScrollContext], such as a [Scrollable]. An instance of this class
 manages [ScrollActivity] instances, which change what content is visible in
 the [Scrollable]'s [Viewport].

 

 See also:

  * [ScrollPosition], which defines the underlying model for a position
    within a [Scrollable] but is agnostic as to how that position is
    changed.
  * [ScrollView] and its subclasses such as [ListView], which use
    [ScrollPositionWithSingleContext] to manage their scroll position.
  * [ScrollController], which can manipulate one or more [ScrollPosition]s,
    and which uses [ScrollPositionWithSingleContext] as its default class for
    scroll positions.

## Dependencies

- ScrollPosition, ScrollActivityDelegate

## Members

- **_heldPreviousVelocity**: `double`
  Velocity from a previous activity temporarily held by [hold] to potentially
 transfer to a next activity.

- **_userScrollDirection**: `ScrollDirection`
- **_currentDrag**: `ScrollDragController?`
## Constructors

### Unnamed Constructor
Create a [ScrollPosition] object that manages its behavior using
 [ScrollActivity] objects.

 The `initialPixels` argument can be null, but in that case it is
 imperative that the value be set, using [correctPixels], as soon as
 [applyNewDimensions] is invoked, before calling the inherited
 implementation of that method.

 If [keepScrollOffset] is true (the default), the current scroll offset is
 saved with [PageStorage] and restored it if this scroll position's scrollable
 is recreated.

