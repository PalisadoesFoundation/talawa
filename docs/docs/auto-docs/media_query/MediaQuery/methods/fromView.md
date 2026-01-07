# Method: `fromView`

## Description

Wraps the [child] in a [MediaQuery] which is built using data from the
 provided [view].

 The [MediaQuery] is constructed using the platform-specific data of the
 surrounding [MediaQuery] and the view-specific data of the provided
 [view]. If no surrounding [MediaQuery] exists, the platform-specific data
 is generated from the [PlatformDispatcher] associated with the provided
 [view]. Any information that's exposed via the [PlatformDispatcher] is
 considered platform-specific. Data exposed directly on the [FlutterView]
 (excluding its [FlutterView.platformDispatcher] property) is considered
 view-specific.

 The injected [MediaQuery] automatically updates when any of the data used
 to construct it changes.

## Return Type
`Widget`

## Parameters

- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
