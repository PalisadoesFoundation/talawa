# Method: `createDeviceBufferWithCopy`

## Description

Allocates a new region of host-visible GPU-resident memory, initialized
 with the given [data].

 Given that the buffer will be immediately populated with [data] uploaded
 from the host, the [StorageMode] of the new [DeviceBuffer] is
 automatically set to [StorageMode.hostVisible].

 Throws an exception if the [DeviceBuffer] creation failed.

## Return Type
`DeviceBuffer`

## Parameters

- `data`: `ByteData`
