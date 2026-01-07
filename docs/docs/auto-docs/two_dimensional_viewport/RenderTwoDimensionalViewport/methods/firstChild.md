# Method: `firstChild`

## Description

The first child of the viewport according to the traversal order of the
 [mainAxis].

 
 The [mainAxis] correlates with the [ChildVicinity] of each child to paint
 the children in a row or column major order.

 By default, the [mainAxis] is [Axis.vertical], which would result in a
 row major paint order, visiting children in the horizontal indices before
 advancing to the next vertical index.
 

 This value is null during [layoutChildSequence] as children are reified
 into the correct order after layout is completed. This can be used when
 overriding [paint] in order to paint the children in the correct order.

## Return Type
`RenderBox?`

