# Method: `debugLayer`

## Description

In debug mode, the compositing layer that this render object uses to repaint.

 This getter is intended for debugging purposes only. In release builds, it
 always returns null. In debug builds, it returns the layer even if the layer
 is dirty.

 For production code, consider [layer].

## Return Type
`ContainerLayer?`

