# Method: `removeListener`

## Description

Stops the specified [listener] from receiving image stream events.

 If [listener] has been added multiple times, this removes the _first_
 instance of the listener.

 Once all listeners have been removed and all [keepAlive] handles have been
 disposed, this image stream is no longer usable.

## Return Type
`void`

## Parameters

- `listener`: `ImageStreamListener`
