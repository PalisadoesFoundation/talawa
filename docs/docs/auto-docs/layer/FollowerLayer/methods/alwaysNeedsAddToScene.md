# Method: `alwaysNeedsAddToScene`

## Description


 This disables retained rendering.

 A [FollowerLayer] copies changes from a [LeaderLayer] that could be anywhere
 in the Layer tree, and that leader layer could change without notifying the
 follower layer. Therefore we have to always call a follower layer's
 [addToScene]. In order to call follower layer's [addToScene], leader layer's
 [addToScene] must be called first so leader layer must also be considered
 as [alwaysNeedsAddToScene].
 

## Return Type
`bool`

