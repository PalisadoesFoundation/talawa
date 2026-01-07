# Overview for `StringConversionSink`

## Description

A sink for converters to efficiently transmit String data.

 Instead of limiting the interface to one non-chunked [String] it accepts
 partial strings or can be transformed into a byte sink that
 accepts UTF-8 code units.

 The [StringConversionSink] class provides a default implementation of
 [add], [asUtf8Sink] and [asStringSink].

## Dependencies

- ChunkedConversionSink

## Constructors

### Unnamed Constructor


### withCallback


#### Parameters

- ``: `dynamic`
### from


#### Parameters

- `sink`: `Sink&lt;String&gt;`
### fromStringSink
Creates a new instance wrapping the given [sink].

 Every string that is added to the returned instance is forwarded to
 the [sink]. The instance is allowed to buffer and is not required to
 forward immediately.

#### Parameters

- `sink`: `StringSink`
