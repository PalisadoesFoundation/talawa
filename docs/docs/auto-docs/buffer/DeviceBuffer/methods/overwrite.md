# Method: `overwrite`

## Description

Overwrite a range of bytes within an existing [DeviceBuffer].

 This method can only be used if the [DeviceBuffer] was created with
 [StorageMode.hostVisible]. An exception will be thrown otherwise.

 After new writes have been staged, the [DeviceBuffer.flush] should be
 called prior to accessing the data. Otherwise, the updated data will not
 be copied to the GPU on devices that don't have host coherent memory.

 The entire length of [sourceBytes] will be copied into the [DeviceBuffer],
 starting at byte index [destinationOffsetInBytes] in the [DeviceBuffer].
 If performing this copy would result in an out of bounds write to the
 buffer, then the write will not be attempted and will fail.

 Returns [true] if the write was successful, or [false] if the write
 failed due to an internal error.

## Return Type
`bool`

## Parameters

- `sourceBytes`: `ByteData`
- ``: `dynamic`
