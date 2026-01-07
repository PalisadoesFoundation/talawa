# Method: `createScrollPosition`

## Description

Creates a [ScrollPosition] for use by a [Scrollable] widget.

 Subclasses can override this function to customize the [ScrollPosition]
 used by the scrollable widgets they control. For example, [PageController]
 overrides this function to return a page-oriented scroll position
 subclass that keeps the same page visible when the scrollable widget
 resizes.

 By default, returns a [ScrollPositionWithSingleContext].

 The arguments are generally passed to the [ScrollPosition] being created:

  * `physics`: An instance of [ScrollPhysics] that determines how the
    [ScrollPosition] should react to user interactions, how it should
    simulate scrolling when released or flung, etc. The value will not be
    null. It typically comes from the [ScrollView] or other widget that
    creates the [Scrollable], or, if none was provided, from the ambient
    [ScrollConfiguration].
  * `context`: A [ScrollContext] used for communicating with the object
    that is to own the [ScrollPosition] (typically, this is the
    [Scrollable] itself).
  * `oldPosition`: If this is not the first time a [ScrollPosition] has
    been created for this [Scrollable], this will be the previous instance.
    This is used when the environment has changed and the [Scrollable]
    needs to recreate the [ScrollPosition] object. It is null the first
    time the [ScrollPosition] is created.

## Return Type
`ScrollPosition`

## Parameters

- `physics`: `ScrollPhysics`
- `context`: `ScrollContext`
- `oldPosition`: `ScrollPosition?`
