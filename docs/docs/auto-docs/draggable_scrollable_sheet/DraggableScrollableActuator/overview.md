# Overview for `DraggableScrollableActuator`

## Description

A widget that can notify a descendent [DraggableScrollableSheet] that it
 should reset its position to the initial state.

 The [Scaffold] uses this widget to notify a persistent bottom sheet that
 the user has tapped back if the sheet has started to cover more of the body
 than when at its initial position. This is important for users of assistive
 technology, where dragging may be difficult to communicate.

 This is just a wrapper on top of [DraggableScrollableController]. It is
 primarily useful for controlling a sheet in a part of the widget tree that
 the current code does not control (e.g. library code trying to affect a sheet
 in library users' code). Generally, it's easier to control the sheet
 directly by creating a controller and passing the controller to the sheet in
 its constructor (see [DraggableScrollableSheet.controller]).

## Dependencies

- StatefulWidget

## Members

- **child**: `Widget`
  This child's [DraggableScrollableSheet] descendant will be reset when the
 [reset] method is applied to a context that includes it.

## Constructors

### Unnamed Constructor
Creates a widget that can notify descendent [DraggableScrollableSheet]s
 to reset to their initial position.

 The [child] parameter is required.

