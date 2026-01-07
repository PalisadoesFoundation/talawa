# Overview for `AnimatedBuilder`

## Description

A general-purpose widget for building animations.

 [AnimatedBuilder] is useful for more complex widgets that wish to include
 an animation as part of a larger build function. To use [AnimatedBuilder],
 construct the widget and pass it a builder function.

 For simple cases without additional state, consider using
 [AnimatedWidget].

 

 Despite the name, [AnimatedBuilder] is not limited to [Animation]s, any
 subtype of [Listenable] (such as [ChangeNotifier] or [ValueNotifier]) can be
 used to trigger rebuilds. Although they have identical implementations, if
 an [Animation] is not being listened to, consider using a
 [ListenableBuilder] for better readability.

 ## Performance optimizations

 
 If the [builder] function contains a subtree that does not depend on the
 animation passed to the constructor, it's more efficient to build that
 subtree once instead of rebuilding it on every animation tick.

 If a pre-built subtree is passed as the [child] parameter, the
 [AnimatedBuilder] will pass it back to the [builder] function so that it can
 be incorporated into the build.

 Using this pre-built child is entirely optional, but can improve
 performance significantly in some cases and is therefore a good practice.
 

 
 This code defines a widget that spins a green square continually. It is
 built with an [AnimatedBuilder] and makes use of the [child] feature to
 avoid having to rebuild the [Container] each time.

 ** See code in examples/api/lib/widgets/transitions/animated_builder.0.dart **
 

 See also:

 * [ListenableBuilder], a widget with similar functionality, but named
   more appropriately for a builder triggered on changes in [Listenable]s
   that aren't [Animation]s.
 * [TweenAnimationBuilder], which animates a property to a target value
   without requiring manual management of an [AnimationController].

## Dependencies

- ListenableBuilder

## Constructors

### Unnamed Constructor
Creates an animated builder.

 The [animation] and [builder] arguments are required.

