# Overview for `FocusScope`

## Description

A [FocusScope] is similar to a [Focus], but also serves as a scope for its
 descendants, restricting focus traversal to the scoped controls.

 For example a new [FocusScope] is created automatically when a route is
 pushed, keeping the focus traversal from moving to a control in a previous
 route.

 If you just want to group widgets together in a group so that they are
 traversed in a particular order, but the focus can still leave the group,
 use a [FocusTraversalGroup].

 Like [Focus], [FocusScope] provides an [onFocusChange] as a way to be
 notified when the focus is given to or removed from this widget.

 The [onKey] argument allows specification of a key event handler that is
 invoked when this node or one of its children has focus. Keys are handed to
 the primary focused widget first, and then they propagate through the
 ancestors of that node, stopping if one of them returns
 [KeyEventResult.handled] from [onKey], indicating that it has handled the
 event.

 Managing a [FocusScopeNode] means managing its lifecycle, listening for
 changes in focus, and re-parenting it when needed to keep the focus
 hierarchy in sync with the widget hierarchy. This widget does all of those
 things for you. See [FocusScopeNode] for more information about the details
 of what node management entails if you are not using a [FocusScope] widget
 and you need to do it yourself.

 [FocusScopeNode]s remember the last [FocusNode] that was focused within
 their descendants, and can move that focus to the next/previous node, or a
 node in a particular direction when the [FocusNode.nextFocus],
 [FocusNode.previousFocus], or [FocusNode.focusInDirection] are called on a
 [FocusNode] or [FocusScopeNode].

 To move the focus, use methods on [FocusNode] by getting the [FocusNode]
 through the [of] method. For instance, to move the focus to the next node in
 the focus traversal order, call `Focus.of(context).`. To unfocus
 a widget, call `Focus.of(context).`.

 
 This example demonstrates using a [FocusScope] to restrict focus to a particular
 portion of the app. In this case, restricting focus to the visible part of a
 Stack.

 ** See code in examples/api/lib/widgets/focus_scope/focus_scope.0.dart **
 

 See also:

  * [FocusScopeNode], which represents a scope node in the focus hierarchy.
  * [FocusNode], which represents a node in the focus hierarchy and has an
    explanation of the focus system.
  * [Focus], a widget that manages a [FocusNode] and allows easy access to
    managing focus without having to manage the node.
  * [FocusManager], a singleton that manages the focus and distributes key
    events to focused nodes.
  * [FocusTraversalPolicy], an object used to determine how to move the focus
    to other nodes.
  * [FocusTraversalGroup], a widget used to configure the focus traversal
    policy for a widget subtree.

## Dependencies

- Focus

## Constructors

### Unnamed Constructor
Creates a widget that manages a [FocusScopeNode].

### withExternalFocusNode
Creates a FocusScope widget that uses the given [focusScopeNode] as the
 source of truth for attributes on the node, rather than the attributes of
 this widget.

#### Parameters

- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
