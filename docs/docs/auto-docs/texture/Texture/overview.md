# Overview for `Texture`

## Description



## Dependencies

- NativeFieldWrapperClass1

## Members

- **_valid**: `bool`
- **storageMode**: `StorageMode`
- **format**: `PixelFormat`
- **width**: `int`
- **height**: `int`
- **sampleCount**: `int`
- **enableRenderTargetUsage**: `bool`
  Enable using this texture as a render pass attachment.

- **enableShaderReadUsage**: `bool`
  Enable reading or sampling from this texture in a shader.

- **enableShaderWriteUsage**: `bool`
  Enable writing to the texture in a shader.

 Note that this is distinct from [enableRenderTargetUsage].

- **_coordinateSystem**: `TextureCoordinateSystem`
## Constructors

### _initialize
Creates a new Texture.

#### Parameters

- `gpuContext`: `GpuContext`
- `storageMode`: `dynamic`
- `format`: `dynamic`
- `width`: `dynamic`
- `height`: `dynamic`
- `sampleCount`: `dynamic`
- `coordinateSystem`: `TextureCoordinateSystem`
- `enableRenderTargetUsage`: `dynamic`
- `enableShaderReadUsage`: `dynamic`
- `enableShaderWriteUsage`: `dynamic`
