# Overview for `AnimationController`

## Description

A controller for an animation.

 This class lets you perform tasks such as:

 * Play an animation [forward] or in [reverse], or [stop] an animation.
 * Set the animation to a specific [value].
 * Define the [upperBound] and [lowerBound] values of an animation.
 * Create a [fling] animation effect using a physics simulation.

 By default, an [AnimationController] linearly produces values that range
 from 0.0 to 1.0, during a given duration.

 When the animation is actively animating, the animation controller generates
 a new value each time the device running your app is ready to display a new
 frame (typically, this rate is around 60–120 values per second).
 If the animation controller is associated with a [State]
 through a [TickerProvider], then its updates will be silenced when that
 [State]'s subtree is disabled as defined by [TickerMode]; time will still
 elapse, and methods like [forward] and [stop] can still be called and
 will change the value, but the controller will not generate new values
 on its own.

 ## Ticker providers

 An [AnimationController] needs a [TickerProvider], which is configured using
 the `vsync` argument on the constructor.
 The constructor uses the [TickerProvider] to create a [Ticker], which
 the [AnimationController] uses to step through the animation it controls.

 For advice on obtaining a ticker provider, see [TickerProvider].
 Typically the relevant [State] serves as the ticker provider,
 after applying a suitable mixin (like [SingleTickerProviderStateMixin])
 to cause the [State] subclass to implement [TickerProvider].

 ## Life cycle

 An [AnimationController] should be [dispose]d when it is no longer needed.
 This reduces the likelihood of leaks. When used with a [StatefulWidget], it
 is common for an [AnimationController] to be created in the
 [State.initState] method and then disposed in the [State.dispose] method.

 ## Using [Future]s with [AnimationController]

 The methods that start animations return a [TickerFuture] object which
 completes when the animation completes successfully, and never throws an
 error; if the animation is canceled, the future never completes. This object
 also has a [TickerFuture.orCancel] property which returns a future that
 completes when the animation completes successfully, and completes with an
 error when the animation is aborted.

 This can be used to write code such as the `fadeOutAndUpdateState` method
 below.

 

 Here is a stateful `Foo` widget. Its [State] uses the
 [SingleTickerProviderStateMixin] to implement the necessary
 [TickerProvider], creating its controller in the [State.initState] method
 and disposing of it in the [State.dispose] method. The duration of the
 controller is configured from a property in the `Foo` widget; as that
 changes, the [State.didUpdateWidget] method is used to update the
 controller.

 ```dart
 class Foo extends StatefulWidget 

 class _FooState extends State&lt;Foo&gt; with SingleTickerProviderStateMixin 
 ```
 
 

 The following method (for a [State] subclass) drives two animation
 controllers using Dart's asynchronous syntax for awaiting [Future] objects:

 ```dart
 Future&lt;void&gt;  async 
 ```
 

 The assumption in the code above is that the animation controllers are being
 disposed in the [State] subclass' override of the [State.dispose] method.
 Since disposing the controller cancels the animation (raising a
 [TickerCanceled] exception), the code here can skip verifying whether
 [State.mounted] is still true at each step. (Again, this assumes that the
 controllers are created in [State.initState] and disposed in
 [State.dispose], as described in the previous section.)

 
 This example shows how to use [AnimationController] and
 [SlideTransition] to create an animated digit like you might find
 on an old pinball machine our your car's odometer.  New digit
 values slide into place from below, as the old value slides
 upwards and out of view. Taps that occur while the controller is
 already animating cause the controller's
 [AnimationController.duration] to be reduced so that the visuals
 don't fall behind.

 ** See code in examples/api/lib/animation/animation_controller/animated_digit.0.dart **
 

 See also:

  * [Tween], the base class for converting an [AnimationController] to a
    range of values of other types.

## Dependencies

- Animation, AnimationEagerListenerMixin, AnimationLocalListenersMixin, AnimationLocalStatusListenersMixin

## Members

- **lowerBound**: `double`
  The value at which this animation is deemed to be dismissed.

- **upperBound**: `double`
  The value at which this animation is deemed to be completed.

- **debugLabel**: `String?`
  A label that is used in the [toString] output. Intended to aid with
 identifying animation controller instances in debug output.

- **animationBehavior**: `AnimationBehavior`
  The behavior of the controller when [AccessibilityFeatures.disableAnimations]
 is true.

 Defaults to [AnimationBehavior.normal] for the [AnimationController.new]
 constructor, and [AnimationBehavior.preserve] for the
 [AnimationController.unbounded] constructor.

- **duration**: `Duration?`
  The length of time this animation should last.

 If [reverseDuration] is specified, then [duration] is only used when going
 [forward]. Otherwise, it specifies the duration going in both directions.

- **reverseDuration**: `Duration?`
  The length of time this animation should last when going in [reverse].

 The value of [duration] is used if [reverseDuration] is not specified or
 set to null.

- **_ticker**: `Ticker?`
- **_simulation**: `Simulation?`
- **_value**: `double`
- **_lastElapsedDuration**: `Duration?`
- **_direction**: `_AnimationDirection`
- **_status**: `AnimationStatus`
- **_lastReportedStatus**: `AnimationStatus`
## Constructors

### Unnamed Constructor
Creates an animation controller.

 * `value` is the initial value of the animation. If defaults to the lower
   bound.

 * [duration] is the length of time this animation should last.

 * [debugLabel] is a string to help identify this animation during
   debugging (used by [toString]).

 * [lowerBound] is the smallest value this animation can obtain and the
   value at which this animation is deemed to be dismissed.

 * [upperBound] is the largest value this animation can obtain and the
   value at which this animation is deemed to be completed.

 * `vsync` is the required [TickerProvider] for the current context. It can
   be changed by calling [resync]. See [TickerProvider] for advice on
   obtaining a ticker provider.

### unbounded
Creates an animation controller with no upper or lower bound for its
 value.

 * [value] is the initial value of the animation.

 * [duration] is the length of time this animation should last.

 * [debugLabel] is a string to help identify this animation during
   debugging (used by [toString]).

 * `vsync` is the required [TickerProvider] for the current context. It can
   be changed by calling [resync]. See [TickerProvider] for advice on
   obtaining a ticker provider.

 This constructor is most useful for animations that will be driven using a
 physics simulation, especially when the physics simulation has no
 pre-determined bounds.

#### Parameters

- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
