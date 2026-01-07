# Method: `didChangeNext`

## Description

This route's next route has changed to the given new route.

 This is called on a route whenever the next route changes for any reason,
 so long as it is in the history, including when a route is first added to
 a [Navigator] (e.g. by [Navigator.push]), except for cases when
 [didPopNext] would be called.

 The `nextRoute` argument will be null if there's no new next route (i.e.
 if [isCurrent] is true).

## Return Type
`void`

## Parameters

- `nextRoute`: `Route&lt;dynamic&gt;?`
