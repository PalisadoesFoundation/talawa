# Overview for `HttpConnectionsInfo`

## Description

Summary statistics about an [HttpServer]s current socket connections.

## Members

- **total**: `int`
  Total number of socket connections.

- **active**: `int`
  Number of active connections where actual request/response
 processing is active.

- **idle**: `int`
  Number of idle connections held by clients as persistent connections.

- **closing**: `int`
  Number of connections which are preparing to close.

 Note: These connections are also part of the [active] count as they might
 still be sending data to the client before finally closing.

