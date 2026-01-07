# Overview for `RawKeyEventData`

## Description

Base class for platform-specific key event data.

 This class is deprecated, and will be removed. Platform specific key event
 data will no be longer available. See [KeyEvent] for what is available.

 This base class exists to have a common type to use for each of the
 target platform's key event data structures.

 See also:

  * [RawKeyEventDataAndroid], a specialization for Android.
  * [RawKeyEventDataFuchsia], a specialization for Fuchsia.
  * [RawKeyDownEvent] and [RawKeyUpEvent], the classes that hold the
    reference to [RawKeyEventData] subclasses.
  * [RawKeyboard], which uses these interfaces to expose key data.

## Dependencies

- Diagnosticable

## Constructors

### Unnamed Constructor
Abstract const constructor. This constructor enables subclasses to provide
 const constructors so that they can be used in const expressions.

