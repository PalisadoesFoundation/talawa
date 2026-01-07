# Method: `lockEvents`

## Description

Locks the dispatching of asynchronous events and callbacks until the
 callback's future completes.

 This causes input lag and should therefore be avoided when possible. It is
 primarily intended for use during non-user-interactive time such as to
 allow [reassembleApplication] to block input while it walks the tree
 (which it partially does asynchronously).

 The [Future] returned by the `callback` argument is returned by [lockEvents].

 The [gestures] binding wraps [PlatformDispatcher.onPointerDataPacket] in
 logic that honors this event locking mechanism. Similarly, tasks queued
 using [SchedulerBinding.scheduleTask] will only start when events are not
 [locked].

## Return Type
`Future&lt;void&gt;`

## Parameters

- `callback`: `Future&lt;void&gt; `
