# Method: `restoreScrollOffset`

## Description

Called whenever the [ScrollPosition] is created, to restore the scroll
 offset if possible.

 The value is stored by [saveScrollOffset] when the scroll position
 changes, so that it can be restored in the case of the [Scrollable] being
 disposed then recreated in the same session. This might happen, for
 instance, if a [ListView] is on one of the pages inside a [TabBarView],
 and that page is displayed, then hidden, then displayed again.

 The default implementation reads the value from the nearest [PageStorage]
 found from the [context]'s [ScrollContext.storageContext] property, and
 sets it using [correctPixels], if [pixels] is still null.

 This method is called from the constructor, so layout has not yet
 occurred, and the viewport dimensions aren't yet known when it is called.

## Return Type
`void`

