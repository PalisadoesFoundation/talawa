# Overview for `ButtonBarThemeData`

## Description

Defines the visual properties of [ButtonBar] widgets.

 Used by [ButtonBarTheme] to control the visual properties of [ButtonBar]
 instances in a widget subtree.

 To obtain this configuration, use [ButtonBarTheme.of] to access the closest
 ancestor [ButtonBarTheme] of the current [BuildContext].

 See also:

  * [ButtonBarTheme], an [InheritedWidget] that propagates the theme down
    its subtree.
  * [ButtonBar], which uses this to configure itself and its children
    button widgets.

## Dependencies

- Diagnosticable

## Members

- **alignment**: `MainAxisAlignment?`
  How the children should be placed along the horizontal axis.

- **mainAxisSize**: `MainAxisSize?`
  How much horizontal space is available. See [Row.mainAxisSize].

- **buttonTextTheme**: `ButtonTextTheme?`
  Defines a [ButtonBar] button's base colors, and the defaults for
 the button's minimum size, internal padding, and shape.

 This will override the surrounding [ButtonThemeData.textTheme] setting
 for buttons contained in the [ButtonBar].

 Despite the name, this property is not a [TextTheme], its value is not a
 collection of [TextStyle]s.

- **buttonMinWidth**: `double?`
  The minimum width for [ButtonBar] buttons.

 This will override the surrounding [ButtonThemeData.minWidth] setting
 for buttons contained in the [ButtonBar].

 The actual horizontal space allocated for a button's child is
 at least this value less the theme's horizontal [ButtonThemeData.padding].

- **buttonHeight**: `double?`
  The minimum height for [ButtonBar] buttons.

 This will override the surrounding [ButtonThemeData.height] setting
 for buttons contained in the [ButtonBar].

- **buttonPadding**: `EdgeInsetsGeometry?`
  Padding for a [ButtonBar] button's child (typically the button's label).

 This will override the surrounding [ButtonThemeData.padding] setting
 for buttons contained in the [ButtonBar].

- **buttonAlignedDropdown**: `bool?`
  If true, then a [DropdownButton] menu's width will match the [ButtonBar]
 button's width.

 If false, then the dropdown's menu will be wider than
 its button. In either case the dropdown button will line up the leading
 edge of the menu's value with the leading edge of the values
 displayed by the menu items.

 This will override the surrounding [ButtonThemeData.alignedDropdown] setting
 for buttons contained in the [ButtonBar].

 This property only affects [DropdownButton] contained in a [ButtonBar]
 and its menu.

- **layoutBehavior**: `ButtonBarLayoutBehavior?`
  Defines whether a [ButtonBar] should size itself with a minimum size
 constraint or with padding.

- **overflowDirection**: `VerticalDirection?`
  Defines the vertical direction of a [ButtonBar]'s children if it
 overflows.

 If the [ButtonBar]'s children do not fit into a single row, then they
 are arranged in a column. The first action is at the top of the
 column if this property is set to [VerticalDirection.down], since it
 "starts" at the top and "ends" at the bottom. On the other hand,
 the first action will be at the bottom of the column if this
 property is set to [VerticalDirection.up], since it "starts" at the
 bottom and "ends" at the top.

## Constructors

### Unnamed Constructor
Constructs the set of properties used to configure [ButtonBar] widgets.

 Both [buttonMinWidth] and [buttonHeight] must be non-negative if they
 are not null.

