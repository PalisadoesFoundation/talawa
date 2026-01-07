# Method: `toImage`

## Description

Creates a raster image representation of the current state of the scene.

 This is a slow operation that is performed on a background thread.

 Callers must dispose the [Image] when they are done with it. If the result
 will be shared with other methods or classes, [Image.clone] should be used
 and each handle created must be disposed.

## Return Type
`Future&lt;Image&gt;`

## Parameters

- `width`: `int`
- `height`: `int`
