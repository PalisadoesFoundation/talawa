# Method: `endBatchEdit`

## Description

Ends the current batch edit started by the last call to [beginBatchEdit],
 and send [currentTextEditingValue] to the text input plugin if needed.

 Throws an error in debug mode if this [EditableText] is not in a batch
 edit.

## Return Type
`void`

