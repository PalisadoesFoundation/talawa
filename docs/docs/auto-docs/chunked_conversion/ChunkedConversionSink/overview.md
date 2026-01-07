# Overview for `ChunkedConversionSink`

## Description

A [ChunkedConversionSink] is used to transmit data more efficiently between
 two converters during chunked conversions.

 The basic `ChunkedConversionSink` is just a [Sink], and converters should
 work with a plain `Sink`, but may work more efficiently with certain
 specialized types of `ChunkedConversionSink`.

## Dependencies

- Sink

## Constructors

### Unnamed Constructor


### withCallback


#### Parameters

- ``: `dynamic`
