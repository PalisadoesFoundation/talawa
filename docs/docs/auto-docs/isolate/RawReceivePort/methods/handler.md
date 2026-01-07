# Method: `handler`

## Description

Sets the handler that is invoked for every incoming message.

 The handler is invoked in the [Zone.root] zone.
 If the handler should be invoked in the current zone, do:
 ```dart import:async
 rawPort.handler = Zone.current.bindCallback(actualHandler);
 ```

 The handler must be a function which can accept one argument
 of the type of the messages sent to this port.
 This means that if it is known that messages will all be [String]s,
 a handler of type `void Function(String)` can be used.
 The function is invoked dynamically with the actual messages,
 and if this invocation fails,
 the error becomes a top-level uncaught error in the [Zone.root] zone.

## Return Type
`void`

## Parameters

- `newHandler`: `Function?`
