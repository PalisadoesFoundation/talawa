# Method: `debugThrowIfNotCheckingIntrinsics`

## Description

Throws an exception saying that the object does not support returning
 intrinsic dimensions if, in debug mode, we are not in the
 [RenderObject.debugCheckingIntrinsics] mode.

 This is used by [computeMinIntrinsicWidth] et al because viewports do not
 generally support returning intrinsic dimensions. See the discussion at
 [computeMinIntrinsicWidth].

## Return Type
`bool`

