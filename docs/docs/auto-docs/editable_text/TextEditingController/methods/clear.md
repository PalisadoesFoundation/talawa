# Method: `clear`

## Description

Set the [value] to empty.

 After calling this function, [text] will be the empty string and the
 selection will be collapsed at zero offset.

 Calling this will notify all the listeners of this [TextEditingController]
 that they need to update (it calls [notifyListeners]). For this reason,
 this method should only be called between frames, e.g. in response to user
 actions, not during the build, layout, or paint phases.

## Return Type
`void`

