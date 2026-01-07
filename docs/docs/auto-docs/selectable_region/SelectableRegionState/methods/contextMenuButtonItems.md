# Method: `contextMenuButtonItems`

## Description

Returns the [ContextMenuButtonItem]s representing the buttons in this
 platform's default selection menu.

 See also:

 * [SelectableRegion.getSelectableButtonItems], which performs a similar role,
   but for any selectable text, not just specifically SelectableRegion.
 * [EditableTextState.contextMenuButtonItems], which performs a similar role
   but for content that is not just selectable but also editable.
 * [contextMenuAnchors], which provides the anchor points for the default
   context menu.
 * [AdaptiveTextSelectionToolbar], which builds the toolbar itself, and can
   take a list of [ContextMenuButtonItem]s with
   [AdaptiveTextSelectionToolbar.buttonItems].
 * [AdaptiveTextSelectionToolbar.getAdaptiveButtons], which builds the
   button Widgets for the current platform given [ContextMenuButtonItem]s.

## Return Type
`List&lt;ContextMenuButtonItem&gt;`

