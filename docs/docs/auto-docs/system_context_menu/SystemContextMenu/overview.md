# Overview for `SystemContextMenu`

## Description

Displays the system context menu on top of the Flutter view.

 Currently, only supports iOS 16.0 and above and displays nothing on other
 platforms.

 The context menu is the menu that appears, for example, when doing text
 selection. Flutter typically draws this menu itself, but this class deals
 with the platform-rendered context menu instead.

 There can only be one system context menu visible at a time. Building this
 widget when the system context menu is already visible will hide the old one
 and display this one. A system context menu that is hidden is informed via
 [onSystemHide].

 Pass [items] to specify the buttons that will appear in the menu. Any items
 without a title will be given a default title from [WidgetsLocalizations].

 By default, [items] will be set to the result of [getDefaultItems]. This
 method considers the state of the [EditableTextState] so that, for example,
 it will only include [IOSSystemContextMenuItemCopy] if there is currently a
 selection to copy.

 To check if the current device supports showing the system context menu,
 call [isSupported].

 
 This example shows how to create a [TextField] that uses the system context
 menu where supported and does not show a system notification when the user
 presses the "Paste" button.

 ** See code in examples/api/lib/widgets/system_context_menu/system_context_menu.0.dart **
 

 See also:

  * [SystemContextMenuController], which directly controls the hiding and
    showing of the system context menu.

## Dependencies

- StatefulWidget

## Members

- **anchor**: `Rect`
  The [Rect] that the context menu should point to.

- **items**: `List&lt;IOSSystemContextMenuItem&gt;`
  A list of the items to be displayed in the system context menu.

 When passed, items will be shown regardless of the state of text input.
 For example, [IOSSystemContextMenuItemCopy] will produce a copy button
 even when there is no selection to copy. Use [EditableTextState] and/or
 the result of [getDefaultItems] to add and remove items based on the state
 of the input.

 Defaults to the result of [getDefaultItems].

- **onSystemHide**: `VoidCallback?`
  Called when the system hides this context menu.

 For example, tapping outside of the context menu typically causes the
 system to hide the menu.

 This is not called when showing a new system context menu causes another
 to be hidden.

## Constructors

### _
Creates an instance of [SystemContextMenu] that points to the given
 [anchor].

#### Parameters

- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
### editableText
Creates an instance of [SystemContextMenu] for the field indicated by the
 given [EditableTextState].

#### Parameters

- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
