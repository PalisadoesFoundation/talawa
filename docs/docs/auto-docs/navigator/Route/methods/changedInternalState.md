# Method: `changedInternalState`

## Description

Called whenever the internal state of the route has changed.

 This should be called whenever [willHandlePopInternally], [didPop],
 [ModalRoute.offstage], or other internal state of the route changes value.
 It is used by [ModalRoute], for example, to report the new information via
 its inherited widget to any children of the route.

 See also:

  * [changedExternalState], which is called when the [Navigator] has
    updated in some manner that might affect the routes.

## Return Type
`void`

