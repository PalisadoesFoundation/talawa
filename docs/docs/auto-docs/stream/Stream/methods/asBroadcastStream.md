# Method: `asBroadcastStream`

## Description

Returns a multi-subscription stream that produces the same events as this.

 The returned stream will subscribe to this stream when its first
 subscriber is added, and will stay subscribed until this stream ends,
 or a callback cancels the subscription.

 If [onListen] is provided, it is called with a subscription-like object
 that represents the underlying subscription to this stream. It is
 possible to pause, resume or cancel the subscription during the call
 to [onListen]. It is not possible to change the event handlers, including
 using [StreamSubscription.asFuture].

 If [onCancel] is provided, it is called in a similar way to [onListen]
 when the returned stream stops having listeners. If it later gets
 a new listener, the [onListen] function is called again.

 Use the callbacks, for example, for pausing the underlying subscription
 while having no subscribers to prevent losing events, or canceling the
 subscription when there are no listeners.

 Cancelling is intended to be used when there are no current subscribers.
 If the subscription passed to `onListen` or `onCancel` is cancelled,
 then no further events are ever emitted by current subscriptions on
 the returned broadcast stream, not even a done event.

 Example:
 ```dart
 final stream =
     Stream&lt;int&gt;.periodic(const Duration(seconds: 1), (count) => count)
         .take(10);

 final broadcastStream = stream.asBroadcastStream(
   onCancel: (controller) ,
   onListen: (controller) async ,
 );

 final oddNumberStream = broadcastStream.where((event) => event.isOdd);
 final oddNumberListener = oddNumberStream.listen(
       (event) ,
   onDone:  => print('Done'),
 );

 final evenNumberStream = broadcastStream.where((event) => event.isEven);
 final evenNumberListener = evenNumberStream.listen((event) , onDone:  => print('Done'));

 await Future.delayed(const Duration(milliseconds: 3500)); // 3.5 second
 // Outputs:
 // Even: 0
 // Odd: 1
 // Even: 2
 oddNumberListener.; // Nothing printed.
 evenNumberListener.; // "Stream paused"
 await Future.delayed(const Duration(seconds: 2));
 print(await broadcastStream.first); // "Stream resumed"
 // Outputs:
 // 3
 ```

## Return Type
`Stream&lt;T&gt;`

## Parameters

- ``: `dynamic`
- ``: `dynamic`
