# Overview for `PlatformMenuItem`

## Description

A class for [PlatformMenuItem]s that do not have submenus (as a [PlatformMenu]
 would), but can be selected.

 These [PlatformMenuItem]s are the leaves of the menu item tree, and [onSelected]
 will be called when they are selected by clicking on them, or via an
 optional keyboard [shortcut].

 See also:

  * [PlatformMenu], a menu item that opens a submenu.

## Dependencies

- Diagnosticable

## Members

- **label**: `String`
  The required label used for rendering the menu item.

- **shortcut**: `MenuSerializableShortcut?`
  The optional shortcut that selects this [PlatformMenuItem].

 This shortcut is only enabled when [onSelected] is set.

- **onSelected**: `VoidCallback?`
  An optional callback that is called when this [PlatformMenuItem] is
 selected.

 At most one of [onSelected] and [onSelectedIntent] may be set. If neither
 field is set, this menu item will be disabled.

- **onSelectedIntent**: `Intent?`
  An optional intent that is invoked when this [PlatformMenuItem] is
 selected.

 At most one of [onSelected] and [onSelectedIntent] may be set. If neither
 field is set, this menu item will be disabled.

## Constructors

### Unnamed Constructor
Creates a const [PlatformMenuItem].

 The [label] attribute is required.

