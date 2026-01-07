# Overview for `ImageProvider`

## Description

Identifies an image without committing to the precise final asset. This
 allows a set of images to be identified and for the precise image to later
 be resolved based on the environment, e.g. the device pixel ratio.

 To obtain an [ImageStream] from an [ImageProvider], call [resolve],
 passing it an [ImageConfiguration] object.

 [ImageProvider] uses the global [imageCache] to cache images.

 The type argument `T` is the type of the object used to represent a resolved
 configuration. This is also the type used for the key in the image cache. It
 should be immutable and implement the [==] operator and the [hashCode]
 getter. Subclasses should subclass a variant of [ImageProvider] with an
 explicit `T` type argument.

 The type argument does not have to be specified when using the type as an
 argument (where any image provider is acceptable).

 The following image formats are supported: 

 ## Lifecycle of resolving an image

 The [ImageProvider] goes through the following lifecycle to resolve an
 image, once the [resolve] method is called:

   1. Create an [ImageStream] using [createStream] to return to the caller.
      This stream will be used to communicate back to the caller when the
      image is decoded and ready to display, or when an error occurs.
   2. Obtain the key for the image using [obtainKey].
      Calling this method can throw exceptions into the zone asynchronously
      or into the call stack synchronously. To handle that, an error handler
      is created that catches both synchronous and asynchronous errors, to
      make sure errors can be routed to the correct consumers.
      The error handler is passed on to [resolveStreamForKey] and the
      [ImageCache].
   3. If the key is successfully obtained, schedule resolution of the image
      using that key. This is handled by [resolveStreamForKey]. That method
      may fizzle if it determines the image is no longer necessary, use the
      provided [ImageErrorListener] to report an error, set the completer
      from the cache if possible, or call [loadImage] to fetch the encoded image
      bytes and schedule decoding.
   4. The [loadImage] method is responsible for both fetching the encoded bytes
      and decoding them using the provided [ImageDecoderCallback]. It is called
      in a context that uses the [ImageErrorListener] to report errors back.

 Subclasses normally only have to implement the [loadImage] and [obtainKey]
 methods. A subclass that needs finer grained control over the [ImageStream]
 type must override [createStream]. A subclass that needs finer grained
 control over the resolution, such as delaying calling [loadImage], must override
 [resolveStreamForKey].

 The [resolve] method is marked as [nonVirtual] so that [ImageProvider]s can
 be properly composed, and so that the base class can properly set up error
 handling for subsequent methods.

 ## Using an [ImageProvider]

 

 The following shows the code required to write a widget that fully conforms
 to the [ImageProvider] and [Widget] protocols. (It is essentially a
 bare-bones version of the [Image] widget.)

 ```dart
 class MyImage extends StatefulWidget 

 class _MyImageState extends State&lt;MyImage&gt; 
 ```
 

 ## Creating an [ImageProvider]

 
 In this example, a variant of [NetworkImage] is created that passes all the
 [ImageConfiguration] information (locale, platform, size, etc) to the server
 using query arguments in the image URL.

 ** See code in examples/api/lib/painting/image_provider/image_provider.0.dart **
 

## Constructors

### Unnamed Constructor
Abstract const constructor. This constructor enables subclasses to provide
 const constructors so that they can be used in const expressions.

