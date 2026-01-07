# Overview for `Focus`

## Description

A widget that manages a [FocusNode] to allow keyboard focus to be given
 to this widget and its descendants.

 

 When the focus is gained or lost, [onFocusChange] is called.

 For keyboard events, [onKey] and [onKeyEvent] are called if
 [FocusNode.hasFocus] is true for this widget's [focusNode], unless a focused
 descendant's [onKey] or [onKeyEvent] callback returned
 [KeyEventResult.handled] when called.

 This widget does not provide any visual indication that the focus has
 changed. Any desired visual changes should be made when [onFocusChange] is
 called.

 To access the [FocusNode] of the nearest ancestor [Focus] widget and
 establish a relationship that will rebuild the widget when the focus
 changes, use the [Focus.of] and [FocusScope.of] static methods.

 To access the focused state of the nearest [Focus] widget, use
 [FocusNode.hasFocus] from a build method, which also establishes a
 relationship between the calling widget and the [Focus] widget that will
 rebuild the calling widget when the focus changes.

 Managing a [FocusNode] means managing its lifecycle, listening for changes
 in focus, and re-parenting it when needed to keep the focus hierarchy in
 sync with the widget hierarchy. This widget does all of those things for
 you. See [FocusNode] for more information about the details of what node
 management entails if you are not using a [Focus] widget and you need to do
 it yourself.

 If the [Focus] default constructor is used, then this widget will manage any
 given [focusNode] by overwriting the appropriate values of the [focusNode]
 with the values of [FocusNode.onKey], [FocusNode.onKeyEvent],
 [FocusNode.skipTraversal], [FocusNode.canRequestFocus], and
 [FocusNode.descendantsAreFocusable] whenever the [Focus] widget is updated.

 If the [Focus.withExternalFocusNode] is used instead, then the values
 returned by [onKey], [onKeyEvent], [skipTraversal], [canRequestFocus], and
 [descendantsAreFocusable] will be the values in the external focus node, and
 the external focus node's values will not be overwritten when the widget is
 updated.

 To collect a sub-tree of nodes into an exclusive group that restricts focus
 traversal to the group, use a [FocusScope]. To collect a sub-tree of nodes
 into a group that has a specific order to its traversal but allows the
 traversal to escape the group, use a [FocusTraversalGroup].

 To move the focus, use methods on [FocusNode] by getting the [FocusNode]
 through the [of] method. For instance, to move the focus to the next node in
 the focus traversal order, call `Focus.of(context).`. To unfocus
 a widget, call `Focus.of(context).`.

 
 This example shows how to manage focus using the [Focus] and [FocusScope]
 widgets. See [FocusNode] for a similar example that doesn't use [Focus] or
 [FocusScope].

 ** See code in examples/api/lib/widgets/focus_scope/focus.0.dart **
 

 
 This example shows how to wrap another widget in a [Focus] widget to make it
 focusable. It wraps a [Container], and changes the container's color when it
 is set as the [FocusManager.primaryFocus].

 If you also want to handle mouse hover and/or keyboard actions on a widget,
 consider using a [FocusableActionDetector], which combines several different
 widgets to provide those capabilities.

 ** See code in examples/api/lib/widgets/focus_scope/focus.1.dart **
 

 
 This example shows how to focus a newly-created widget immediately after it
 is created.

 The focus node will not actually be given the focus until after the frame in
 which it has requested focus is drawn, so it is OK to call
 [FocusNode.requestFocus] on a node which is not yet in the focus tree.

 ** See code in examples/api/lib/widgets/focus_scope/focus.2.dart **
 

 See also:

  * [FocusNode], which represents a node in the focus hierarchy and
    [FocusNode]'s API documentation includes a detailed explanation of its role
    in the overall focus system.
  * [FocusScope], a widget that manages a group of focusable widgets using a
    [FocusScopeNode].
  * [FocusScopeNode], a node that collects focus nodes into a group for
    traversal.
  * [FocusManager], a singleton that manages the primary focus and
    distributes key events to focused nodes.
  * [FocusTraversalPolicy], an object used to determine how to move the focus
    to other nodes.
  * [FocusTraversalGroup], a widget that groups together and imposes a
    traversal policy on the [Focus] nodes below it in the widget hierarchy.

## Dependencies

- StatefulWidget

## Members

- **parentNode**: `FocusNode?`
  The optional parent node to use when reparenting the [focusNode] for this
 [Focus] widget.

 If [parentNode] is null, then [Focus.maybeOf] is used to find the parent
 in the widget tree, which is typically what is desired, since it is easier
 to reason about the focus tree if it mirrors the shape of the widget tree.

 Set this property if the focus tree needs to have a different shape than
 the widget tree. This is typically in cases where a dialog is in an
 [Overlay] (or another part of the widget tree), and focus should
 behave as if the widgets in the overlay are descendants of the given
 [parentNode] for purposes of focus.

 Defaults to null.

- **child**: `Widget`
  The child widget of this [Focus].

 

- **focusNode**: `FocusNode?`
  
 An optional focus node to use as the focus node for this widget.

 If one is not supplied, then one will be automatically allocated, owned,
 and managed by this widget. The widget will be focusable even if a
 [focusNode] is not supplied. If supplied, the given [focusNode] will be
 _hosted_ by this widget, but not owned. See [FocusNode] for more
 information on what being hosted and/or owned implies.

 Supplying a focus node is sometimes useful if an ancestor to this widget
 wants to control when this widget has the focus. The owner will be
 responsible for calling [FocusNode.dispose] on the focus node when it is
 done with it, but this widget will attach/detach and reparent the node
 when needed.
 

 A non-null [focusNode] must be supplied if using the
 [Focus.withExternalFocusNode] constructor.

- **autofocus**: `bool`
  
 True if this widget will be selected as the initial focus when no other
 node in its scope is currently focused.

 Ideally, there is only one widget with autofocus set in each [FocusScope].
 If there is more than one widget with autofocus set, then the first one
 added to the tree will get focus.

 Defaults to false.
 

- **onFocusChange**: `ValueChanged&lt;bool&gt;?`
  Handler called when the focus changes.

 Called with true if this widget's node gains focus, and false if it loses
 focus.

- **_onKeyEvent**: `FocusOnKeyEventCallback?`
- **_onKey**: `FocusOnKeyCallback?`
- **_canRequestFocus**: `bool?`
- **_skipTraversal**: `bool?`
- **_descendantsAreFocusable**: `bool?`
- **_descendantsAreTraversable**: `bool?`
- **includeSemantics**: `bool`
  
 Include semantics information in this widget.

 If true, this widget will include a [Semantics] node that indicates the
 [SemanticsProperties.focusable] and [SemanticsProperties.focused]
 properties.

 It is not typical to set this to false, as that can affect the semantics
 information available to accessibility systems.

 Defaults to true.
 

- **_debugLabel**: `String?`
## Constructors

### Unnamed Constructor
Creates a widget that manages a [FocusNode].

### withExternalFocusNode
Creates a Focus widget that uses the given [focusNode] as the source of
 truth for attributes on the node, rather than the attributes of this widget.

#### Parameters

- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
