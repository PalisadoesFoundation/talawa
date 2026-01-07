# Overview for `PlatformMenuItemGroup`

## Description

A class that groups other menu items into sections delineated by dividers.

 Visual dividers will be added before and after this group if other menu
 items appear in the [PlatformMenu], and the leading one omitted if it is
 first and the trailing one omitted if it is last in the menu.

## Dependencies

- PlatformMenuItem

## Members

- **members**: `List&lt;PlatformMenuItem&gt;`
  The [PlatformMenuItem]s that are members of this menu item group.

 An assertion will be thrown if there isn't at least one member of the group.

## Constructors

### Unnamed Constructor
Creates a const [PlatformMenuItemGroup].

 The [members] field is required.

