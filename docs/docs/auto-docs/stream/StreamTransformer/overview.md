# Overview for `StreamTransformer`

## Description

Transforms a Stream.

 When a stream's [Stream.transform] method is invoked with a
 [StreamTransformer], the stream calls the [bind] method on the provided
 transformer. The resulting stream is then returned from the
 [Stream.transform] method.

 Conceptually, a transformer is simply a function from [Stream] to [Stream]
 that is encapsulated into a class.

 It is good practice to write transformers that can be used multiple times.

 All other transforming methods on [Stream], such as [Stream.map],
 [Stream.where] or [Stream.expand] can be implemented using
 [Stream.transform]. A [StreamTransformer] is thus very powerful but often
 also a bit more complicated to use.

 The [StreamTransformer.fromHandlers] constructor allows passing separate
 callbacks to react to events, errors, and the end of the stream.
 The [StreamTransformer.fromBind] constructor creates a `StreamTransformer`
 whose [bind] method is implemented by calling the function passed to the
 constructor.

## Constructors

### Unnamed Constructor
Creates a [StreamTransformer] based on the given [onListen] callback.

 The returned stream transformer uses the provided [onListen] callback
 when a transformed stream is listened to. At that time, the callback
 receives the input stream (the one passed to [bind]) and a
 boolean flag `cancelOnError` to create a [StreamSubscription].

 If the transformed stream is a broadcast stream, so is the stream
 returned by the [StreamTransformer.bind] method by this transformer.

 If the transformed stream is listened to multiple times, the [onListen]
 callback is called again for each new [Stream.listen] call.
 This happens whether the stream is a broadcast stream or not,
 but the call will usually fail for non-broadcast streams.

 The [onListen] callback does *not* receive the handlers that were passed
 to [Stream.listen]. These are automatically set after the call to the
 [onListen] callback (using [StreamSubscription.onData],
 [StreamSubscription.onError] and [StreamSubscription.onDone]).

 Most commonly, an [onListen] callback will first call [Stream.listen] on
 the provided stream (with the corresponding `cancelOnError` flag), and then
 return a new [StreamSubscription].

 There are two common ways to create a StreamSubscription:

 1. by allocating a [StreamController] and to return the result of
    listening to its stream. It's important to forward pause, resume and
    cancel events (unless the transformer intentionally wants to change
    this behavior).
 2. by creating a new class that implements [StreamSubscription].
    Note that the subscription should run callbacks in the [Zone] the
    stream was listened to (see [Zone] and [Zone.bindCallback]).

 Example:

 ```dart
  Starts listening to [input] and duplicates all non-error events.
 StreamSubscription&lt;int&gt; _onListen(Stream&lt;int&gt; input, bool cancelOnError) 

 // Instantiate a transformer:
 var duplicator = const StreamTransformer&lt;int, int&gt;(_onListen);

 // Use as follows:
 intStream.transform(duplicator);
 ```

### fromHandlers
Creates a [StreamTransformer] that delegates events to the given functions.

 Example use of a duplicating transformer:

 ```dart
 stringStream.transform(StreamTransformer&lt;String, String&gt;.fromHandlers(
     handleData: (String value, EventSink&lt;String&gt; sink) ));
 ```

 When a transformed stream returned from a call to [bind] is listened to,
 the source stream is listened to, and a handler function is called for
 each event of the source stream.

 The handlers are invoked with the event data and with a sink that can be
 used to emit events on the transformed stream.

 The [handleData] handler is invoked for data events on the source stream.
 If [handleData] was omitted, data events are added directly to the created
 stream, as if calling [EventSink.add] on the sink with the event value.
 If [handleData] is omitted the source stream event type, [S], must be a
 subtype of the transformed stream event type [T].

 The [handleError] handler is invoked for each error of the source stream.
 If [handleError] is omitted, errors are forwarded directly to the
 transformed stream, as if calling [EventSink.addError] with the error and
 stack trace.

 The [handleDone] handler is invoked when the source stream closes, as
 signaled by sending a done event. The done handler takes no event value,
 but can still send other events before calling [EventSink.close]. If
 [handleDone] is omitted, a done event on the source stream closes the
 transformed stream.

 If any handler calls [EventSink.close] on the provided sink,
 the transformed sink closes and the source stream subscription
 is cancelled. No further events can be added to the sink by
 that handler, and no further source stream events will occur.

 The sink provided to the event handlers must only be used during
 the call to that handler. It must not be stored and used at a later
 time.

 Transformers created this way should be *stateless*.
 They should not retain state between invocations of handlers,
 because the same transformer, and therefore the same handlers,
 may be used on multiple streams, or on streams which can be listened
 to more than once.
 _To create per-stream handlers, [StreamTransformer.fromBind]
 could be used to create a new [StreamTransformer.fromHandlers] per
 stream to transform._

 ```dart
 var controller = StreamController&lt;String&gt;.;
 controller.onListen =  ;
 var sharedState = 0;
 var transformedStream = controller.stream.transform(
     StreamTransformer&lt;String&gt;.fromHandlers(
         handleError: (error, stackTrace, sink) ));

 transformedStream.listen(print);
 transformedStream.listen(print); // Listen twice.
 // Listening twice to the same stream makes the transformer share the same
 // state. Instead of having "Error 1: Bad", "Error 2: Worse",
 // "Error 3: Worst" as output (each twice for the separate subscriptions),
 // this program emits:
 // Error 1: Bad
 // Error 2: Bad
 // Error 3: Worse
 // Error 4: Worse
 // Error 5: Worst
 // Error 6: Worst
 ```

#### Parameters

- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
### fromBind
Creates a [StreamTransformer] based on a [bind] callback.

 The returned stream transformer uses the [bind] argument to implement the
 [StreamTransformer.bind] API and can be used when the transformation is
 available as a stream-to-stream function.

 ```dart import:convert
 final splitDecoded = StreamTransformer&lt;List&lt;int&gt;, String&gt;.fromBind(
     (stream) => stream.transform(utf8.decoder).transform);
 ```

#### Parameters

- `bind`: `Stream&lt;T&gt; Function(Stream&lt;S&gt;)`
