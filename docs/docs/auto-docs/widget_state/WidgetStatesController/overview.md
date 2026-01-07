# Overview for `WidgetStatesController`

## Description

Manages a set of [WidgetState]s and notifies listeners of changes.

 Used by widgets that expose their internal state for the sake of
 extensions that add support for additional states. See
 [TextButton] for an example.

 The controller's [value] is its current set of states. Listeners
 are notified whenever the [value] changes. The [value] should only be
 changed with [update]; it should not be modified directly.

 The controller's [value] represents the set of states that a
 widget's visual properties, typically [WidgetStateProperty]
 values, are resolved against. It is _not_ the intrinsic state of
 the widget. The widget is responsible for ensuring that the
 controller's [value] tracks its intrinsic state. For example one
 cannot request the keyboard focus for a widget by adding
 [WidgetState.focused] to its controller. When the widget gains the
 or loses the focus it will [update] its controller's [value] and
 notify listeners of the change.

 When calling `setState` in a [WidgetStatesController] listener, use the
 [SchedulerBinding.addPostFrameCallback] to delay the call to `setState` after
 the frame has been rendered. It's generally prudent to use the
 [SchedulerBinding.addPostFrameCallback] because some of the widgets that
 depend on [WidgetStatesController] may call [update] in their build method.
 In such cases, listener's that call `setState` - during the build phase - will cause
 an error.

 See also:

  * [MaterialStatesController], the Material specific version of
    `WidgetStatesController`.

## Dependencies

- ValueNotifier

## Constructors

### Unnamed Constructor
Creates a WidgetStatesController.

