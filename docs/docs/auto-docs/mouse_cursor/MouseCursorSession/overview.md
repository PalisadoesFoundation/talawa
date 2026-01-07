# Overview for `MouseCursorSession`

## Description

Manages the duration that a pointing device should display a specific mouse
 cursor.

 While [MouseCursor] classes describe the kind of cursors, [MouseCursorSession]
 classes represents a continuous use of the cursor on a pointing device. The
 [MouseCursorSession] classes can be stateful. For example, a cursor that
 needs to load resources might want to set a temporary cursor first, then
 switch to the correct cursor after the load is completed.

 A [MouseCursorSession] has the following lifecycle:

  * When a pointing device should start displaying a cursor, [MouseTracker]
    creates a session by calling [MouseCursor.createSession] on the target
    cursor, and stores it in a table associated with the device.
  * [MouseTracker] then immediately calls the session's [activate], where the
    session should fetch resources and make system calls.
  * When the pointing device should start displaying a different cursor,
    [MouseTracker] calls [dispose] on this session. After [dispose], this session
    will no longer be used in the future.

## Members

- **cursor**: `MouseCursor`
  The cursor that created this session.

- **device**: `int`
  The device ID of the pointing device.

## Constructors

### Unnamed Constructor
Create a session.

