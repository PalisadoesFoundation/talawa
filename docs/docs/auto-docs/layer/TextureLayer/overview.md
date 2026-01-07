# Overview for `TextureLayer`

## Description

A composited layer that maps a backend texture to a rectangle.

 Backend textures are images that can be applied (mapped) to an area of the
 Flutter view. They are created, managed, and updated using a
 platform-specific texture registry. This is typically done by a plugin
 that integrates with host platform video player, camera, or OpenGL APIs,
 or similar image sources.

 A texture layer refers to its backend texture using an integer ID. Texture
 IDs are obtained from the texture registry and are scoped to the Flutter
 view. Texture IDs may be reused after deregistration, at the discretion
 of the registry. The use of texture IDs currently unknown to the registry
 will silently result in a blank rectangle.

 Once inserted into the layer tree, texture layers are repainted autonomously
 as dictated by the backend (e.g. on arrival of a video frame). Such
 repainting generally does not involve executing Dart code.

 Texture layers are always leaves in the layer tree.

 See also:

  * [TextureRegistry](..//javadoc/io/flutter/view/TextureRegistry.md)
    for how to create and manage backend textures on Android.
  * [TextureRegistry Protocol](..//ios-embedder/protocol_flutter_texture_registry-p.md)
    for how to create and manage backend textures on iOS.

## Dependencies

- Layer

## Members

- **rect**: `Rect`
  Bounding rectangle of this layer.

- **textureId**: `int`
  The identity of the backend texture.

- **freeze**: `bool`
  When true the texture will not be updated with new frames.

 This is used for resizing embedded Android views: when resizing there
 is a short period during which the framework cannot tell if the newest
 texture frame has the previous or new size; to work around this, the
 framework "freezes" the texture just before resizing the Android view and
 un-freezes it when it is certain that a frame with the new size is ready.

- **filterQuality**: `ui.FilterQuality`
  

## Constructors

### Unnamed Constructor
Creates a texture layer bounded by [rect] and with backend texture
 identified by [textureId], if [freeze] is true new texture frames will not be
 populated to the texture, and use [filterQuality] to set layer's [FilterQuality].

