# Method: `getCurrentTransform`

## Description

Return the transform that was used in the last composition phase, if any.

 If the [FollowerLayer] has not yet been created, was never composited, or
 was unable to determine the transform (see
 [FollowerLayer.getLastTransform]), this returns the identity matrix (see
 [Matrix4.identity].

## Return Type
`Matrix4`

