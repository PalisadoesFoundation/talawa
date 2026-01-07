# Overview for `DeviceGestureSettings`

## Description

The device specific gesture settings scaled into logical pixels.

 This configuration can be retrieved from the window, or more commonly from a
 [MediaQuery] widget.

 See also:

  * [ui.GestureSettings], the configuration that this is derived from.

## Members

- **touchSlop**: `double?`
  The touch slop value in logical pixels, or `null` if it was not set.

## Constructors

### Unnamed Constructor
Create a new [DeviceGestureSettings] with configured settings in logical
 pixels.

### fromView
Create a new [DeviceGestureSettings] from the provided [view].

#### Parameters

- `view`: `ui.FlutterView`
