# Overview for `SelectionContainer`

## Description

A container that handles [SelectionEvent]s for the [Selectable]s in
 the subtree.

 This widget is useful when one wants to customize selection behaviors for
 a group of [Selectable]s

 The state of this container is a single selectable and will register
 itself to the [registrar] if provided. Otherwise, it will register to the
 [SelectionRegistrar] from the context. Consider using a [SelectionArea]
 widget to provide a root registrar.

 The containers handle the [SelectionEvent]s from the registered
 [SelectionRegistrar] and delegate the events to the [delegate].

 This widget uses [SelectionRegistrarScope] to host the [delegate] as the
 [SelectionRegistrar] for the subtree to collect the [Selectable]s, and
 [SelectionEvent]s received by this container are sent to the [delegate] using
 the [SelectionHandler] API of the delegate.

 
 This sample demonstrates how to create a [SelectionContainer] that only
 allows selecting everything or nothing with no partial selection.

 ** See code in examples/api/lib/material/selection_container/selection_container.0.dart **
 

 See also:
  * [SelectableRegion], which provides an overview of the selection system.
  * [SelectionContainer.disabled], which disable selection for a
    subtree.

## Dependencies

- StatefulWidget

## Members

- **registrar**: `SelectionRegistrar?`
  The [SelectionRegistrar] this container is registered to.

 If null, this widget gets the [SelectionRegistrar] from the current
 context.

- **child**: `Widget`
  

- **delegate**: `SelectionContainerDelegate?`
  The delegate for [SelectionEvent]s sent to this selection container.

 The [Selectable]s in the subtree are added or removed from this delegate
 using [SelectionRegistrar] API.

 This delegate is responsible for updating the selections for the selectables
 under this widget.

## Constructors

### Unnamed Constructor
Creates a selection container to collect the [Selectable]s in the subtree.

 If [registrar] is not provided, this selection container gets the
 [SelectionRegistrar] from the context instead.

### disabled
Creates a selection container that disables selection for the
 subtree.

 
 This sample demonstrates how to disable selection for a Text under a
 SelectionArea.

 ** See code in examples/api/lib/material/selection_container/selection_container_disabled.0.dart **
 

#### Parameters

- ``: `dynamic`
- ``: `dynamic`
