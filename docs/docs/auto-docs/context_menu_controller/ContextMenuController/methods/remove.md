# Method: `remove`

## Description

Remove this menu from the UI.

 Does nothing if this instance is not currently shown. In other words, if
 another context menu is currently shown, that menu will not be removed.

 This method should only be called once. The instance cannot be shown again
 after removing. Create a new instance.

 If an [onRemove] method was given to this instance, it will be called.

 See also:

  * [removeAny], which removes any shown instance of the context menu.

## Return Type
`void`

