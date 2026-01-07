# Overview for `ImplicitlyAnimatedWidget`

## Description

An abstract class for building widgets that animate changes to their
 properties.

 Widgets of this type will not animate when they are first added to the
 widget tree. Rather, when they are rebuilt with different values, they will
 respond to those _changes_ by animating the changes over a specified
 [duration].

 Which properties are animated is left up to the subclass. Subclasses' [State]s
 must extend [ImplicitlyAnimatedWidgetState] and provide a way to visit the
 relevant fields to animate.

 ## Relationship to [AnimatedWidget]s

 [ImplicitlyAnimatedWidget]s (and their subclasses) automatically animate
 changes in their properties whenever they change. For this,
 they create and manage their own internal [AnimationController]s to power
 the animation. While these widgets are simple to use and don't require you
 to manually manage the lifecycle of an [AnimationController], they
 are also somewhat limited: Besides the target value for the animated
 property, developers can only choose a [duration] and [curve] for the
 animation. If you require more control over the animation (e.g. you want
 to stop it somewhere in the middle), consider using an
 [AnimatedWidget] or one of its subclasses. These widgets take an [Animation]
 as an argument to power the animation. This gives the developer full control
 over the animation at the cost of requiring you to manually manage the
 underlying [AnimationController].

 ## Common implicitly animated widgets

 A number of implicitly animated widgets ship with the framework. They are
 usually named `AnimatedFoo`, where `Foo` is the name of the non-animated
 version of that widget. Commonly used implicitly animated widgets include:

  * [TweenAnimationBuilder], which animates any property expressed by
    a [Tween] to a specified target value.
  * [AnimatedAlign], which is an implicitly animated version of [Align].
  * [AnimatedContainer], which is an implicitly animated version of
    [Container].
  * [AnimatedDefaultTextStyle], which is an implicitly animated version of
    [DefaultTextStyle].
  * [AnimatedScale], which is an implicitly animated version of [Transform.scale].
  * [AnimatedRotation], which is an implicitly animated version of [Transform.rotate].
  * [AnimatedSlide], which implicitly animates the position of a widget relative to its normal position.
  * [AnimatedOpacity], which is an implicitly animated version of [Opacity].
  * [AnimatedPadding], which is an implicitly animated version of [Padding].
  * [AnimatedPhysicalModel], which is an implicitly animated version of
    [PhysicalModel].
  * [AnimatedPositioned], which is an implicitly animated version of
    [Positioned].
  * [AnimatedPositionedDirectional], which is an implicitly animated version
    of [PositionedDirectional].
  * [AnimatedTheme], which is an implicitly animated version of [Theme].
  * [AnimatedCrossFade], which cross-fades between two given children and
    animates itself between their sizes.
  * [AnimatedSize], which automatically transitions its size over a given
    duration.
  * [AnimatedSwitcher], which fades from one widget to another.

## Dependencies

- StatefulWidget

## Members

- **curve**: `Curve`
  The curve to apply when animating the parameters of this container.

- **duration**: `Duration`
  The duration over which to animate the parameters of this container.

- **onEnd**: `VoidCallback?`
  Called every time an animation completes.

 This can be useful to trigger additional actions (e.g. another animation)
 at the end of the current animation.

## Constructors

### Unnamed Constructor
Initializes fields for subclasses.

