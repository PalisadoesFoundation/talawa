# Overview for `DropdownMenuItem`

## Description

An item in a menu created by a [DropdownButton].

 The type `T` is the type of the value the entry represents. All the entries
 in a given menu must represent values with consistent types.

## Dependencies

- _DropdownMenuItemContainer

## Members

- **onTap**: `VoidCallback?`
  Called when the dropdown menu item is tapped.

- **value**: `T?`
  The value to return if the user selects this menu item.

 Eventually returned in a call to [DropdownButton.onChanged].

- **enabled**: `bool`
  Whether or not a user can select this menu item.

 Defaults to `true`.

## Constructors

### Unnamed Constructor
Creates an item for a dropdown menu.

 The [child] argument is required.

