# Method: `transform`

## Description

Applies [streamTransformer] to this stream.

 Returns the transformed stream,
 that is, the result of `streamTransformer.bind(this)`.
 This method simply allows writing the call to `streamTransformer.bind`
 in a chained fashion, like
 ```dart
 stream.map(mapping).transform(transformation).
 ```
 which can be more convenient than calling `bind` directly.

 The [streamTransformer] can return any stream.
 Whether the returned stream is a broadcast stream or not,
 and which elements it will contain,
 is entirely up to the transformation.

 This method should always be used for transformations which treat
 the entire stream as representing a single value
 which has perhaps been split into several parts for transport,
 like a file being read from disk or being fetched over a network.
 The transformation will then produce a new stream which
 transforms the stream's value incrementally (perhaps using
 [Converter.startChunkedConversion]). The resulting stream
 may again be chunks of the result, but does not have to
 correspond to specific events from the source string.

## Return Type
`Stream&lt;S&gt;`

## Parameters

- `streamTransformer`: `StreamTransformer&lt;T, S&gt;`
