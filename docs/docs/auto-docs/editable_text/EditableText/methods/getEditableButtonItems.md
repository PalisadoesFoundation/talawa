# Method: `getEditableButtonItems`

## Description

Returns the [ContextMenuButtonItem]s representing the buttons in this
 platform's default selection menu for an editable field.

 For example, [EditableText] uses this to generate the default buttons for
 its context menu.

 See also:

 * [EditableTextState.contextMenuButtonItems], which gives the
   [ContextMenuButtonItem]s for a specific EditableText.
 * [SelectableRegion.getSelectableButtonItems], which performs a similar
   role but for content that is selectable but not editable.
 * [AdaptiveTextSelectionToolbar], which builds the toolbar itself, and can
   take a list of [ContextMenuButtonItem]s with
   [AdaptiveTextSelectionToolbar.buttonItems].
 * [AdaptiveTextSelectionToolbar.getAdaptiveButtons], which builds the button
   Widgets for the current platform given [ContextMenuButtonItem]s.

## Return Type
`List&lt;ContextMenuButtonItem&gt;`

## Parameters

- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
