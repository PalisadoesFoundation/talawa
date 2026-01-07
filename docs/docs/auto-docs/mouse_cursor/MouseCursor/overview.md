# Overview for `MouseCursor`

## Description

An interface for mouse cursor definitions.

 A mouse cursor is a graphical image on the screen that echoes the movement
 of a pointing device, such as a mouse or a stylus. A [MouseCursor] object
 defines a kind of mouse cursor, such as an arrow, a pointing hand, or an
 I-beam.

 During the painting phase, [MouseCursor] objects are assigned to regions on
 the screen via annotations. Later during a device update (e.g. when a mouse
 moves), [MouseTracker] finds the _active cursor_ of each mouse device, which
 is the front-most region associated with the position of each mouse cursor,
 or defaults to [SystemMouseCursors.basic] if no cursors are associated with
 the position. [MouseTracker] changes the cursor of the pointer if the new
 active cursor is different from the previous active cursor, whose effect is
 defined by the session created by [createSession].

 ## Cursor classes

 A [SystemMouseCursor] is a cursor that is natively supported by the
 platform that the program is running on. All supported system mouse cursors
 are enumerated in [SystemMouseCursors].

 ## Using cursors

 A [MouseCursor] object is used by being assigned to a [MouseRegion] or
 another widget that exposes the [MouseRegion] API, such as
 [InkResponse.mouseCursor].

 
 This sample creates a rectangular region that is wrapped by a [MouseRegion]
 with a system mouse cursor. The mouse pointer becomes an I-beam when
 hovering over the region.

 ** See code in examples/api/lib/services/mouse_cursor/mouse_cursor.0.dart **
 

 Assigning regions with mouse cursors on platforms that do not support mouse
 cursors, or when there are no mice connected, will have no effect.

 ## Related classes

 [MouseCursorSession] represents the duration when a pointing device displays
 a cursor, and defines the states and behaviors of the cursor. Every mouse
 cursor class usually has a corresponding [MouseCursorSession] class.

 [MouseCursorManager] is a class that adds the feature of changing
 cursors to [MouseTracker], which tracks the relationship between mouse
 devices and annotations. [MouseCursorManager] is usually used as a part
 of [MouseTracker].

## Dependencies

- Diagnosticable

## Members

- **defer**: `MouseCursor`
  A special class that indicates that the region with this cursor defers the
 choice of cursor to the next region behind it.

 When an event occurs, [MouseTracker] will update each pointer's cursor by
 finding the list of regions that contain the pointer's location, from front
 to back in hit-test order. The pointer's cursor will be the first cursor in
 the list that is not a [MouseCursor.defer].

- **uncontrolled**: `MouseCursor`
  A special value that doesn't change cursor by itself, but make a region
 that blocks other regions behind it from changing the cursor.

 When a pointer enters a region with a cursor of [uncontrolled], the pointer
 retains its previous cursor and keeps so until it moves out of the region.
 Technically, this region absorb the mouse cursor hit test without changing
 the pointer's cursor.

 This is useful in a region that displays a platform view, which let the
 operating system handle pointer events and change cursors accordingly. To
 achieve this, the region's cursor must not be any Flutter cursor, since
 that might overwrite the system request upon pointer entering; the cursor
 must not be null either, since that allows the widgets behind the region to
 change cursors.

## Constructors

### Unnamed Constructor
Abstract const constructor. This constructor enables subclasses to provide
 const constructors so that they can be used in const expressions.

