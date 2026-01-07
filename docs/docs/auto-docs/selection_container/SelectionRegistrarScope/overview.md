# Overview for `SelectionRegistrarScope`

## Description

An inherited widget to host a [SelectionRegistrar] for the subtree.

 Use [SelectionContainer.maybeOf] to get the SelectionRegistrar from
 a context.

 This widget is automatically created as part of [SelectionContainer] and
 is generally not used directly, except for disabling selection for a part
 of subtree. In that case, one can wrap the subtree with
 [SelectionContainer.disabled].

## Dependencies

- InheritedWidget

## Members

- **registrar**: `SelectionRegistrar?`
  The [SelectionRegistrar] hosted by this widget.

## Constructors

### Unnamed Constructor
Creates a selection registrar scope that host the [registrar].

### _disabled
Creates a selection registrar scope that disables selection for the
 subtree.

#### Parameters

- ``: `dynamic`
