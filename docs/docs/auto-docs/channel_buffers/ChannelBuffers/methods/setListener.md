# Method: `setListener`

## Description

Sets the listener for the specified channel.

 When there is a listener, messages are sent immediately.

 Each channel may have up to one listener set at a time. Setting
 a new listener on a channel with an existing listener clears the
 previous one.

 Callbacks are invoked in their own stack frame and
 use the zone that was current when the callback was
 registered.

 ## Draining

 If any messages were queued before the listener is added,
 they are drained asynchronously after this method returns.

 Each message is handled in its own microtask. No messages can
 be queued by plugins while the queue is being drained, but any
 microtasks queued by the handler itself will be processed before
 the next message is handled.

 The draining stops if the listener is removed.

## Return Type
`void`

## Parameters

- `name`: `String`
- `callback`: `ChannelCallback`
