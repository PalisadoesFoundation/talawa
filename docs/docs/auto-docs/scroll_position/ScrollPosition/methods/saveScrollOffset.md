# Method: `saveScrollOffset`

## Description

Called whenever scrolling ends, to store the current scroll offset in a
 storage mechanism with a lifetime that matches the app's lifetime.

 The stored value will be used by [restoreScrollOffset] when the
 [ScrollPosition] is recreated, in the case of the [Scrollable] being
 disposed then recreated in the same session. This might happen, for
 instance, if a [ListView] is on one of the pages inside a [TabBarView],
 and that page is displayed, then hidden, then displayed again.

 The default implementation writes the [pixels] using the nearest
 [PageStorage] found from the [context]'s [ScrollContext.storageContext]
 property.

## Return Type
`void`

