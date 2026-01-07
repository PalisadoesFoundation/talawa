# Overview for `SelectionOverlay`

## Description

An object that manages a pair of selection handles and a toolbar.

 The selection handles are displayed in the [Overlay] that most closely
 encloses the given [BuildContext].

## Members

- **context**: `BuildContext`
  

- **_magnifierInfo**: `ValueNotifier&lt;MagnifierInfo&gt;`
- **_magnifierController**: `MagnifierController`
- **magnifierConfiguration**: `TextMagnifierConfiguration`
  The configuration for the magnifier.

 By default, [SelectionOverlay]'s [TextMagnifierConfiguration] is disabled.

 

- **_startHandleType**: `TextSelectionHandleType`
- **_lineHeightAtStart**: `double`
- **_isDraggingStartHandle**: `bool`
- **startHandlesVisible**: `ValueListenable&lt;bool&gt;?`
  Whether the start handle is visible.

 If the value changes, the start handle uses [FadeTransition] to transition
 itself on and off the screen.

 If this is null, the start selection handle will always be visible.

- **onStartHandleDragStart**: `ValueChanged&lt;DragStartDetails&gt;?`
  Called when the users start dragging the start selection handles.

- **onStartHandleDragUpdate**: `ValueChanged&lt;DragUpdateDetails&gt;?`
  Called when the users drag the start selection handles to new locations.

- **onStartHandleDragEnd**: `ValueChanged&lt;DragEndDetails&gt;?`
  Called when the users lift their fingers after dragging the start selection
 handles.

- **_endHandleType**: `TextSelectionHandleType`
- **_lineHeightAtEnd**: `double`
- **_isDraggingEndHandle**: `bool`
- **endHandlesVisible**: `ValueListenable&lt;bool&gt;?`
  Whether the end handle is visible.

 If the value changes, the end handle uses [FadeTransition] to transition
 itself on and off the screen.

 If this is null, the end selection handle will always be visible.

- **onEndHandleDragStart**: `ValueChanged&lt;DragStartDetails&gt;?`
  Called when the users start dragging the end selection handles.

- **onEndHandleDragUpdate**: `ValueChanged&lt;DragUpdateDetails&gt;?`
  Called when the users drag the end selection handles to new locations.

- **onEndHandleDragEnd**: `ValueChanged&lt;DragEndDetails&gt;?`
  Called when the users lift their fingers after dragging the end selection
 handles.

- **toolbarVisible**: `ValueListenable&lt;bool&gt;?`
  Whether the toolbar is visible.

 If the value changes, the toolbar uses [FadeTransition] to transition
 itself on and off the screen.

 If this is null the toolbar will always be visible.

- **_selectionEndpoints**: `List&lt;TextSelectionPoint&gt;`
- **debugRequiredFor**: `Widget?`
  Debugging information for explaining why the [Overlay] is required.

- **toolbarLayerLink**: `LayerLink`
  The object supplied to the [CompositedTransformTarget] that wraps the text
 field.

- **startHandleLayerLink**: `LayerLink`
  The objects supplied to the [CompositedTransformTarget] that wraps the
 location of start selection handle.

- **endHandleLayerLink**: `LayerLink`
  The objects supplied to the [CompositedTransformTarget] that wraps the
 location of end selection handle.

- **selectionControls**: `TextSelectionControls?`
  
 Builds text selection handles and toolbar.
 

- **selectionDelegate**: `TextSelectionDelegate?`
  
 The delegate for manipulating the current selection in the owning
 text field.
 

- **dragStartBehavior**: `DragStartBehavior`
  Determines the way that drag start behavior is handled.

 If set to [DragStartBehavior.start], handle drag behavior will
 begin at the position where the drag gesture won the arena. If set to
 [DragStartBehavior.down] it will begin at the position where a down
 event is first detected.

 In general, setting this to [DragStartBehavior.start] will make drag
 animation smoother and setting it to [DragStartBehavior.down] will make
 drag behavior feel slightly more reactive.

 By default, the drag start behavior is [DragStartBehavior.start].

 See also:

  * [DragGestureRecognizer.dragStartBehavior], which gives an example for the different behaviors.

- **onSelectionHandleTapped**: `VoidCallback?`
  
 A callback that's optionally invoked when a selection handle is tapped.

 The [TextSelectionControls.buildHandle] implementation the text field
 uses decides where the handle's tap "hotspot" is, or whether the
 selection handle supports tap gestures at all. For instance,
 [MaterialTextSelectionControls] calls [onSelectionHandleTapped] when the
 selection handle's "knob" is tapped, while
 [CupertinoTextSelectionControls] builds a handle that's not sufficiently
 large for tapping (as it's not meant to be tapped) so it does not call
 [onSelectionHandleTapped] even when tapped.
 

- **clipboardStatus**: `ClipboardStatusNotifier?`
  Maintains the status of the clipboard for determining if its contents can
 be pasted or not.

 Useful because the actual value of the clipboard can only be checked
 asynchronously (see [Clipboard.getData]).

- **_toolbarLocation**: `Offset?`
- **fadeDuration**: `Duration`
  Controls the fade-in and fade-out animations for the toolbar and handles.

- **_handles**: `?`
  A pair of handles. If this is non-null, there are always 2, though the
 second is hidden when the selection is collapsed.

- **_toolbar**: `OverlayEntry?`
  A copy/paste toolbar.

- **_contextMenuController**: `ContextMenuController`
- **_spellCheckToolbarController**: `ContextMenuController`
- **_buildScheduled**: `bool`
## Constructors

### Unnamed Constructor
Creates an object that manages overlay entries for selection handles.

 The [context] must have an [Overlay] as an ancestor.

