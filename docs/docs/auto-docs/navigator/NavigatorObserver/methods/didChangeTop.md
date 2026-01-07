# Method: `didChangeTop`

## Description

The top most route has changed.

 The `topRoute` is the new top most route. This can be a new route pushed
 on top of the screen, or an existing route that becomes the new top-most
 route because the previous top-most route has been popped.

 The `previousTopRoute` was the top most route before the change. This can
 be a route that was popped off the screen, or a route that will be covered
 by the `topRoute`. This can also be null if this is the first build.

## Return Type
`void`

## Parameters

- `topRoute`: `Route&lt;dynamic&gt;`
- `previousTopRoute`: `Route&lt;dynamic&gt;?`
