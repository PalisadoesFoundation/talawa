# Method: `close`

## Description

Shuts down the HTTP client.

 If [force] is `false` (the default) the [HttpClient] will be kept alive
 until all active connections are done. If [force] is `true` any active
 connections will be closed to immediately release all resources. These
 closed connections will receive an error event to indicate that the client
 was shut down. In both cases trying to establish a new connection after
 calling [close] will throw an exception.

## Return Type
`void`

## Parameters

- ``: `dynamic`
