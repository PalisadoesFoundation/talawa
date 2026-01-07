# Method: `canPaste`

## Description

Whether the text field managed by the given `delegate` supports pasting
 from the clipboard.

 Subclasses can use this to decide if they should expose the paste
 functionality to the user.

 This does not consider the contents of the clipboard. Subclasses may want
 to, for example, disallow pasting when the clipboard contains an empty
 string.

## Return Type
`bool`

## Parameters

- `delegate`: `TextSelectionDelegate`
