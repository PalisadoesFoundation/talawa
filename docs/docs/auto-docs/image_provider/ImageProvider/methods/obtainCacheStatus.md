# Method: `obtainCacheStatus`

## Description

Returns the cache location for the key that this [ImageProvider] creates.

 The location may be [ImageCacheStatus.untracked], indicating that this
 image provider's key is not available in the [ImageCache].

 If the `handleError` parameter is null, errors will be reported to
 [FlutterError.onError], and the method will return null.

 A completed return value of null indicates that an error has occurred.

## Return Type
`Future<ImageCacheStatus?>`

## Parameters

- ``: `dynamic`
- ``: `dynamic`
