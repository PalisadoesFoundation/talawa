# Overview for `MultiDragPointerState`

## Description

Per-pointer state for a [MultiDragGestureRecognizer].

 A [MultiDragGestureRecognizer] tracks each pointer separately. The state for
 each pointer is a subclass of [MultiDragPointerState].

## Members

- **gestureSettings**: `DeviceGestureSettings?`
  Device specific gesture configuration that should be preferred over
 framework constants.

 These settings are commonly retrieved from a [MediaQuery].

- **initialPosition**: `Offset`
  The global coordinates of the pointer when the pointer contacted the screen.

- **_velocityTracker**: `VelocityTracker`
- **kind**: `PointerDeviceKind`
  The kind of pointer performing the multi-drag gesture.

 Used by subclasses to determine the appropriate hit slop, for example.

- **_client**: `Drag?`
- **_pendingDelta**: `Offset?`
- **_lastPendingEventTimestamp**: `Duration?`
- **_arenaEntry**: `GestureArenaEntry?`
## Constructors

### Unnamed Constructor
Creates per-pointer state for a [MultiDragGestureRecognizer].

