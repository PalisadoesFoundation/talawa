# Overview for `MultiStreamController`

## Description

An enhanced stream controller provided by [Stream.multi].

 Acts like a normal asynchronous controller, but also allows
 adding events synchronously.
 As with any synchronous event delivery, the sender should be very careful
 to not deliver events at times when a new listener might not
 be ready to receive them.
 That usually means only delivering events synchronously in response to other
 asynchronous events, because that is a time when an asynchronous event could
 happen.

## Dependencies

- StreamController

