# Method: `isVisible`

## Description

Whether or not the child is actually visible within the viewport.

 For example, if a child is contained within the
 [RenderTwoDimensionalViewport.cacheExtent] and out of view.

 This is used during [RenderTwoDimensionalViewport.paint] in order to skip
 painting children that cannot be seen.

## Return Type
`bool`

