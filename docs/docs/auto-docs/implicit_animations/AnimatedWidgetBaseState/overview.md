# Overview for `AnimatedWidgetBaseState`

## Description

A base class for widgets with implicit animations that need to rebuild their
 widget tree as the animation runs.

 This class calls [build] each frame that the animation ticks. For a
 variant that does not rebuild each frame, consider subclassing
 [ImplicitlyAnimatedWidgetState] directly.

 Subclasses must implement the [forEachTween] method to allow
 [AnimatedWidgetBaseState] to iterate through the subclasses' widget's fields
 and animate them.

## Dependencies

- ImplicitlyAnimatedWidgetState

