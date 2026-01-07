# Method: `debugLayoutParent`

## Description

The [RenderObject] that's expected to call [layout] on this [RenderObject]
 in its [performLayout] implementation.

 This method is used to implement an assert that ensures the render subtree
 actively performing layout can not get accidentally mutated. It's only
 implemented in debug mode and always returns null in release mode.

 The default implementation returns [parent] and overriding is rarely
 needed. A [RenderObject] subclass that expects its
 [RenderObject.performLayout] to be called from a different [RenderObject]
 that's not its [parent] should override this property to return the actual
 layout parent.

## Return Type
`RenderObject?`

