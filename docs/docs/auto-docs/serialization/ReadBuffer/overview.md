# Overview for `ReadBuffer`

## Description

Read-only buffer for reading sequentially from a [ByteData] instance.

 The byte order used is [Endian.host] throughout.

## Members

- **data**: `ByteData`
  The underlying data being read.

- **_position**: `int`
  The position to read next.

## Constructors

### Unnamed Constructor
Creates a [ReadBuffer] for reading from the specified [data].

