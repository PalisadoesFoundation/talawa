# Overview for `MouseTrackerAnnotation`

## Description

The annotation object used to annotate regions that are interested in mouse
 movements.

 To use an annotation, return this object as a [HitTestEntry] in a hit test.
 Typically this is implemented by making a [RenderBox] implement this class
 (see [RenderMouseRegion]).

 [MouseTracker] uses this class as a label to filter the hit test results. Hit
 test entries that are also [MouseTrackerAnnotation]s are considered as valid
 targets in terms of computing mouse related effects, such as enter events,
 exit events, and mouse cursor events.

 See also:

  * [MouseTracker], which uses [MouseTrackerAnnotation].

## Dependencies

- Diagnosticable

## Members

- **onEnter**: `PointerEnterEventListener?`
  Triggered when a mouse pointer, with or without buttons pressed, has
 entered the region and [validForMouseTracker] is true.

 This callback is triggered when the pointer has started to be contained by
 the region, either due to a pointer event, or due to the movement or
 disappearance of the region. This method is always matched by a later
 [onExit].

 See also:

  * [onExit], which is triggered when a mouse pointer exits the region.
  * [MouseRegion.onEnter], which uses this callback.

- **onExit**: `PointerExitEventListener?`
  Triggered when a mouse pointer, with or without buttons pressed, has
 exited the region and [validForMouseTracker] is true.

 This callback is triggered when the pointer has stopped being contained
 by the region, either due to a pointer event, or due to the movement or
 disappearance of the region. This method always matches an earlier
 [onEnter].

 See also:

  * [onEnter], which is triggered when a mouse pointer enters the region.
  * [MouseRegion.onExit], which uses this callback, but is not triggered in
    certain cases and does not always match its earlier [MouseRegion.onEnter].

- **cursor**: `MouseCursor`
  The mouse cursor for mouse pointers that are hovering over the region.

 When a mouse enters the region, its cursor will be changed to the [cursor].
 When the mouse leaves the region, the cursor will be set by the region
 found at the new location.

 Defaults to [MouseCursor.defer], deferring the choice of cursor to the next
 region behind it in hit-test order.

 See also:

  * [MouseRegion.cursor], which provide values to this field.

- **validForMouseTracker**: `bool`
  Whether this is included when [MouseTracker] collects the list of
 annotations.

 If [validForMouseTracker] is false, this object is excluded from the
 current annotation list even if it's included in the hit test, affecting
 mouse-related behavior such as enter events, exit events, and mouse
 cursors. The [validForMouseTracker] does not affect hit testing.

 The [validForMouseTracker] is true for [MouseTrackerAnnotation]s built by
 the constructor.

## Constructors

### Unnamed Constructor
Creates an immutable [MouseTrackerAnnotation].

