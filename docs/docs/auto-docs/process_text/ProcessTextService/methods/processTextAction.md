# Method: `processTextAction`

## Description

Returns a [Future] that resolves to a [String] when the text action
 returns a transformed text or null when the text action did not return
 a transformed text.

 The `id` parameter is the text action unique identifier returned by
 [queryTextActions].

 The `text` parameter is the text to be processed.

 The `readOnly` parameter indicates that the transformed text, if it exists,
 will be used as read-only.

## Return Type
`Future<String?>`

## Parameters

- `id`: `String`
- `text`: `String`
- `readOnly`: `bool`
