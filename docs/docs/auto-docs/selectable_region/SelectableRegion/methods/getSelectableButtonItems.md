# Method: `getSelectableButtonItems`

## Description

Returns the [ContextMenuButtonItem]s representing the buttons in this
 platform's default selection menu.

 For example, [SelectableRegion] uses this to generate the default buttons
 for its context menu.

 See also:

 * [SelectableRegionState.contextMenuButtonItems], which gives the
   [ContextMenuButtonItem]s for a specific SelectableRegion.
 * [EditableText.getEditableButtonItems], which performs a similar role but
   for content that is both selectable and editable.
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
