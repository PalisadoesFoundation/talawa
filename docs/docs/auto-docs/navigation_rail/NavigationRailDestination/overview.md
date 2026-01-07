# Overview for `NavigationRailDestination`

## Description

Defines a [NavigationRail] button that represents one "destination" view.

 See also:

  * [NavigationRail]

## Members

- **icon**: `Widget`
  The icon of the destination.

 Typically the icon is an [Icon] or an [ImageIcon] widget. If another type
 of widget is provided then it should configure itself to match the current
 [IconTheme] size and color.

 If [selectedIcon] is provided, this will only be displayed when the
 destination is not selected.

 To make the [NavigationRail] more accessible, consider choosing an
 icon with a stroked and filled version, such as [Icons.cloud] and
 [Icons.cloud_queue]. The [icon] should be set to the stroked version and
 [selectedIcon] to the filled version.

- **selectedIcon**: `Widget`
  An alternative icon displayed when this destination is selected.

 If this icon is not provided, the [NavigationRail] will display [icon] in
 either state. The size, color, and opacity of the
 [NavigationRail.selectedIconTheme] will still apply.

 See also:

  * [NavigationRailDestination.icon], for a description of how to pair
    icons.

- **indicatorColor**: `Color?`
  The color of the [indicatorShape] when this destination is selected.

- **indicatorShape**: `ShapeBorder?`
  The shape of the selection indicator.

- **label**: `Widget`
  The label for the destination.

 The label must be provided when used with the [NavigationRail]. When the
 [NavigationRail.labelType] is [NavigationRailLabelType.none], the label is
 still used for semantics, and may still be used if
 [NavigationRail.extended] is true.

- **padding**: `EdgeInsetsGeometry?`
  The amount of space to inset the destination item.

- **disabled**: `bool`
  Indicates that this destination is inaccessible.

## Constructors

### Unnamed Constructor
Creates a destination that is used with [NavigationRail.destinations].

 When the [NavigationRail.labelType] is [NavigationRailLabelType.none], the
 label is still used for semantics, and may still be used if
 [NavigationRail.extended] is true.

