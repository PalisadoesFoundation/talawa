# Overview for `ImageCacheStatus`

## Description

Information about how the [ImageCache] is tracking an image.

 A [pending] image is one that has not completed yet. It may also be tracked
 as [live] because something is listening to it.

 A [keepAlive] image is being held in the cache, which uses Least Recently
 Used semantics to determine when to evict an image. These images are subject
 to eviction based on [ImageCache.maximumSizeBytes] and
 [ImageCache.maximumSize]. It may be [live], but not [pending].

 A [live] image is being held until its [ImageStreamCompleter] has no more
 listeners. It may also be [pending] or [keepAlive].

 An [untracked] image is not being cached.

 To obtain an [ImageCacheStatus], use [ImageCache.statusForKey] or
 [ImageProvider.obtainCacheStatus].

## Members

- **pending**: `bool`
  An image that has been submitted to [ImageCache.putIfAbsent], but
 not yet completed.

- **keepAlive**: `bool`
  An image that has been submitted to [ImageCache.putIfAbsent], has
 completed, fits based on the sizing rules of the cache, and has not been
 evicted.

 Such images will be kept alive even if [live] is false, as long
 as they have not been evicted from the cache based on its sizing rules.

- **live**: `bool`
  An image that has been submitted to [ImageCache.putIfAbsent] and has at
 least one listener on its [ImageStreamCompleter].

 Such images may also be [keepAlive] if they fit in the cache based on its
 sizing rules. They may also be [pending] if they have not yet resolved.

## Constructors

### _


#### Parameters

- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
