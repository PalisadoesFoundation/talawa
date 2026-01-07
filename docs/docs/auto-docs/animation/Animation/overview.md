# Overview for `Animation`

## Description

A value which might change over time, moving forward or backward.

 An animation has a [value] (of type [T]) and a [status].
 The value conceptually lies on some path, and
 the status indicates how the value is currently moving along the path:
 forward, backward, or stopped at the end or the beginning.
 The path may double back on itself
 (e.g., if the animation uses a curve that bounces),
 so even when the animation is conceptually moving forward
 the value might not change monotonically.

 Consumers of the animation can listen for changes to either the value
 or the status, with [addListener] and [addStatusListener].
 The listener callbacks are called during the "animation" phase of
 the pipeline, just prior to rebuilding widgets.

 An animation might move forward or backward on its own as time passes
 (like the opacity of a button that fades over a fixed duration
 once the user touches it),
 or it might be driven by the user
 (like the position of a slider that the user can drag back and forth),
 or it might do both
 (like a switch that snaps into place when released,
 or a [Dismissible] that responds to drag and fling gestures, etc.).
 The behavior is normally controlled by method calls on
 some underlying [AnimationController].
 When an animation is actively animating, it typically updates on
 each frame, driven by a [Ticker].

 ## Using animations

 For simple animation effects, consider using one of the
 [ImplicitlyAnimatedWidget] subclasses,
 like [AnimatedScale], [AnimatedOpacity], and many others.
 When an [ImplicitlyAnimatedWidget] suffices, there is
 no need to work with [Animation] or the rest of the classes
 discussed in this section.

 Otherwise, typically an animation originates with an [AnimationController]
 (which is itself an [Animation&lt;double&gt;])
 created by a [State] that implements [TickerProvider].
 Further animations might be derived from that animation
 by using e.g. [Tween] or [CurvedAnimation].
 The animations might be used to configure an [AnimatedWidget]
 (using one of its many subclasses like [FadeTransition]),
 or their values might be used directly.

 For example, the [AnimationController] may represent
 the abstract progress of the animation from 0.0 to 1.0;
 then a [CurvedAnimation] might apply an easing curve;
 and a [SizeTween] and [ColorTween] might each be applied to that
 to produce an [Animation&lt;Size&gt;] and an [Animation&lt;Color&gt;] that control
 a widget shrinking and changing color as the animation proceeds.

 ## Performance considerations

 Because the [Animation] keeps the same identity as the animation proceeds,
 it provides a convenient way for a [StatefulWidget] that orchestrates
 a complex animation to communicate the animation's progress to its
 various child widgets.  Consider having higher-level widgets in the tree
 pass lower-level widgets the [Animation] itself, rather than its value,
 in order to avoid rebuilding the higher-level widgets on each frame
 even while the animation is active.
 If the leaf widgets also ignore [value] and pass the whole
 [Animation] object to a render object (like [FadeTransition] does),
 they too might be able to avoid rebuild and even relayout, so that the
 only work needed on each frame of the animation is to repaint.

 See also:

  * [ImplicitlyAnimatedWidget] and its subclasses, which provide
    animation effects without the need to manually work with [Animation],
    [AnimationController], or even [State].
  * [AnimationController], an animation you can run forward and backward,
    stop, or set to a specific value.
  * [Tween], which can be used to convert [Animation&lt;double&gt;]s into
    other kinds of [Animation]s.
  * [AnimatedWidget] and its subclasses, which provide animation effects
    that can be controlled by an [Animation].

## Dependencies

- Listenable, ValueListenable

## Constructors

### Unnamed Constructor
Abstract const constructor. This constructor enables subclasses to provide
 const constructors so that they can be used in const expressions.

### fromValueListenable
Create a new animation from a [ValueListenable].

 The returned animation will always have an animation status of
 [AnimationStatus.forward]. The value of the provided listenable can
 be optionally transformed using the [transformer] function.

 

 This constructor can be used to replace instances of [ValueListenableBuilder]
 widgets with a corresponding animated widget, like a [FadeTransition].

 Before:

 ```dart
 Widget build(BuildContext context) 
 ```

 
 

 After:

 ```dart
 Widget build2(BuildContext context) 
 ```
 

#### Parameters

- `listenable`: `ValueListenable&lt;T&gt;`
- ``: `dynamic`
