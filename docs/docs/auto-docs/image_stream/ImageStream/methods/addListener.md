# Method: `addListener`

## Description

Adds a listener callback that is called whenever a new concrete [ImageInfo]
 object is available. If a concrete image is already available, this object
 will call the listener synchronously.

 If the assigned [completer] completes multiple images over its lifetime,
 this listener will fire multiple times.

 
 The listener will be passed a flag indicating whether a synchronous call
 occurred. If the listener is added within a render object paint function,
 then use this flag to avoid calling [RenderObject.markNeedsPaint] during
 a paint.

 If a duplicate `listener` is registered N times, then it will be called N
 times when the image stream completes (whether because a new image is
 available or because an error occurs). Likewise, to remove all instances
 of the listener, [removeListener] would need to called N times as well.

 When a `listener` receives an [ImageInfo] object, the `listener` is
 responsible for disposing of the [ImageInfo.image].
 

## Return Type
`void`

## Parameters

- `listener`: `ImageStreamListener`
