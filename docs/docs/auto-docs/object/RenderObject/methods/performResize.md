# Method: `performResize`

## Description


 Updates the render objects size using only the constraints.

 Do not call this function directly: call [layout] instead. This function
 is called by [layout] when there is actually work to be done by this
 render object during layout. The layout constraints provided by your
 parent are available via the [constraints] getter.

 This function is called only if [sizedByParent] is true.
 

 Subclasses that set [sizedByParent] to true should override this method to
 compute their size. Subclasses of [RenderBox] should consider overriding
 [RenderBox.computeDryLayout] instead.

## Return Type
`void`

