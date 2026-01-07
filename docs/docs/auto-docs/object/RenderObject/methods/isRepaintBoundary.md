# Method: `isRepaintBoundary`

## Description

Whether this render object repaints separately from its parent.

 Override this in subclasses to indicate that instances of your class ought
 to repaint independently. For example, render objects that repaint
 frequently might want to repaint themselves without requiring their parent
 to repaint.

 If this getter returns true, the [paintBounds] are applied to this object
 and all descendants. The framework invokes [RenderObject.updateCompositedLayer]
 to create an [OffsetLayer] and assigns it to the [layer] field.
 Render objects that declare themselves as repaint boundaries must not replace
 the layer created by the framework.

 If the value of this getter changes, [markNeedsCompositingBitsUpdate] must
 be called.

 See [RepaintBoundary] for more information about how repaint boundaries function.

## Return Type
`bool`

