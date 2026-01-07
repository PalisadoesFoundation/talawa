# Method: `putIfAbsent`

## Description

Returns the previously cached [ImageStream] for the given key, if available;
 if not, calls the given callback to obtain it first. In either case, the
 key is moved to the 'most recently used' position.

 In the event that the loader throws an exception, it will be caught only if
 `onError` is also provided. When an exception is caught resolving an image,
 no completers are cached and `null` is returned instead of a new
 completer.

 Images that are larger than [maximumSizeBytes] are not cached, and do not
 cause other images in the cache to be evicted.

## Return Type
`ImageStreamCompleter?`

## Parameters

- `key`: `Object`
- `loader`: `ImageStreamCompleter `
- ``: `dynamic`
