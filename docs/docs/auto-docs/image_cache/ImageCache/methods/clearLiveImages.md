# Method: `clearLiveImages`

## Description

Clears any live references to images in this cache.

 An image is considered live if its [ImageStreamCompleter] has never hit
 zero listeners after adding at least one listener. The
 [ImageStreamCompleter.addOnLastListenerRemovedCallback] is used to
 determine when this has happened.

 This is called after a hot reload to evict any stale references to image
 data for assets that have changed. Calling this method does not relieve
 memory pressure, since the live image caching only tracks image instances
 that are also being held by at least one other object.

## Return Type
`void`

