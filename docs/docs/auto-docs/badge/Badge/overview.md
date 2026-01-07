# Overview for `Badge`

## Description

A Material Design "badge".

 A badge's [label] conveys a small amount of information about its
 [child], like a count or status. If the label is null then this is
 a "small" badge that's displayed as a [smallSize] diameter filled
 circle. Otherwise this is a [StadiumBorder] shaped "large" badge
 with height [largeSize].

 Badges are typically used to decorate the icon within a
 [BottomNavigationBarItem] or a [NavigationRailDestination]
 or a button's icon, as in [TextButton.icon]. The badge's default
 configuration is intended to work well with a default sized (24)
 [Icon].

 
 This example shows how to create a [Badge] with label and count
 wrapped on an icon in an [IconButton].

 ** See code in examples/api/lib/material/badge/badge.0.dart **
 

## Dependencies

- StatelessWidget

## Members

- **backgroundColor**: `Color?`
  The badge's fill color.

 Defaults to the [BadgeTheme]'s background color, or
 [ColorScheme.error] if the theme value is null.

- **textColor**: `Color?`
  The color of the badge's [label] text.

 This color overrides the color of the label's [textStyle].

 Defaults to the [BadgeTheme]'s foreground color, or
 [ColorScheme.onError] if the theme value is null.

- **smallSize**: `double?`
  The diameter of the badge if [label] is null.

 Defaults to the [BadgeTheme]'s small size, or 6 if the theme value
 is null.

- **largeSize**: `double?`
  The badge's height if [label] is non-null.

 Defaults to the [BadgeTheme]'s large size, or 16 if the theme value
 is null. If the default value is overridden then it may be useful to
 also override [padding] and [alignment].

- **textStyle**: `TextStyle?`
  The [DefaultTextStyle] for the badge's label.

 The text style's color is overwritten by the [textColor].

 This value is only used if [label] is non-null.

 Defaults to the [BadgeTheme]'s text style, or the overall theme's
 [TextTheme.labelSmall] if the badge theme's value is null. If
 the default text style is overridden then it may be useful to
 also override [largeSize], [padding], and [alignment].

- **padding**: `EdgeInsetsGeometry?`
  The padding added to the badge's label.

 This value is only used if [label] is non-null.

 Defaults to the [BadgeTheme]'s padding, or 4 pixels on the
 left and right if the theme's value is null.

- **alignment**: `AlignmentGeometry?`
  Combined with [offset] to determine the location of the [label]
 relative to the [child].

 The alignment positions the label in the same way a child of an
 [Align] widget is positioned, except that, the alignment is
 resolved as if the label was a [largeSize] square and [offset]
 is added to the result.

 This value is only used if [label] is non-null.

 Defaults to the [BadgeTheme]'s alignment, or
 [AlignmentDirectional.topEnd] if the theme's value is null.

- **offset**: `Offset?`
  Combined with [alignment] to determine the location of the [label]
 relative to the [child].

 This value is only used if [label] is non-null.

 Defaults to the [BadgeTheme]'s offset, or
 if the theme's value is null then `Offset(4, -4)` for
 [TextDirection.ltr] or `Offset(-4, -4)` for [TextDirection.rtl].

- **label**: `Widget?`
  The badge's content, typically a [Text] widget that contains 1 to 4
 characters.

 If the label is null then this is a "small" badge that's
 displayed as a [smallSize] diameter filled circle. Otherwise
 this is a [StadiumBorder] shaped "large" badge with height [largeSize].

- **isLabelVisible**: `bool`
  If false, the badge's [label] is not included.

 This flag is true by default. It's intended to make it convenient
 to create a badge that's only shown under certain conditions.

- **child**: `Widget?`
  The widget that the badge is stacked on top of.

 Typically this is an default sized [Icon] that's part of a
 [BottomNavigationBarItem] or a [NavigationRailDestination].

## Constructors

### Unnamed Constructor
Create a Badge that stacks [label] on top of [child].

 If [label] is null then just a filled circle is displayed. Otherwise
 the [label] is displayed within a [StadiumBorder] shaped area.

### count
Convenience constructor for creating a badge with a numeric
 label with 1-3 digits based on [count].

 Initializes [label] with a [Text] widget that contains [count].
 If [count] is greater than 999, then the label is '999+'.

#### Parameters

- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
