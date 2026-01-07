# Overview for `SendPort`

## Description

Sends messages to its [ReceivePort]s.

 [SendPort]s are created from [ReceivePort]s. Any message sent through
 a [SendPort] is delivered to its corresponding [ReceivePort]. There might be
 many [SendPort]s for the same [ReceivePort].

 [SendPort]s can be transmitted to other isolates, and they preserve equality
 when sent.

## Dependencies

- Capability

