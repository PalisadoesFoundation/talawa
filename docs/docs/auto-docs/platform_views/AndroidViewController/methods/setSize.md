# Method: `setSize`

## Description

Sizes the Android View.

 [size] is the view's new size in logical pixel. It must be greater than
 zero.

 The first time a size is set triggers the creation of the Android view.

 Returns the buffer size in logical pixel that backs the texture where the platform
 view pixels are written to.

 The buffer size may or may not be the same as [size].

 As a result, consumers are expected to clip the texture using [size], while using
 the return value to size the texture.

## Return Type
`Future&lt;Size&gt;`

## Parameters

- `size`: `Size`
