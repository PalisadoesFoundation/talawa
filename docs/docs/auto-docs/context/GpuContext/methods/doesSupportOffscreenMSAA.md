# Method: `doesSupportOffscreenMSAA`

## Description

Whether the backend supports multisample anti-aliasing for offscreen
 color and stencil attachments. A subset of OpenGLES-only devices do not
 support this functionality.

 Any texture created via [createTexture] is an offscreen texture.
 There is currently no way to render directly against the "onscreen"
 texture that the framework renders to, so all Flutter GPU textures are
 "offscreen".

## Return Type
`bool`

