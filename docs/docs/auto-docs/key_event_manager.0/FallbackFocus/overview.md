# Overview for `FallbackFocus`

## Description

A widget that, when focused, handles key events only if no other handlers
 do.

 If a [FallbackFocus] is being focused on, then key events that are not
 handled by other handlers will be dispatched to the `onKeyEvent` of [node].
 If `onKeyEvent` returns true, this event is considered "handled" and will
 not move forward with the text input system.

 If multiple [FallbackFocus] nest, then only the innermost takes effect.

 Internally, this class registers its node to the singleton
 [FallbackKeyEventRegistrar]. The inner this widget is, the later its node
 will be added to the registrar's list when focused on.

## Dependencies

- StatelessWidget

## Members

- **child**: `Widget`
- **node**: `FallbackFocusNode`
## Constructors

### Unnamed Constructor


