# Overview for `DeviceBuffer`

## Description

[DeviceBuffer] is a region of memory allocated on the device heap
 (GPU-resident memory).

## Dependencies

- NativeFieldWrapperClass1

## Members

- **_valid**: `bool`
- **storageMode**: `StorageMode`
- **sizeInBytes**: `int`
## Constructors

### _initialize
Creates a new DeviceBuffer.

#### Parameters

- `gpuContext`: `GpuContext`
- `storageMode`: `StorageMode`
- `sizeInBytes`: `int`
### _initializeWithHostData
Creates a new host visible DeviceBuffer with data copied from the host.

#### Parameters

- `gpuContext`: `GpuContext`
- `data`: `ByteData`
