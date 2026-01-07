# Method: `debugSymmetricPaintCount`

## Description

The number of times that this render object repainted at the same time as
 its parent. Repaint boundaries are only useful when the parent and child
 paint at different times. When both paint at the same time, the repaint
 boundary is redundant, and may be actually making performance worse.

 Only valid when asserts are enabled. In release builds, always returns
 zero.

 Can be reset using [debugResetMetrics]. See [debugAsymmetricPaintCount]
 for the corresponding count of times where only the parent or only the
 child painted.

## Return Type
`int`

