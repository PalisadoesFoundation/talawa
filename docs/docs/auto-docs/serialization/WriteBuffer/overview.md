# Overview for `WriteBuffer`

## Description

Write-only buffer for incrementally building a [ByteData] instance.

 A WriteBuffer instance can be used only once. Attempts to reuse will result
 in [StateError]s being thrown.

 The byte order used is [Endian.host] throughout.

## Members

- **_buffer**: `Uint8List`
- **_currentSize**: `int`
- **_isDone**: `bool`
- **_eightBytes**: `ByteData`
- **_eightBytesAsList**: `Uint8List`
- **_zeroBuffer**: `Uint8List`
## Constructors

### Unnamed Constructor
Creates an interface for incrementally building a [ByteData] instance.
 [startCapacity] determines the start size of the [WriteBuffer] in bytes.
 The closer that value is to the real size used, the better the
 performance.

### _


#### Parameters

- `_buffer`: `dynamic`
- `_eightBytes`: `dynamic`
- `_eightBytesAsList`: `dynamic`
