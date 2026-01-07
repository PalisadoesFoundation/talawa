# Method: `extractFromInlineSpan`

## Description

Helper function for extracting [WidgetSpan]s in preorder, from the given
 [InlineSpan] as a list of widgets.

 The `textScaler` is the scaling strategy for scaling the content.

 This function is used by [EditableText] and [RichText] so calling it
 directly is rarely necessary.

## Return Type
`List&lt;Widget&gt;`

## Parameters

- `span`: `InlineSpan`
- `textScaler`: `TextScaler`
