# Overview for `ExcludeFocus`

## Description

A widget that controls whether or not the descendants of this widget are
 focusable.

 Does not affect the value of [Focus.canRequestFocus] on the descendants.

 See also:

  * [Focus], a widget for adding and managing a [FocusNode] in the widget tree.
  * [FocusTraversalGroup], a widget that groups widgets for focus traversal,
    and can also be used in the same way as this widget by setting its
    `descendantsAreFocusable` attribute.

## Dependencies

- StatelessWidget

## Members

- **excluding**: `bool`
  If true, will make this widget's descendants unfocusable.

 Defaults to true.

 If any descendants are focused when this is set to true, they will be
 unfocused. When [excluding] is set to false again, they will not be
 refocused, although they will be able to accept focus again.

 Does not affect the value of [FocusNode.canRequestFocus] on the
 descendants.

 See also:

 * [Focus.descendantsAreFocusable], the attribute of a [Focus] widget that
   controls this same property for focus widgets.
 * [FocusTraversalGroup], a widget used to group together and configure the
   focus traversal policy for a widget subtree that has a
   `descendantsAreFocusable` parameter to conditionally block focus for a
   subtree.

- **child**: `Widget`
  The child widget of this [ExcludeFocus].

 

## Constructors

### Unnamed Constructor
Const constructor for [ExcludeFocus] widget.

