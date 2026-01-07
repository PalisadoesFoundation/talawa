# Method: `flush`

## Description

Flush the contents of the [DeviceBuffer] to the GPU.

 This method can only be used if the [DeviceBuffer] was created with
 [StorageMode.hostVisible]. An exception will be thrown otherwise.

 If [lengthInBytes] is set to -1, the entire buffer will be flushed.

 On devices with coherent host memory (memory shared between the CPU and
 GPU), this method is a no-op.

## Return Type
`void`

## Parameters

- ``: `dynamic`
- ``: `dynamic`
