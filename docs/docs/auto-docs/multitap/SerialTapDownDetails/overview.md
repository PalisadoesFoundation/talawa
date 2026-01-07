# Overview for `SerialTapDownDetails`

## Description

Details for [GestureSerialTapDownCallback], such as the tap count within
 the series.

 See also:

  * [SerialTapGestureRecognizer], which passes this information to its
    [SerialTapGestureRecognizer.onSerialTapDown] callback.

## Members

- **globalPosition**: `Offset`
  The global position at which the pointer contacted the screen.

- **localPosition**: `Offset`
  The local position at which the pointer contacted the screen.

- **kind**: `PointerDeviceKind`
  The kind of the device that initiated the event.

- **buttons**: `int`
  Which buttons were pressed when the pointer contacted the screen.

 See also:

  * [PointerEvent.buttons], which this field reflects.

- **count**: `int`
  The number of consecutive taps that this "tap down" represents.

 This value will always be greater than zero. When the first pointer in a
 possible series contacts the screen, this value will be `1`, the second
 tap in a double-tap will be `2`, and so on.

 If a tap is determined to not be in the same series as the tap that
 preceded it (e.g. because too much time elapsed between the two taps or
 the two taps had too much distance between them), then this count will
 reset back to `1`, and a new series will have begun.

## Constructors

### Unnamed Constructor
Creates details for a [GestureSerialTapDownCallback].

 The `count` argument must be greater than zero.

