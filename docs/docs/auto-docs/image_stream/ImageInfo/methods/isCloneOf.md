# Method: `isCloneOf`

## Description

Whether this [ImageInfo] is a [clone] of the `other`.

 This method is a convenience wrapper for [ui.Image.isCloneOf], and is
 useful for clients that are trying to determine whether new layout or
 painting logic is required when receiving a new image reference.

 

 The following sample shows how to appropriately check whether the
 [ImageInfo] reference refers to new image data or not (in this case in a
 setter).

 ```dart
 ImageInfo? get imageInfo => _imageInfo;
 ImageInfo? _imageInfo;
 set imageInfo (ImageInfo? value) 
 ```
 

## Return Type
`bool`

## Parameters

- `other`: `ImageInfo`
