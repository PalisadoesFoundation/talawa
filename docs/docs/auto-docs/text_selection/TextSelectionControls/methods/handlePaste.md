# Method: `handlePaste`

## Description

Call [TextSelectionDelegate.pasteText] to paste text.

 This is called by subclasses when their paste affordance is activated by
 the user.

 This function is asynchronous since interacting with the clipboard is
 asynchronous. Race conditions may exist with this API as currently
 implemented.

## Return Type
`Future&lt;void&gt;`

## Parameters

- `delegate`: `TextSelectionDelegate`
