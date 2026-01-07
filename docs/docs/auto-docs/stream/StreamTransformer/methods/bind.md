# Method: `bind`

## Description

Transforms the provided [stream].

 Returns a new stream with events that are computed from events of the
 provided [stream].

 The [StreamTransformer] interface is completely generic,
 so it cannot say what subclasses do.
 Each [StreamTransformer] should document clearly how it transforms the
 stream (on the class or variable used to access the transformer),
 as well as any differences from the following typical behavior:

 * When the returned stream is listened to, it starts listening to the
   input [stream].
 * Subscriptions of the returned stream forward (in a reasonable time)
   a [StreamSubscription.pause] call to the subscription of the input
   [stream].
 * Similarly, canceling a subscription of the returned stream eventually
   (in reasonable time) cancels the subscription of the input [stream].

 "Reasonable time" depends on the transformer and stream. Some transformers,
 like a "timeout" transformer, might make these operations depend on a
 duration. Others might not delay them at all, or just by a microtask.

 Transformers are free to handle errors in any way.
 A transformer implementation may choose to propagate errors,
 or convert them to other events, or ignore them completely,
 but if errors are ignored, it should be documented explicitly.

## Return Type
`Stream&lt;T&gt;`

## Parameters

- `stream`: `Stream&lt;S&gt;`
