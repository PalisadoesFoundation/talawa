# Overview for `SelectableRegionState`

## Description

State for a [SelectableRegion].

## Dependencies

- State, TextSelectionDelegate, SelectionRegistrar

## Members

- **_actions**: `Map&lt;Type, Action&lt;Intent&gt;&gt;`
- **_gestureRecognizers**: `Map&lt;Type, GestureRecognizerFactory&gt;`
- **_selectionOverlay**: `SelectionOverlay?`
- **_startHandleLayerLink**: `LayerLink`
- **_endHandleLayerLink**: `LayerLink`
- **_toolbarLayerLink**: `LayerLink`
- **_selectionDelegate**: `StaticSelectionContainerDelegate`
- **_selectable**: `Selectable?`
- **_lastOrientation**: `Orientation?`
- **_lastSelectedContent**: `SelectedContent?`
- **_processTextService**: `ProcessTextService`
  The text processing service used to retrieve the native text processing actions.

- **_processTextActions**: `List&lt;ProcessTextAction&gt;`
  The list of native text processing actions provided by the engine.

- **_localFocusNode**: `FocusNode?`
- **_selectionStatusNotifier**: `_SelectableRegionSelectionStatusNotifier`
  Notifies its listeners when the selection state in this [SelectableRegion] changes.

- **_isShiftPressed**: `bool`
  Whether the Shift key was pressed when the most recent [PointerDownEvent]
 was tracked by the [BaseTapAndDragGestureRecognizer].

- **_lastSecondaryTapDownPosition**: `Offset?`
- **_lastPointerDeviceKind**: `PointerDeviceKind?`
- **_doubleTapOffset**: `Offset?`
- **_selectionEndPosition**: `Offset?`
- **_scheduledSelectionEndEdgeUpdate**: `bool`
- **_selectionStartPosition**: `Offset?`
- **_scheduledSelectionStartEdgeUpdate**: `bool`
- **_selectionStartHandleDragPosition**: `Offset`
- **_selectionEndHandleDragPosition**: `Offset`
- **_adjustingSelectionEnd**: `bool?`
- **_directionalHorizontalBaseline**: `double?`
- **textEditingValue**: `TextEditingValue`
