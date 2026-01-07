# Overview for `HostBuffer`

## Description

[HostBuffer] is a bump allocator that managed a [DeviceBuffer] block list.

 This is useful for chunking sparse data uploads, especially ephemeral
 uniform or vertex data that needs to change from frame to frame.

 Different platforms have different data alignment requirements when reading
 [DeviceBuffer] data for shader uniforms. [HostBuffer] uses
 [GpuContext.minimumUniformByteAlignment] to align each emplacement
 automatically, so that they may be used in uniform bindings.

 The length of each [DeviceBuffer] block is determined by
 [blockLengthInBytes] and cannot be changed after creation of the
 [HostBuffer]. If [HostBuffer.emplace] is given a [ByteData] that is larger
 than [blockLengthInBytes], a new [DeviceBuffer] block is created that
 matches the size of the oversized [ByteData].

## Members

- **kDefaultBlockLengthInBytes**: `int`
  The default length to use for each [DeviceBuffer] block.

- **blockLengthInBytes**: `int`
  The length to use for each [DeviceBuffer] block.

- **_kFrameCount**: `int`
- **_gpuContext**: `GpuContext`
- **_frameCursor**: `int`
  The current frame. Rotates through [frameCount] frames when [reset] is
 called.

- **_bufferCursor**: `int`
  The buffer within the current frame to be used for the next emplacement.

- **_offsetCursor**: `int`
  The offset within the current block to be used for the next emplacement.

- **_buffers**: `List&lt;List&lt;DeviceBuffer&gt;&gt;`
## Constructors

### _initialize
Creates a new HostBuffer.

#### Parameters

- `_gpuContext`: `dynamic`
- ``: `dynamic`
