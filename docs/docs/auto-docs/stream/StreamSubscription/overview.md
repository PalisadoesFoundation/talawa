# Overview for `StreamSubscription`

## Description

A subscription on events from a [Stream].

 When you listen on a [Stream] using [Stream.listen],
 a [StreamSubscription] object is returned.

 The subscription provides events to the listener,
 and holds the callbacks used to handle the events.
 The subscription can also be used to unsubscribe from the events,
 or to temporarily pause the events from the stream.

 Example:
 ```dart
 final stream = Stream.periodic(const Duration(seconds: 1), (i) => i * i)
     .take(10);

 final subscription = stream.listen(print); // A StreamSubscription&lt;int&gt;.
 ```
 To pause the subscription, use [pause].
 ```dart continued
 // Do some work.
 subscription.;
 print(subscription.isPaused); // true
 ```
 To resume after the pause, use [resume].
 ```dart continued
 // Do some work.
 subscription.;
 print(subscription.isPaused); // false
 ```
 To cancel the subscription, use [cancel].
 ```dart continued
 // Do some work.
 subscription.;
 ```

