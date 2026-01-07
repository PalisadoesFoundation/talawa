# Method: `applyNewDimensions`

## Description

Notifies the activity that the dimensions of the underlying viewport or
 contents have changed.

 Called after [applyViewportDimension] or [applyContentDimensions] have
 changed the [minScrollExtent], the [maxScrollExtent], or the
 [viewportDimension]. When this method is called, it should be called
 _after_ any corrections are applied to [pixels] using [correctPixels], not
 before.

 The default implementation informs the [activity] of the new dimensions by
 calling its [ScrollActivity.applyNewDimensions] method.

 See also:

  * [applyViewportDimension], which is called when new
    viewport dimensions are established.
  * [applyContentDimensions], which is called after new
    viewport dimensions are established, and also if new content dimensions
    are established, and which calls [ScrollPosition.applyNewDimensions].

## Return Type
`void`

