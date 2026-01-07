# Overview for `DropdownMenuEntry`

## Description

Defines a [DropdownMenu] menu button that represents one item view in the menu.

 See also:

 * [DropdownMenu]

## Members

- **value**: `T`
  the value used to identify the entry.

 This value must be unique across all entries in a [DropdownMenu].

- **label**: `String`
  The label displayed in the center of the menu item.

- **labelWidget**: `Widget?`
  Overrides the default label widget which is `Text(label)`.

 
 This sample shows how to override the default label [Text]
 widget with one that forces the menu entry to appear on one line
 by specifying [Text.maxLines] and [Text.overflow].

 ** See code in examples/api/lib/material/dropdown_menu/dropdown_menu_entry_label_widget.0.dart **
 

- **leadingIcon**: `Widget?`
  An optional icon to display before the label.

- **trailingIcon**: `Widget?`
  An optional icon to display after the label.

- **enabled**: `bool`
  Whether the menu item is enabled or disabled.

 The default value is true. If true, the [DropdownMenuEntry.label] will be filled
 out in the text field of the [DropdownMenu] when this entry is clicked; otherwise,
 this entry is disabled.

- **style**: `ButtonStyle?`
  Customizes this menu item's appearance.

 Null by default.

## Constructors

### Unnamed Constructor
Creates an entry that is used with [DropdownMenu.dropdownMenuEntries].

