# Overview for `TextSelectionOverlay`

## Description

An object that manages a pair of text selection handles for a
 [RenderEditable].

 This class is a wrapper of [SelectionOverlay] to provide APIs specific for
 [RenderEditable]s. To manage selection handles for custom widgets, use
 [SelectionOverlay] instead.

## Members

- **context**: `BuildContext`
  
 The context in which the selection UI should appear.

 This context must have an [Overlay] as an ancestor because this object
 will display the text selection handles in that [Overlay].
 

- **renderObject**: `RenderEditable`
  The editable line in which the selected text is being displayed.

- **selectionControls**: `TextSelectionControls?`
  

- **selectionDelegate**: `TextSelectionDelegate`
  

- **_selectionOverlay**: `SelectionOverlay`
- **contextMenuBuilder**: `WidgetBuilder?`
  

 If not provided, no context menu will be built.

- **_value**: `TextEditingValue`
- **_effectiveStartHandleVisibility**: `ValueNotifier&lt;bool&gt;`
- **_effectiveEndHandleVisibility**: `ValueNotifier&lt;bool&gt;`
- **_effectiveToolbarVisibility**: `ValueNotifier&lt;bool&gt;`
- **_handlesVisible**: `bool`
- **_endHandleDragPosition**: `double`
- **_endHandleDragTarget**: `double`
- **_dragStartSelection**: `TextSelection?`
- **_startHandleDragPosition**: `double`
- **_startHandleDragTarget**: `double`
## Constructors

### Unnamed Constructor
Creates an object that manages overlay entries for selection handles.

 The [context] must have an [Overlay] as an ancestor.

