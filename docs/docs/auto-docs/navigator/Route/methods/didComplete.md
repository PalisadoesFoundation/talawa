# Method: `didComplete`

## Description

The route was popped or is otherwise being removed somewhat gracefully.

 This is called by [didPop] and in response to
 [NavigatorState.pushReplacement]. If [didPop] was not called, then the
 [NavigatorState.finalizeRoute] method must be called immediately, and no exit
 animation will run.

 The [popped] future is completed by this method. The `result` argument
 specifies the value that this future is completed with, unless it is null,
 in which case [currentResult] is used instead.

 This should be called before the pop animation, if any, takes place,
 though in some cases the animation may be driven by the user before the
 route is committed to being popped; this can in particular happen with the
 iOS-style back gesture. See [NavigatorState.didStartUserGesture].

## Return Type
`void`

## Parameters

- `result`: `T?`
