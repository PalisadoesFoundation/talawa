# Overview for `ImageStreamListener`

## Description

Interface for receiving notifications about the loading of an image.

 This class overrides [operator ==] and [hashCode] to compare the individual
 callbacks in the listener, meaning that if you add an instance of this class
 as a listener (e.g. via [ImageStream.addListener]), you can instantiate a
 _different_ instance of this class when you remove the listener, and the
 listener will be properly removed as long as all associated callbacks are
 equal.

 Used by [ImageStream] and [ImageStreamCompleter].

## Members

- **onImage**: `ImageListener`
  Callback for getting notified that an image is available.

 This callback may fire multiple times (e.g. if the [ImageStreamCompleter]
 that drives the notifications fires multiple times). An example of such a
 case would be an image with multiple frames within it (such as an animated
 GIF).

 For more information on how to interpret the parameters to the callback,
 see the documentation on [ImageListener].

 See also:

  * [onError], which will be called instead of [onImage] if an error occurs
    during loading.

- **onChunk**: `ImageChunkListener?`
  Callback for getting notified when a chunk of bytes has been received
 during the loading of the image.

 This callback may fire many times (e.g. when used with a [NetworkImage],
 where the image bytes are loaded incrementally over the wire) or not at
 all (e.g. when used with a [MemoryImage], where the image bytes are
 already available in memory).

 This callback may also continue to fire after the [onImage] callback has
 fired (e.g. for multi-frame images that continue to load after the first
 frame is available).

- **onError**: `ImageErrorListener?`
  Callback for getting notified when an error occurs while loading an image.

 If an error occurs during loading, [onError] will be called instead of
 [onImage].

 If [onError] is called and does not throw, then the error is considered to
 be handled. An error handler can explicitly rethrow the exception reported
 to it to safely indicate that it did not handle the exception.

 If an image stream has no listeners that handled the error when the error
 was first encountered, then the error is reported using
 [FlutterError.reportError], with the [FlutterErrorDetails.silent] flag set
 to true.

## Constructors

### Unnamed Constructor
Creates a new [ImageStreamListener].

