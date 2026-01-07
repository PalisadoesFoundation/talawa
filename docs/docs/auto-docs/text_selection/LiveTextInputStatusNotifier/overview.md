# Overview for `LiveTextInputStatusNotifier`

## Description

A [ValueNotifier] whose [value] indicates whether the current device supports the Live Text
 (OCR) function.

 See also:
  * [LiveText], where the availability of Live Text input can be obtained.
  * [LiveTextInputStatus], an enumeration that indicates whether the current device is available
                           for Live Text input.

 Call [update] to asynchronously update [value] if needed.

## Dependencies

- ValueNotifier, WidgetsBindingObserver

## Members

- **_disposed**: `bool`
## Constructors

### Unnamed Constructor
Create a new LiveTextStatusNotifier.

