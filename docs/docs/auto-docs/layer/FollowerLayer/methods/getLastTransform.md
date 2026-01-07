# Method: `getLastTransform`

## Description

The transform that was used during the last composition phase.

 If the [link] was not linked to a [LeaderLayer], or if this layer has
 a degenerate matrix applied, then this will be null.

 This method returns a new [Matrix4] instance each time it is invoked.

## Return Type
`Matrix4?`

