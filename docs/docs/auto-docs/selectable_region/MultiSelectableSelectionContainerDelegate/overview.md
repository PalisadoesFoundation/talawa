# Overview for `MultiSelectableSelectionContainerDelegate`

## Description

A delegate that handles events and updates for multiple [Selectable]
 children.

 Updates are optimized by tracking which [Selectable]s reside on the edges of
 a selection. Subclasses should implement [ensureChildUpdated] to describe
 how a [Selectable] should behave when added to a selection.

## Dependencies

- SelectionContainerDelegate, ChangeNotifier

## Members

- **selectables**: `List&lt;Selectable&gt;`
  Gets the list of [Selectable]s this delegate is managing.

- **_kSelectionHandleDrawableAreaPadding**: `double`
  The number of additional pixels added to the selection handle drawable
 area.

 Selection handles that are outside of the drawable area will be hidden.
 That logic prevents handles that get scrolled off the viewport from being
 drawn on the screen.

 The drawable area = current rectangle of [SelectionContainer] +
 _kSelectionHandleDrawableAreaPadding on each side.

 This was an eyeballed value to create smooth user experiences.

- **currentSelectionEndIndex**: `int`
  The current [Selectable] that contains the selection end edge.

- **currentSelectionStartIndex**: `int`
  The current [Selectable] that contains the selection start edge.

- **_startHandleLayer**: `LayerLink?`
- **_startHandleLayerOwner**: `Selectable?`
- **_endHandleLayer**: `LayerLink?`
- **_endHandleLayerOwner**: `Selectable?`
- **_isHandlingSelectionEvent**: `bool`
- **_scheduledSelectableUpdate**: `bool`
- **_selectionInProgress**: `bool`
- **_additions**: `Set&lt;Selectable&gt;`
- **_extendSelectionInProgress**: `bool`
- **_selectionGeometry**: `SelectionGeometry`
## Constructors

### Unnamed Constructor
Creates an instance of [MultiSelectableSelectionContainerDelegate].

