# Method: `lastChild`

## Description

The last child in the viewport according to the traversal order of the
 [mainAxis].

 

 This value is null during [layoutChildSequence] as children are reified
 into the correct order after layout is completed. This can be used when
 overriding [paint] in order to paint the children in the correct order.

## Return Type
`RenderBox?`

