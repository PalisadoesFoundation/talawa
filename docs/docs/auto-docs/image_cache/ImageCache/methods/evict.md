# Method: `evict`

## Description

Evicts a single entry from the cache, returning true if successful.

 Pending images waiting for completion are removed as well, returning true
 if successful. When a pending image is removed the listener on it is
 removed as well to prevent it from adding itself to the cache if it
 eventually completes.

 If this method removes a pending image, it will also remove
 the corresponding live tracking of the image, since it is no longer clear
 if the image will ever complete or have any listeners, and failing to
 remove the live reference could leave the cache in a state where all
 subsequent calls to [putIfAbsent] will return an [ImageStreamCompleter]
 that will never complete.

 If this method removes a completed image, it will _not_ remove the live
 reference to the image, which will only be cleared when the listener
 count on the completer drops to zero. To clear live image references,
 whether completed or not, use [clearLiveImages].

 The `key` must be equal to an object used to cache an image in
 [ImageCache.putIfAbsent].

 If the key is not immediately available, as is common, consider using
 [ImageProvider.evict] to call this method indirectly instead.

 The `includeLive` argument determines whether images that still have
 listeners in the tree should be evicted as well. This parameter should be
 set to true in cases where the image may be corrupted and needs to be
 completely discarded by the cache. It should be set to false when calls
 to evict are trying to relieve memory pressure, since an image with a
 listener will not actually be evicted from memory, and subsequent attempts
 to load it will end up allocating more memory for the image again.

 See also:

  * [ImageProvider], for providing images to the [Image] widget.

## Return Type
`bool`

## Parameters

- `key`: `Object`
- ``: `dynamic`
