# Overview for `ContextMenuButtonItem`

## Description

The type and callback for a context menu button.

 See also:

  * [AdaptiveTextSelectionToolbar], which can take a list of
    ContextMenuButtonItems and create a platform-specific context menu with
    the indicated buttons.
  * [IOSSystemContextMenuItem], which serves a similar role but for
    system-drawn context menu items on iOS.

## Members

- **onPressed**: `VoidCallback?`
  The callback to be called when the button is pressed.

- **type**: `ContextMenuButtonType`
  The type of button this represents.

- **label**: `String?`
  The label to display on the button.

 If a [type] other than [ContextMenuButtonType.custom] is given
 and a label is not provided, then the default label for that type for the
 platform will be looked up.

## Constructors

### Unnamed Constructor
Creates a const instance of [ContextMenuButtonItem].

