# Overview for `PlatformMenu`

## Description

A class for representing menu items that have child submenus.

 See also:

  * [PlatformMenuItem], a class representing a leaf menu item in a
    [PlatformMenuBar].

## Dependencies

- PlatformMenuItem, DiagnosticableTreeMixin

## Members

- **onOpen**: `VoidCallback?`
- **onClose**: `VoidCallback?`
- **menus**: `List&lt;PlatformMenuItem&gt;`
  The menu items in the submenu opened by this menu item.

 If this is an empty list, this [PlatformMenu] will be disabled.

## Constructors

### Unnamed Constructor
Creates a const [PlatformMenu].

 The [label] and [menus] fields are required.

