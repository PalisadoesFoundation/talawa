# Method: `createDeviceBuffer`

## Description

Allocates a new region of GPU-resident memory.

 The [storageMode] must be either [StorageMode.hostVisible] or
 [StorageMode.devicePrivate], otherwise an exception will be thrown.

 Throws an exception if the [DeviceBuffer] creation failed.

## Return Type
`DeviceBuffer`

## Parameters

- `storageMode`: `StorageMode`
- `sizeInBytes`: `int`
