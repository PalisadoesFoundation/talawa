# Method: `recommendDeferredLoading`

## Description

Provides a heuristic to determine if expensive frame-bound tasks should be
 deferred.

 The actual work of this is delegated to the [physics] via
 [ScrollPhysics.recommendDeferredLoading] called with the current
 [activity]'s [ScrollActivity.velocity].

 Returning true from this method indicates that the [ScrollPhysics]
 evaluate the current scroll velocity to be great enough that expensive
 operations impacting the UI should be deferred.

## Return Type
`bool`

## Parameters

- `context`: `BuildContext`
