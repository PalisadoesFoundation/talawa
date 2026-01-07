# Method: `supportsRasterization`

## Description

Whether or not this layer, or any child layers, can be rasterized with
 [ui.Scene.toImage] or [ui.Scene.toImageSync].

 If `false`, calling the above methods may yield an image which is
 incomplete.

 This value may change throughout the lifetime of the object, as the
 child layers themselves are added or removed.

## Return Type
`bool`

