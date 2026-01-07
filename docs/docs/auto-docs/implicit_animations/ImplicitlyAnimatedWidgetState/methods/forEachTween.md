# Method: `forEachTween`

## Description

Visits each tween controlled by this state with the specified `visitor`
 function.

 ### Subclass responsibility

 Properties to be animated are represented by [Tween] member variables in
 the state. For each such tween, [forEachTween] implementations are
 expected to call `visitor` with the appropriate arguments and store the
 result back into the member variable. The arguments to `visitor` are as
 follows:

 

 ### When this method will be called

 [forEachTween] is initially called during [initState]. It is expected that
 the visitor's `tween` argument will be set to null, causing the visitor to
 call its `constructor` argument to construct the tween for the first time.
 The resulting tween will have its `begin` value set to the target value
 and will have its `end` value set to null. The animation will not be
 started.

 When this state's [widget] is updated (thus triggering the
 [didUpdateWidget] method to be called), [forEachTween] will be called
 again to check if the target value has changed. If the target value has
 changed, signaling that the [animation] should start, then the visitor
 will update the tween's `start` and `end` values accordingly, and the
 animation will be started.

 ### Other member variables

 Subclasses that contain properties based on tweens created by
 [forEachTween] should override [didUpdateTweens] to update those
 properties. Dependent properties should not be updated within
 [forEachTween].

 

 This sample implements an implicitly animated widget's `State`.
 The widget animates between colors whenever `widget.targetColor`
 changes.

 ```dart
 class MyWidgetState extends AnimatedWidgetBaseState&lt;MyWidget&gt; 
 ```
 

## Return Type
`void`

## Parameters

- `visitor`: `TweenVisitor&lt;dynamic&gt;`
