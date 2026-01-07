# Overview for `DraggableScrollableController`

## Description

Controls a [DraggableScrollableSheet].

 Draggable scrollable controllers are typically stored as member variables in
 [State] objects and are reused in each [State.build]. Controllers can only
 be used to control one sheet at a time. A controller can be reused with a
 new sheet if the previous sheet has been disposed.

 The controller's methods cannot be used until after the controller has been
 passed into a [DraggableScrollableSheet] and the sheet has run initState.

 A [DraggableScrollableController] is a [Listenable]. It notifies its
 listeners whenever an attached sheet changes sizes. It does not notify its
 listeners when a sheet is first attached or when an attached sheet's
 parameters change without affecting the sheet's current size. It does not
 fire when [pixels] changes without [size] changing. For example, if the
 constraints provided to an attached sheet change.

## Dependencies

- ChangeNotifier

## Members

- **_attachedController**: `_DraggableScrollableSheetScrollController?`
- **_animationControllers**: `Set&lt;AnimationController&gt;`
## Constructors

### Unnamed Constructor
Creates a controller for [DraggableScrollableSheet].

