# Method: `enabled`

## Description

Whether showing the browser's context menu is enabled.

 When true, any event that the browser typically uses to trigger its
 context menu (e.g. right click) will do so. When false, the browser's
 context menu will not show.

 It's possible for this to be true but for the browser's context menu to
 not show due to direct manipulation of the DOM. For example, handlers for
 the browser's `contextmenu` event could be added/removed in the browser's
 JavaScript console, and this boolean wouldn't know about it. This boolean
 only indicates the results of calling [disableContextMenu] and
 [enableContextMenu] here.

 Defaults to true.

## Return Type
`bool`

