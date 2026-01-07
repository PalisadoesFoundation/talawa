# Method: `enableContextMenu`

## Description

Enable the browser's context menu.

 By default, when the app starts, the browser's context menu is already
 enabled. Typically this method would be called after first calling
 [disableContextMenu].

 This is an asynchronous action. The context menu can be considered to be
 enabled at the time that the Future resolves. [enabled] won't reflect the
 change until that time.

 See also:
  * [disableContextMenu], which performs the opposite operation.

## Return Type
`Future&lt;void&gt;`

