# Method: `setMenus`

## Description

Sets the entire menu hierarchy for a platform-rendered menu bar.

 The `topLevelMenus` argument is the list of menus that appear in the menu
 bar, which themselves can have children.

 To update the menu hierarchy or menu item state, call [setMenus] with the
 modified hierarchy, and it will overwrite the previous menu state.

 See also:

  * [PlatformMenuBar], the widget that adds a platform menu bar to an
    application.
  * [PlatformMenu], the class that describes a menu item with children
    that appear in a cascading menu.
  * [PlatformMenuItem], the class that describes the leaves of a menu
    hierarchy.

## Return Type
`void`

## Parameters

- `topLevelMenus`: `List&lt;PlatformMenuItem&gt;`
