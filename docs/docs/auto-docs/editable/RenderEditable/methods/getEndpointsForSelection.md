# Method: `getEndpointsForSelection`

## Description

Returns the local coordinates of the endpoints of the given selection.

 If the selection is collapsed (and therefore occupies a single point), the
 returned list is of length one. Otherwise, the selection is not collapsed
 and the returned list is of length two. In this case, however, the two
 points might actually be co-located (e.g., because of a bidirectional
 selection that contains some text but whose ends meet in the middle).

 See also:

  * [getLocalRectForCaret], which is the equivalent but for
    a [TextPosition] rather than a [TextSelection].

## Return Type
`List&lt;TextSelectionPoint&gt;`

## Parameters

- `selection`: `TextSelection`
