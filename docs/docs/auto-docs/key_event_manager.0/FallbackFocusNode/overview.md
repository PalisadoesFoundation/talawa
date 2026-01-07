# Overview for `FallbackFocusNode`

## Description

A node used by [FallbackKeyEventRegistrar] to register fallback key handlers.

 This class must not be replaced by bare [KeyEventCallback] because Dart
 does not allow comparing with `==` on anonymous functions (always returns
 false.)

## Members

- **onKeyEvent**: `KeyEventCallback`
## Constructors

### Unnamed Constructor


