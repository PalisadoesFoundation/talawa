# Overview for `ContextMenuController`

## Description

Builds and manages a context menu at a given location.

 There can only ever be one context menu shown at a given time in the entire
 app. Calling [show] on one instance of this class will hide any other
 shown instances.

 
 This example shows how to use a GestureDetector to show a context menu
 anywhere in a widget subtree that receives a right click or long press.

 ** See code in examples/api/lib/material/context_menu/context_menu_controller.0.dart **
 

 See also:

   * [BrowserContextMenu], which allows the browser's context menu on web to
     be disabled and Flutter-rendered context menus to appear.

## Members

- **onRemove**: `VoidCallback?`
  Called when this menu is removed.

- **_shownInstance**: `ContextMenuController?`
  The currently shown instance, if any.

- **_menuOverlayEntry**: `OverlayEntry?`
## Constructors

### Unnamed Constructor
Creates a context menu that can be shown with [show].

