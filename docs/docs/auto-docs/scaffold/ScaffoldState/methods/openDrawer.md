# Method: `openDrawer`

## Description

Opens the [Drawer] (if any).

 If the scaffold has a non-null [Scaffold.drawer], this function will cause
 the drawer to begin its entrance animation.

 Normally this is not needed since the [Scaffold] automatically shows an
 appropriate [IconButton], and handles the edge-swipe gesture, to show the
 drawer.

 To close the drawer, use either [ScaffoldState.closeDrawer] or
 [Navigator.pop].

 See [Scaffold.of] for information about how to obtain the [ScaffoldState].

## Return Type
`void`

