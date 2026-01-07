# Method: `debugAsymmetricPaintCount`

## Description

The number of times that either this render object repainted without the
 parent being painted, or the parent repainted without this object being
 painted. When a repaint boundary is used at a seam in the render tree
 where the parent tends to repaint at entirely different times than the
 child, it can improve performance by reducing the number of paint
 operations that have to be recorded each frame.

 Only valid when asserts are enabled. In release builds, always returns
 zero.

 Can be reset using [debugResetMetrics]. See [debugSymmetricPaintCount] for
 the corresponding count of times where both the parent and the child
 painted together.

## Return Type
`int`

