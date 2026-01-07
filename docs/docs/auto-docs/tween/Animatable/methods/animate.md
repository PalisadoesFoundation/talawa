# Method: `animate`

## Description

Returns a new [Animation] that is driven by the given animation but that
 takes on values determined by this object.

 Essentially this returns an [Animation] that automatically applies the
 [evaluate] method to the parent's value.

 See also:

  * [AnimationController.drive], which does the same thing from the
    opposite starting point.

## Return Type
`Animation&lt;T&gt;`

## Parameters

- `parent`: `Animation&lt;double&gt;`
