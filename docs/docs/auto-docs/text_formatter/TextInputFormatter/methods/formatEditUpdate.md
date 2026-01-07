# Method: `formatEditUpdate`

## Description

Called when text is being typed or cut/copy/pasted in the [EditableText].

 You can override the resulting text based on the previous text value and
 the incoming new text value.

 When formatters are chained, `oldValue` reflects the initial value of
 [TextEditingValue] at the beginning of the chain.

## Return Type
`TextEditingValue`

## Parameters

- `oldValue`: `TextEditingValue`
- `newValue`: `TextEditingValue`
