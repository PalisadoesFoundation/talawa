# Overview for `ExpansionTileThemeData`

## Description

Used with [ExpansionTileTheme] to define default property values for
 descendant [ExpansionTile] widgets.

 Descendant widgets obtain the current [ExpansionTileThemeData] object
 using `ExpansionTileTheme.of(context)`. Instances of
 [ExpansionTileThemeData] can be customized with
 [ExpansionTileThemeData.copyWith].

 A [ExpansionTileThemeData] is often specified as part of the
 overall [Theme] with [ThemeData.expansionTileTheme].

 All [ExpansionTileThemeData] properties are `null` by default.
 When a theme property is null, the [ExpansionTile]  will provide its own
 default based on the overall [Theme]'s textTheme and
 colorScheme. See the individual [ExpansionTile] properties for details.

 See also:

  * [ThemeData], which describes the overall theme information for the
    application.
  * [ExpansionTileTheme] which overrides the default [ExpansionTileTheme]
    of its [ExpansionTile] descendants.
  * [ThemeData.textTheme], text with a color that contrasts with the card
    and canvas colors.
  * [ThemeData.colorScheme], the thirteen colors that most Material widget
    default colors are based on.

## Dependencies

- Diagnosticable

## Members

- **backgroundColor**: `Color?`
  Overrides the default value of [ExpansionTile.backgroundColor].

- **collapsedBackgroundColor**: `Color?`
  Overrides the default value of [ExpansionTile.collapsedBackgroundColor].

- **tilePadding**: `EdgeInsetsGeometry?`
  Overrides the default value of [ExpansionTile.tilePadding].

- **expandedAlignment**: `AlignmentGeometry?`
  Overrides the default value of [ExpansionTile.expandedAlignment].

- **childrenPadding**: `EdgeInsetsGeometry?`
  Overrides the default value of [ExpansionTile.childrenPadding].

- **iconColor**: `Color?`
  Overrides the default value of [ExpansionTile.iconColor].

- **collapsedIconColor**: `Color?`
  Overrides the default value of [ExpansionTile.collapsedIconColor].

- **textColor**: `Color?`
  Overrides the default value of [ExpansionTile.textColor].

- **collapsedTextColor**: `Color?`
  Overrides the default value of [ExpansionTile.collapsedTextColor].

- **shape**: `ShapeBorder?`
  Overrides the default value of [ExpansionTile.shape].

- **collapsedShape**: `ShapeBorder?`
  Overrides the default value of [ExpansionTile.collapsedShape].

- **clipBehavior**: `Clip?`
  Overrides the default value of [ExpansionTile.clipBehavior].

- **expansionAnimationStyle**: `AnimationStyle?`
  Overrides the default value of [ExpansionTile.expansionAnimationStyle].

## Constructors

### Unnamed Constructor
Creates a [ExpansionTileThemeData].

