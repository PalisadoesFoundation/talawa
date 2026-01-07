# Method: `buildRefreshIndicator`

## Description

Builds a refresh indicator that reflects the standard iOS pull-to-refresh
 behavior. Specifically, this entails presenting an activity indicator that
 changes depending on the current refreshState. As the user initially drags
 down, the indicator will gradually reveal individual ticks until the refresh
 becomes armed. At this point, the animated activity indicator will begin rotating.
 Once the refresh has completed, the activity indicator shrinks away as the
 space allocation animates back to closed.

## Return Type
`Widget`

## Parameters

- `context`: `BuildContext`
- `refreshState`: `RefreshIndicatorMode`
- `pulledExtent`: `double`
- `refreshTriggerPullDistance`: `double`
- `refreshIndicatorExtent`: `double`
