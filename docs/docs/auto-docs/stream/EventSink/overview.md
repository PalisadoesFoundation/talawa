# Overview for `EventSink`

## Description

A [Sink] that supports adding errors.

 This makes it suitable for capturing the results of asynchronous
 computations, which can complete with a value or an error.

 The [EventSink] has been designed to handle asynchronous events from
 [Stream]s. See, for example, [Stream.eventTransformed] which uses
 `EventSink`s to transform events.

## Dependencies

- Sink

