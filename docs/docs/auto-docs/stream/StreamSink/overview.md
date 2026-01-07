# Overview for `StreamSink`

## Description

A object that accepts stream events both synchronously and asynchronously.

 A [StreamSink] combines the methods from [StreamConsumer] and [EventSink].

 The [EventSink] methods can't be used while the [addStream] is called.
 As soon as the [addStream]'s [Future] completes with a value, the
 [EventSink] methods can be used again.

 If [addStream] is called after any of the [EventSink] methods, it'll
 be delayed until the underlying system has consumed the data added by the
 [EventSink] methods.

 When [EventSink] methods are used, the [done] [Future] can be used to
 catch any errors.

 When [close] is called, it will return the [done] [Future].

## Dependencies

- EventSink, StreamConsumer

