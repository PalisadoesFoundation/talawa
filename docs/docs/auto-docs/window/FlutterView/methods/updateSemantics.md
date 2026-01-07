# Method: `updateSemantics`

## Description

Change the retained semantics data about this [FlutterView].

 If [PlatformDispatcher.semanticsEnabled] is true, the user has requested that this function
 be called whenever the semantic content of this [FlutterView]
 changes.

 This function disposes the given update, which means the semantics update
 cannot be used further.

## Return Type
`void`

## Parameters

- `update`: `SemanticsUpdate`
