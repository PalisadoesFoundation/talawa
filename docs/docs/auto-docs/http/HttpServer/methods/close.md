# Method: `close`

## Description

Permanently stops this [HttpServer] from listening for new
 connections.  This closes the [Stream] of [HttpRequest]s with a
 done event. The returned future completes when the server is
 stopped. For a server started using [bind] or [bindSecure] this
 means that the port listened on no longer in use.

 If [force] is `true`, active connections will be closed immediately.

## Return Type
`Future`

## Parameters

- ``: `dynamic`
