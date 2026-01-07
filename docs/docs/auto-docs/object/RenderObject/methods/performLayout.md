# Method: `performLayout`

## Description

Do the work of computing the layout for this render object.

 Do not call this function directly: call [layout] instead. This function
 is called by [layout] when there is actually work to be done by this
 render object during layout. The layout constraints provided by your
 parent are available via the [constraints] getter.

 If [sizedByParent] is true, then this function should not actually change
 the dimensions of this render object. Instead, that work should be done by
 [performResize]. If [sizedByParent] is false, then this function should
 both change the dimensions of this render object and instruct its children
 to layout.

 In implementing this function, you must call [layout] on each of your
 children, passing true for parentUsesSize if your layout information is
 dependent on your child's layout information. Passing true for
 parentUsesSize ensures that this render object will undergo layout if the
 child undergoes layout. Otherwise, the child can change its layout
 information without informing this render object.

 Some special [RenderObject] subclasses (such as the one used by
 [OverlayPortal.overlayChildLayoutBuilder]) call [applyPaintTransform] in
 their [performLayout] implementation. To ensure such [RenderObject]s get
 the up-to-date paint transform, [RenderObject] subclasses should typically
 update the paint transform (as reported by [applyPaintTransform]) in this
 method instead of [paint].

## Return Type
`void`

