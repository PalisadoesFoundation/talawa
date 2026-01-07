# Overview for `SerialTapCancelDetails`

## Description

Details for [GestureSerialTapCancelCallback], such as the tap count within
 the series.

 See also:

  * [SerialTapGestureRecognizer], which passes this information to its
    [SerialTapGestureRecognizer.onSerialTapCancel] callback.

## Members

- **count**: `int`
  The number of consecutive taps that were in progress when the gesture was
 interrupted.

 This number will match the corresponding count that was specified in
 [SerialTapDownDetails.count] for the tap that is being canceled. See
 that field for more information on how this count is reported.

## Constructors

### Unnamed Constructor
Creates details for a [GestureSerialTapCancelCallback].

 The `count` argument must be greater than zero.

