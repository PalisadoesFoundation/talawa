# Method: `clone`

## Description

Creates an [ImageInfo] with a cloned [image].

 This method must be used in cases where a client holding an [ImageInfo]
 needs to share the image info object with another client and will still
 need to access the underlying image data at some later point, e.g. to
 share it again with another client.

 See details for disposing contract in the class description.

 See also:

  * [ui.Image.clone], which describes how and why to clone images.

## Return Type
`ImageInfo`

