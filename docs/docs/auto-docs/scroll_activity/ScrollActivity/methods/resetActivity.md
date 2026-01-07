# Method: `resetActivity`

## Description

Called by the [ScrollActivityDelegate] when it has changed type (for
 example, when changing from an Android-style scroll position to an
 iOS-style scroll position). If this activity can differ between the two
 modes, then it should tell the position to restart that activity
 appropriately.

 For example, [BallisticScrollActivity]'s implementation calls
 [ScrollActivityDelegate.goBallistic].

## Return Type
`void`

