# Overview for `SerialTapUpDetails`

## Description

Details for [GestureSerialTapUpCallback], such as the tap count within
 the series.

 See also:

  * [SerialTapGestureRecognizer], which passes this information to its
    [SerialTapGestureRecognizer.onSerialTapUp] callback.

## Members

- **globalPosition**: `Offset`
  The global position at which the pointer contacted the screen.

- **localPosition**: `Offset`
  The local position at which the pointer contacted the screen.

- **kind**: `PointerDeviceKind?`
  The kind of the device that initiated the event.

- **count**: `int`
  The number of consecutive taps that this tap represents.

 This value will always be greater than zero. When the first pointer in a
 possible series completes its tap, this value will be `1`, the second
 tap in a double-tap will be `2`, and so on.

 If a tap is determined to not be in the same series as the tap that
 preceded it (e.g. because too much time elapsed between the two taps or
 the two taps had too much distance between them), then this count will
 reset back to `1`, and a new series will have begun.

## Constructors

### Unnamed Constructor
Creates details for a [GestureSerialTapUpCallback].

 The `count` argument must be greater than zero.

