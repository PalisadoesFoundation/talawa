# Method: `emplace`

## Description

Append byte data to the end of the [HostBuffer] and produce a [BufferView]
 that references the new data in the buffer.

 This method automatically inserts padding in-between emplace calls in the
 buffer if necessary to abide by platform-specific uniform alignment
 requirements.

 The [DeviceBuffer] referenced in the [BufferView] has already been
 flushed, so there is no need to call [DeviceBuffer.flush] before
 referencing it in a command.

## Return Type
`BufferView`

## Parameters

- `bytes`: `ByteData`
