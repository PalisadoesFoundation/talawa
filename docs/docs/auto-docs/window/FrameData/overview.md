# Overview for `FrameData`

## Description

Additional data available on each flutter frame.

 See also:

  * [Window.frameData] and [PlatformDispatcher.frameData], which expose the
    frame data for the current frame.
  * [PlatformDispatcher.onFrameDataChanged], which notifies listeners when
    a window's frame data has changed.

## Members

- **frameNumber**: `int`
  The number of the current frame.

 This number monotonically increases, but doesn't necessarily
 start at a particular value.

 If not provided, defaults to -1.

## Constructors

### _


#### Parameters

- ``: `dynamic`
