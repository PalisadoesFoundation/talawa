# Overview for `MouseCursorManager`

## Description

Maintains the state of mouse cursors and manages how cursors are searched
 for.

 This is typically created as a global singleton and owned by [MouseTracker].

## Members

- **fallbackMouseCursor**: `MouseCursor`
  The mouse cursor to use if all cursor candidates choose to defer.

 See also:

  * [MouseCursor.defer], the mouse cursor object to use to defer.

- **_lastSession**: `Map&lt;int, MouseCursorSession&gt;`
## Constructors

### Unnamed Constructor
Create a [MouseCursorManager] by specifying the fallback cursor.

 The `fallbackMouseCursor` must not be [MouseCursor.defer] (typically
 [SystemMouseCursors.basic]).

