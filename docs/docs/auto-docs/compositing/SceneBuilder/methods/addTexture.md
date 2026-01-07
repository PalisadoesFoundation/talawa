# Method: `addTexture`

## Description

Adds a backend texture to the scene.

 The texture is scaled to the given size and rasterized at the given offset.

 If `freeze` is true the texture that is added to the scene will not
 be updated with new frames. `freeze` is used when resizing an embedded
 Android view: When resizing an Android view there is a short period during
 which the framework cannot tell if the newest texture frame has the
 previous or new size, to workaround this the framework "freezes" the
 texture just before resizing the Android view and un-freezes it when it is
 certain that a frame with the new size is ready.

## Return Type
`void`

## Parameters

- `textureId`: `int`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
