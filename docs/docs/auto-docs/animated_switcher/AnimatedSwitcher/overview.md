# Overview for `AnimatedSwitcher`

## Description

A widget that by default does a cross-fade between a new widget and the
 widget previously set on the [AnimatedSwitcher] as a child.

 

 If they are swapped fast enough (i.e. before [duration] elapses), more than
 one previous child can exist and be transitioning out while the newest one
 is transitioning in.

 If the "new" child is the same widget type and key as the "old" child, but
 with different parameters, then [AnimatedSwitcher] will *not* do a
 transition between them, since as far as the framework is concerned, they
 are the same widget and the existing widget can be updated with the new
 parameters. To force the transition to occur, set a [Key] on each child
 widget that you wish to be considered unique (typically a [ValueKey] on the
 widget data that distinguishes this child from the others).

 The same key can be used for a new child as was used for an already-outgoing
 child; the two will not be considered related. (For example, if a progress
 indicator with key A is first shown, then an image with key B, then another
 progress indicator with key A again, all in rapid succession, then the old
 progress indicator and the image will be fading out while a new progress
 indicator is fading in.)

 The type of transition can be changed from a cross-fade to a custom
 transition by setting the [transitionBuilder].

 
 This sample shows a counter that animates the scale of a text widget
 whenever the value changes.

 ** See code in examples/api/lib/widgets/animated_switcher/animated_switcher.0.dart **
 

 See also:

  * [AnimatedCrossFade], which only fades between two children, but also
    interpolates their sizes, and is reversible.
  * [AnimatedOpacity], which can be used to switch between nothingness and
    a given child by fading the child in and out.
  * [FadeTransition], which [AnimatedSwitcher] uses to perform the transition.

## Dependencies

- StatefulWidget

## Members

- **child**: `Widget?`
  The current child widget to display. If there was a previous child, then
 that child will be faded out using the [switchOutCurve], while the new
 child is faded in with the [switchInCurve], over the [duration].

 If there was no previous child, then this child will fade in using the
 [switchInCurve] over the [duration].

 The child is considered to be "new" if it has a different type or [Key]
 (see [Widget.canUpdate]).

 To change the kind of transition used, see [transitionBuilder].

- **duration**: `Duration`
  The duration of the transition from the old [child] value to the new one.

 This duration is applied to the given [child] when that property is set to
 a new child. The same duration is used when fading out, unless
 [reverseDuration] is set. Changing [duration] will not affect the
 durations of transitions already in progress.

- **reverseDuration**: `Duration?`
  The duration of the transition from the new [child] value to the old one.

 This duration is applied to the given [child] when that property is set to
 a new child. Changing [reverseDuration] will not affect the durations of
 transitions already in progress.

 If not set, then the value of [duration] is used by default.

- **switchInCurve**: `Curve`
  The animation curve to use when transitioning in a new [child].

 This curve is applied to the given [child] when that property is set to a
 new child. Changing [switchInCurve] will not affect the curve of a
 transition already in progress.

 The [switchOutCurve] is used when fading out, except that if [child] is
 changed while the current child is in the middle of fading in,
 [switchInCurve] will be run in reverse from that point instead of jumping
 to the corresponding point on [switchOutCurve].

- **switchOutCurve**: `Curve`
  The animation curve to use when transitioning a previous [child] out.

 This curve is applied to the [child] when the child is faded in (or when
 the widget is created, for the first child). Changing [switchOutCurve]
 will not affect the curves of already-visible widgets, it only affects the
 curves of future children.

 If [child] is changed while the current child is in the middle of fading
 in, [switchInCurve] will be run in reverse from that point instead of
 jumping to the corresponding point on [switchOutCurve].

- **transitionBuilder**: `AnimatedSwitcherTransitionBuilder`
  A function that wraps a new [child] with an animation that transitions
 the [child] in when the animation runs in the forward direction and out
 when the animation runs in the reverse direction. This is only called
 when a new [child] is set (not for each build), or when a new
 [transitionBuilder] is set. If a new [transitionBuilder] is set, then
 the transition is rebuilt for the current child and all previous children
 using the new [transitionBuilder]. The function must not return null.

 The default is [AnimatedSwitcher.defaultTransitionBuilder].

 The animation provided to the builder has the [duration] and
 [switchInCurve] or [switchOutCurve] applied as provided when the
 corresponding [child] was first provided.

 See also:

  * [AnimatedSwitcherTransitionBuilder] for more information about
    how a transition builder should function.

- **layoutBuilder**: `AnimatedSwitcherLayoutBuilder`
  A function that wraps all of the children that are transitioning out, and
 the [child] that's transitioning in, with a widget that lays all of them
 out. This is called every time this widget is built. The function must not
 return null.

 The default is [AnimatedSwitcher.defaultLayoutBuilder].

 See also:

  * [AnimatedSwitcherLayoutBuilder] for more information about
    how a layout builder should function.

## Constructors

### Unnamed Constructor
Creates an [AnimatedSwitcher].

