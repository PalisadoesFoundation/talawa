# Method: `disableContextMenu`

## Description

Disable the browser's context menu.

 By default, when the app starts, the browser's context menu is already
 enabled.

 This is an asynchronous action. The context menu can be considered to be
 disabled at the time that the Future resolves. [enabled] won't reflect the
 change until that time.

 See also:
  * [enableContextMenu], which performs the opposite operation.

## Return Type
`Future&lt;void&gt;`

