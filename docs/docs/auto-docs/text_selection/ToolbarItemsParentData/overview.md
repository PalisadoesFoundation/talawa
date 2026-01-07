# Overview for `ToolbarItemsParentData`

## Description

ParentData that determines whether or not to paint the corresponding child.

 Used in the layout of the Cupertino and Material text selection menus, which
 decide whether or not to paint their buttons after laying them out and
 determining where they overflow.

## Dependencies

- ContainerBoxParentData

## Members

- **shouldPaint**: `bool`
  Whether or not this child is painted.

 Children in the selection toolbar may be laid out for measurement purposes
 but not painted. This allows these children to be identified.

