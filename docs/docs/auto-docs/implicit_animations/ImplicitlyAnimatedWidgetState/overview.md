# Overview for `ImplicitlyAnimatedWidgetState`

## Description

A base class for the `State` of widgets with implicit animations.

 [ImplicitlyAnimatedWidgetState] requires that subclasses respond to the
 animation themselves. If you would like `` to be called
 automatically as the animation changes, use [AnimatedWidgetBaseState].

 Properties that subclasses choose to animate are represented by [Tween]
 instances. Subclasses must implement the [forEachTween] method to allow
 [ImplicitlyAnimatedWidgetState] to iterate through the widget's fields and
 animate them.

## Dependencies

- State, SingleTickerProviderStateMixin

## Members

- **controller**: `AnimationController`
  The animation controller driving this widget's implicit animations.

- **_animation**: `CurvedAnimation`
