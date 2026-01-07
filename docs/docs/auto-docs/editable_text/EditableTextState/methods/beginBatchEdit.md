# Method: `beginBatchEdit`

## Description

Begins a new batch edit, within which new updates made to the text editing
 value will not be sent to the platform text input plugin.

 Batch edits nest. When the outermost batch edit finishes, [endBatchEdit]
 will attempt to send [currentTextEditingValue] to the text input plugin if
 it detected a change.

## Return Type
`void`

