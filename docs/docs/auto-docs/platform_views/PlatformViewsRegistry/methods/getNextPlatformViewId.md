# Method: `getNextPlatformViewId`

## Description

Allocates a unique identifier for a platform view.

 A platform view identifier can refer to a platform view that was never created,
 a platform view that was disposed, or a platform view that is alive.

 Typically a platform view identifier is passed to a platform view widget
 which creates the platform view and manages its lifecycle.

## Return Type
`int`

