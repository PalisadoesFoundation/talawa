# Overview for `IOSink`

## Description

A combined byte and text output.

 An [IOSink] combines a [StreamSink] of bytes with a [StringSink],
 and allows easy output of both bytes and text.

 An `IOSink` is intended for writing bytes.
 Strings written through [write] or [writeCharCode] will be converted
 to bytes using [encoding].
 Integer data added using [add] or [addStream] will be treated as byte data,
 and will be truncated to unsigned 8-bit values as by using [int.toUnsigned].
 No guarantees are given for when such a conversion happens, since it
 depends on the implementation behind the sink.

 Writing text ([write]) and adding bytes ([add]) may be interleaved freely.

 While a stream is being added using [addStream], any further attempts
 to add or write to the [IOSink] will fail until the [addStream] completes.

 It is an error to add data to the [IOSink] after the sink is closed.

## Dependencies

- StreamSink, StringSink

## Members

- **encoding**: `Encoding`
  The [Encoding] used when writing strings.

 Depending on the underlying consumer, this property might be mutable.

## Constructors

### Unnamed Constructor
Create an [IOSink] that outputs to a [target] [StreamConsumer] of bytes.

 Text written to [StreamSink] methods is encoded to bytes using [encoding]
 before being output on [target].

