# Method: `openEndDrawer`

## Description

Opens the end side [Drawer] (if any).

 If the scaffold has a non-null [Scaffold.endDrawer], this function will cause
 the end side drawer to begin its entrance animation.

 Normally this is not needed since the [Scaffold] automatically shows an
 appropriate [IconButton], and handles the edge-swipe gesture, to show the
 drawer.

 To close the drawer, use either [ScaffoldState.closeEndDrawer] or
 [Navigator.pop].

 See [Scaffold.of] for information about how to obtain the [ScaffoldState].

## Return Type
`void`

