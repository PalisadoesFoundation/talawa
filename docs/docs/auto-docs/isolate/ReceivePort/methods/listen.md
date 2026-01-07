# Method: `listen`

## Description

Listen for events from [Stream].

 See [Stream.listen].

 Note that [onError] and [cancelOnError] are ignored since a [ReceivePort]
 will never receive an error.

 The [onDone] handler will be called when the stream closes.
 The stream closes when [close] is called.

## Return Type
`StreamSubscription&lt;dynamic&gt;`

## Parameters

- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
