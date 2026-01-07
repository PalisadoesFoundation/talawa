# Overview for `Stream`

## Description

A source of asynchronous data events.

 A Stream provides a way to receive a sequence of events.
 Each event is either a data event, also called an *element* of the stream,
 or an error event, which is a notification that something has failed.
 When a stream has emitted all its events,
 a single "done" event notifies the listener that the end has been reached.

 You produce a stream by calling an `async*` function, which then returns
 a stream. Consuming that stream will lead the function to emit events
 until it ends, and the stream closes.
 You consume a stream either using an `await for` loop, which is available
 inside an `async` or `async*` function, or by forwarding its events directly
 using `yield*` inside an `async*` function.
 Example:
 ```dart
 Stream&lt;T> optionalMap&lt;T&gt;(
     Stream&lt;T&gt; source , [T Function(T)? convert]) async* 
 ```
 When this function is called, it immediately returns a `Stream&lt;T&gt;` object.
 Then nothing further happens until someone tries to consume that stream.
 At that point, the body of the `async*` function starts running.
 If the `convert` function was omitted, the `yield*` will listen to the
 `source` stream and forward all events, date and errors, to the returned
 stream. When the `source` stream closes, the `yield*` is done,
 and the `optionalMap` function body ends too. This closes the returned
 stream.
 If a `convert` *is* supplied, the function instead listens on the source
 stream and enters an `await for` loop which
 repeatedly waits for the next data event.
 On a data event, it calls `convert` with the value and emits the result
 on the returned stream.
 If no error events are emitted by the `source` stream,
 the loop ends when the `source` stream does,
 then the `optionalMap` function body completes,
 which closes the returned stream.
 On an error event from the `source` stream,
 the `await for` re-throws that error, which breaks the loop.
 The error then reaches the end of the `optionalMap` function body,
 since it's not caught.
 That makes the error be emitted on the returned stream, which then closes.

 The `Stream` class also provides functionality which allows you to
 manually listen for events from a stream, or to convert a stream
 into another stream or into a future.

 The [forEach] function corresponds to the `await for` loop,
 just as [Iterable.forEach] corresponds to a normal `for`/`in` loop.
 Like the loop, it will call a function for each data event and break on an
 error.

 The more low-level [listen] method is what every other method is based on.
 You call `listen` on a stream to tell it that you want to receive
 events, and to register the callbacks which will receive those events.
 When you call `listen`, you receive a [StreamSubscription] object
 which is the active object providing the events,
 and which can be used to stop listening again,
 or to temporarily pause events from the subscription.

 There are two kinds of streams: "Single-subscription" streams and
 "broadcast" streams.

 *A single-subscription stream* allows only a single listener during the whole
 lifetime of the stream.
 It doesn't start generating events until it has a listener,
 and it stops sending events when the listener is unsubscribed,
 even if the source of events could still provide more.
 The stream created by an `async*` function is a single-subscription stream,
 but each call to the function creates a new such stream.

 Listening twice on a single-subscription stream is not allowed, even after
 the first subscription has been canceled.

 Single-subscription streams are generally used for streaming chunks of
 larger contiguous data, like file I/O.

 *A broadcast stream* allows any number of listeners, and it fires
 its events when they are ready, whether there are listeners or not.

 Broadcast streams are used for independent events/observers.

 If several listeners want to listen to a single-subscription stream,
 use [asBroadcastStream] to create a broadcast stream on top of the
 non-broadcast stream.

 On either kind of stream, stream transformations, such as [where] and
 [skip], return the same type of stream as the one the method was called on,
 unless otherwise noted.

 When an event is fired, the listener(s) at that time will receive the event.
 If a listener is added to a broadcast stream while an event is being fired,
 that listener will not receive the event currently being fired.
 If a listener is canceled, it immediately stops receiving events.
 Listening on a broadcast stream can be treated as listening on a new stream
 containing only the events that have not yet been emitted when the [listen]
 call occurs.
 For example the [first] getter listens to the stream, then returns the first
 event that listener receives.
 This is not necessarily the first even emitted by the stream, but the first
 of the *remaining* events of the broadcast stream.

 When the "done" event is fired, subscribers are unsubscribed before
 receiving the event. After the event has been sent, the stream has no
 subscribers. Adding new subscribers to a broadcast stream after this point
 is allowed, but they will just receive a new "done" event as soon
 as possible.

 Stream subscriptions always respect "pause" requests. If necessary they need
 to buffer their input, but often, and preferably they can simply request
 their input to pause too.

 The default implementation of [isBroadcast] returns false.
 A broadcast stream inheriting from [Stream] must override [isBroadcast]
 to return `true` if it wants to signal that it behaves like a broadcast
 stream.

## Constructors

### Unnamed Constructor


### empty
Creates an empty broadcast stream.

 This is a stream which does nothing except sending a done event
 when it's listened to.

 Example:
 ```dart
 const stream = Stream.;
 stream.listen(
   (value) ,
   onDone:  ,
 );
 ```

 The stream defaults to being a broadcast stream,
 as reported by [isBroadcast].
 This value can be changed by passing `false` as
 the [broadcast] parameter, which defaults to `true`.

 The stream can be listened to more than once,
 whether it reports itself as broadcast or not.

#### Parameters

- ``: `dynamic`
### value
Creates a stream which emits a single data event before closing.

 This stream emits a single data event of [value]
 and then closes with a done event.

 Example:
 ```dart
 Future&lt;void&gt; printThings(Stream&lt;String&gt; data) async 
 printThings(Stream&lt;String&gt;.value('ok')); // prints "ok".
 ```

 The returned stream is effectively equivalent to one created by
 `( async*  )` or `Future&lt;T&gt;.value(value).`.

#### Parameters

- `value`: `T`
### error
Creates a stream which emits a single error event before completing.

 This stream emits a single error event of [error] and [stackTrace]
 and then completes with a done event.

 Example:
 ```dart
 Future&lt;void&gt; tryThings(Stream&lt;int&gt; data) async 
 tryThings(Stream&lt;int&gt;.error('Error')); // prints "Error".
 ```
 The returned stream is effectively equivalent to one created by
 `Future&lt;T&gt;.error(error, stackTrace).`, by or
 `( async*  )`, except that you can control the
 stack trace as well.

#### Parameters

- `error`: `Object`
- ``: `dynamic`
### fromFuture
Creates a new single-subscription stream from the future.

 When the future completes, the stream will fire one event, either
 data or error, and then close with a done-event.

 Example:
 ```dart
 Future&lt;String&gt;  async 

 final stream = Stream&lt;String&gt;.fromFuture;
 stream.listen(print,
     onDone:  =&gt; print('Done'), onError: print);

 // Outputs:
 // "Future complete" after 'futureTask' finished.
 // "Done" when stream completed.
 ```

#### Parameters

- `future`: `Future&lt;T&gt;`
### fromFutures
Create a single-subscription stream from a group of futures.

 The stream reports the results of the futures on the stream in the order
 in which the futures complete.
 Each future provides either a data event or an error event,
 depending on how the future completes.

 If some futures have already completed when `Stream.fromFutures` is called,
 their results will be emitted in some unspecified order.

 When all futures have completed, the stream is closed.

 If [futures] is empty, the stream closes as soon as possible.

 Example:
 ```dart
 Future&lt;int&gt;  async 

 Future&lt;String&gt;  async 

 final stream = Stream&lt;Object&gt;.fromFutures([, ]);
 stream.listen(print, onDone:  => print('Done'), onError: print);

 // Outputs:
 // 10 after 'waitTask' finished.
 // "Future complete" after 'doneTask' finished.
 // "Done" when stream completed.
 ```

#### Parameters

- `futures`: `Iterable&lt;Future&lt;T&gt;&gt;`
### fromIterable
Creates a stream that gets its data from [elements].

 The iterable is iterated when the stream receives a listener, and stops
 iterating if the listener cancels the subscription, or if the
 [Iterator.moveNext] method returns `false` or throws.
 Iteration is suspended while the stream subscription is paused.

 If calling [Iterator.moveNext] on `elements.iterator` throws,
 the stream emits that error and then it closes.
 If reading [Iterator.current] on `elements.iterator` throws,
 the stream emits that error, but keeps iterating.

 Can be listened to more than once. Each listener iterates [elements]
 independently.

 Example:
 ```dart
 final numbers = [1, 2, 3, 5, 6, 7];
 final stream = Stream.fromIterable(numbers);
 ```

#### Parameters

- `elements`: `Iterable&lt;T&gt;`
### multi
Creates a multi-subscription stream.

 Each time the created stream is listened to,
 the [onListen] callback is invoked with a new [MultiStreamController],
 which forwards events to the [StreamSubscription]
 returned by that [listen] call.

 This allows each listener to be treated as an individual stream.

 The [MultiStreamController] does not support reading its
 [StreamController.stream]. Setting its [StreamController.onListen]
 has no effect since the [onListen] callback is called instead,
 and the [StreamController.onListen] won't be called later.
 The controller acts like an asynchronous controller,
 but provides extra methods for delivering events synchronously.

 If [isBroadcast] is set to `true`, the returned stream's
 [Stream.isBroadcast] will be `true`.
 This has no effect on the stream behavior,
 it is up to the [onListen] function
 to act like a broadcast stream if it claims to be one.

 A multi-subscription stream can behave like any other stream.
 If the [onListen] callback throws on every call after the first,
 the stream behaves like a single-subscription stream.
 If the stream emits the same events to all current listeners,
 it behaves like a broadcast stream.

 It can also choose to emit different events to different listeners.
 For example, a stream which repeats the most recent
 non-`null` event to new listeners, could be implemented as this example:
 ```dart
 extension StreamRepeatLatestExtension&lt;T extends Object> on Stream<T&gt; 
 ```

#### Parameters

- `onListen`: `void Function(MultiStreamController&lt;T&gt;)`
- ``: `dynamic`
### periodic
Creates a stream that repeatedly emits events at [period] intervals.

 The event values are computed by invoking [computation]. The argument to
 this callback is an integer that starts with 0 and is incremented for
 every event.

 The [period] must be a non-negative [Duration].

 If [computation] is omitted, the event values will all be `null`.

 The [computation] must not be omitted if the event type [T] does not
 allow `null` as a value.

 Example:
 ```dart
 final stream =
     Stream&lt;int&gt;.periodic(const Duration(
         seconds: 1), (count) => count * count).take(5);

 stream.forEach(print); // Outputs event values 0,1,4,9,16.
 ```

#### Parameters

- `period`: `Duration`
- ``: `dynamic`
### eventTransformed
Creates a stream where all events of an existing stream are piped through
 a sink-transformation.

 The given [mapSink] closure is invoked when the returned stream is
 listened to. All events from the [source] are added into the event sink
 that is returned from the invocation. The transformation puts all
 transformed events into the sink the [mapSink] closure received during
 its invocation. Conceptually the [mapSink] creates a transformation pipe
 with the input sink being the returned [EventSink] and the output sink
 being the sink it received.

 This constructor is frequently used to build transformers.

 Example use for a duplicating transformer:
 ```dart
 class DuplicationSink implements EventSink&lt;String&gt; 

 class DuplicationTransformer extends StreamTransformerBase&lt;String, String&gt; 

 stringStream.transform;
 ```
 The resulting stream is a broadcast stream if [source] is.

#### Parameters

- `source`: `Stream&lt;dynamic&gt;`
- ``: `dynamic`
