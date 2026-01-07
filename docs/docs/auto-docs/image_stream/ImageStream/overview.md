# Overview for `ImageStream`

## Description

A handle to an image resource.

 ImageStream represents a handle to a [dart:ui.Image] object and its scale
 (together represented by an [ImageInfo] object). The underlying image object
 might change over time, either because the image is animating or because the
 underlying image resource was mutated.

 ImageStream objects can also represent an image that hasn't finished
 loading.

 ImageStream objects are backed by [ImageStreamCompleter] objects.

 The [ImageCache] will consider an image to be live until the listener count
 drops to zero after adding at least one listener. The
 [ImageStreamCompleter.addOnLastListenerRemovedCallback] method is used for
 tracking this information.

 See also:

  * [ImageProvider], which has an example that includes the use of an
    [ImageStream] in a [Widget].

## Dependencies

- Diagnosticable

## Members

- **_completer**: `ImageStreamCompleter?`
- **_listeners**: `List&lt;ImageStreamListener&gt;?`
## Constructors

### Unnamed Constructor
Create an initially unbound image stream.

 Once an [ImageStreamCompleter] is available, call [setCompleter].

