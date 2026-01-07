# Method: `replaceGestureRecognizers`

## Description

This method can be called after the build phase, during the
 layout of the nearest descendant [RenderObjectWidget] of the
 gesture detector, to update the list of active gesture
 recognizers.

 The typical use case is [Scrollable]s, which put their viewport
 in their gesture detector, and then need to know the dimensions
 of the viewport and the viewport's child to determine whether
 the gesture detector should be enabled.

 The argument should follow the same conventions as
 [RawGestureDetector.gestures]. It acts like a temporary replacement for
 that value until the next build.

## Return Type
`void`

## Parameters

- `gestures`: `Map&lt;Type, GestureRecognizerFactory&gt;`
