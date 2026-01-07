# Overview for `CupertinoContextMenuAction`

## Description

A button in a _ContextMenuSheet.

 A typical use case is to pass a [Text] as the [child] here, but be sure to
 use [TextOverflow.ellipsis] for the [Text.overflow] field if the text may be
 long, as without it the text will wrap to the next line.

## Dependencies

- StatefulWidget

## Members

- **child**: `Widget`
  The widget that will be placed inside the action.

- **isDefaultAction**: `bool`
  Indicates whether this action should receive the style of an emphasized,
 default action.

- **isDestructiveAction**: `bool`
  Indicates whether this action should receive the style of a destructive
 action.

- **onPressed**: `VoidCallback?`
  Called when the action is pressed.

- **trailingIcon**: `IconData?`
  An optional icon to display to the right of the child.

 Will be colored in the same way as the [TextStyle] used for [child] (for
 example, if using [isDestructiveAction]).

## Constructors

### Unnamed Constructor
Construct a CupertinoContextMenuAction.

