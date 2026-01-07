# Method: `contextMenuButtonItems`

## Description

Returns the [ContextMenuButtonItem]s representing the buttons in this
 platform's default selection menu for [EditableText].

 See also:

 * [EditableText.getEditableButtonItems], which performs a similar role,
   but for any editable field, not just specifically EditableText.
 * [SystemContextMenu.getDefaultItems], which performs a similar role, but
   for the system-rendered context menu.
 * [SelectableRegionState.contextMenuButtonItems], which performs a similar
   role but for content that is selectable but not editable.
 * [contextMenuAnchors], which provides the anchor points for the default
   context menu.
 * [AdaptiveTextSelectionToolbar], which builds the toolbar itself, and can
   take a list of [ContextMenuButtonItem]s with
   [AdaptiveTextSelectionToolbar.buttonItems].
 * [AdaptiveTextSelectionToolbar.getAdaptiveButtons], which builds the
   button Widgets for the current platform given [ContextMenuButtonItem]s.

## Return Type
`List&lt;ContextMenuButtonItem&gt;`

