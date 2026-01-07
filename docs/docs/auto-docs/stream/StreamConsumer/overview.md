# Overview for `StreamConsumer`

## Description

Abstract interface for a "sink" accepting multiple entire streams.

 A consumer can accept a number of consecutive streams using [addStream],
 and when no further data need to be added, the [close] method tells the
 consumer to complete its work and shut down.

 The [Stream.pipe] accepts a `StreamConsumer` and will pass the stream
 to the consumer's [addStream] method. When that completes, it will
 call [close] and then complete its own returned future.

