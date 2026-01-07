# Overview for `SelectionRegistrar`

## Description

A registrar that keeps track of [Selectable]s in the subtree.

 A [Selectable] is only included in the [SelectableRegion] if they are
 registered with a [SelectionRegistrar]. Once a [Selectable] is registered,
 it will receive [SelectionEvent]s in
 [SelectionHandler.dispatchSelectionEvent].

 Use [SelectionContainer.maybeOf] to get the immediate [SelectionRegistrar]
 in the ancestor chain above the build context.

 See also:
  * [SelectableRegion], which provides an overview of the selection system.
  * [SelectionRegistrarScope], which hosts the [SelectionRegistrar] for the
    subtree.
  * [SelectionRegistrant], which auto registers the object with the mixin to
    [SelectionRegistrar].

