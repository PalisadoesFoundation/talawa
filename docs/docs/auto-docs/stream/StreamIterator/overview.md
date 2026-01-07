# Overview for `StreamIterator`

## Description

An [Iterator]-like interface for the values of a [Stream].

 This wraps a [Stream] and a subscription on the stream. It listens
 on the stream, and completes the future returned by [moveNext] when the
 next value becomes available.

 The stream may be paused between calls to [moveNext].

 The [current] value must only be used after a future returned by [moveNext]
 has completed with `true`, and only until [moveNext] is called again.

## Constructors

### Unnamed Constructor
Create a [StreamIterator] on [stream].

