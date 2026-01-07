# Overview for `ListenableBuilder`

## Description

A general-purpose widget for building a widget subtree when a [Listenable]
 changes.

 [ListenableBuilder] is useful for more complex widgets that wish to listen
 to changes in other objects as part of a larger build function. To use
 [ListenableBuilder], construct the widget and pass it a [builder]
 function.

 Any subtype of [Listenable] (such as a [ChangeNotifier], [ValueNotifier], or
 [Animation]) can be used with a [ListenableBuilder] to rebuild only certain
 parts of a widget when the [Listenable] notifies its listeners. Although
 they have identical implementations, if an [Animation] is being listened to,
 consider using an [AnimatedBuilder] instead for better readability.

 
 The following example uses a subclass of [ChangeNotifier] to hold the
 application model's state, in this case, a counter. A [ListenableBuilder] is
 then used to update the rendering (a [Text] widget) whenever the model changes.

 ** See code in examples/api/lib/widgets/transitions/listenable_builder.2.dart **
 

 
 This version is identical, but using a [ValueNotifier] instead of a
 dedicated subclass of [ChangeNotifier]. This works well when there is only a
 single immutable value to be tracked.

 ** See code in examples/api/lib/widgets/transitions/listenable_builder.1.dart **
 

 ## Performance optimizations

 
 If the [builder] function contains a subtree that does not depend on the
 [listenable], it is more efficient to build that subtree once instead
 of rebuilding it on every change of the [listenable].

 Performance is therefore improved by specifying any widgets that don't need
 to change using the prebuilt [child] attribute. The [ListenableBuilder]
 passes this [child] back to the [builder] callback so that it can be
 incorporated into the build.

 Using this pre-built [child] is entirely optional, but can improve
 performance significantly in some cases and is therefore a good practice.
 

 
 This example shows how a [ListenableBuilder] can be used to listen to a
 [FocusNode] (which is also a [ChangeNotifier]) to see when a subtree has
 focus, and modify a decoration when its focus state changes. Only the
 [Container] is rebuilt when the [FocusNode] changes; the rest of the tree
 (notably the [Focus] widget) remain unchanged from frame to frame.

 ** See code in examples/api/lib/widgets/transitions/listenable_builder.0.dart **
 

 See also:

 * [AnimatedBuilder], which has the same functionality, but is named more
   appropriately for a builder triggered by [Animation]s.
 * [ValueListenableBuilder], which is specialized for [ValueNotifier]s and
   reports the new value in its builder callback.

## Dependencies

- AnimatedWidget

## Members

- **builder**: `TransitionBuilder`
  Called every time the [listenable] notifies about a change.

 The child given to the builder should typically be part of the returned
 widget tree.

- **child**: `Widget?`
  The child widget to pass to the [builder].

 

## Constructors

### Unnamed Constructor
Creates a builder that responds to changes in [listenable].

