# Overview for `ByteConversionSink`

## Description

The [ByteConversionSink] provides an interface for converters to
 efficiently transmit byte data.

 Instead of limiting the interface to one non-chunked list of bytes it
 accepts its input in chunks (themselves being lists of bytes).

## Dependencies

- ChunkedConversionSink

## Constructors

### Unnamed Constructor


### withCallback


#### Parameters

- ``: `dynamic`
### from


#### Parameters

- `sink`: `Sink&lt;List&lt;int&gt;&gt;`
