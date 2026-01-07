# Overview for `Card`

## Description

A Material Design card: a panel with slightly rounded corners and an
 elevation shadow.

 A card is a sheet of [Material] used to represent some related information,
 for example an album, a geographical location, a meal, contact details, etc.

 This is what it looks like when run:

 ![A card with a slight shadow, consisting of two rows, one with an icon and
 some text describing a musical, and the other with buttons for buying
 tickets or listening to the show.](https://flutter.github.io/assets-for-api-docs/assets/material/card.png)

 
 This sample shows creation of a [Card] widget that shows album information
 and two actions.

 ** See code in examples/api/lib/material/card/card.0.dart **
 

 Sometimes the primary action area of a card is the card itself. Cards can be
 one large touch target that shows a detail screen when tapped.

 
 This sample shows creation of a [Card] widget that can be tapped. When
 tapped this [Card]'s [InkWell] displays an "ink splash" that fills the
 entire card.

 ** See code in examples/api/lib/material/card/card.1.dart **
 

 Material Design 3 introduced new types of cards. The default [Card] is the
 elevated card. To create a filled card, use [Card.filled]; to create a outlined
 card, use [Card.outlined].
 
 This sample shows creation of [Card] widgets for elevated, filled and
 outlined types, as described in: https://m3.material.io/components/cards/overview

 ** See code in examples/api/lib/material/card/card.2.dart **
 

 See also:

  * [ListTile], to display icons and text in a card.
  * [showDialog], to display a modal card.
  * <https://material.io/design/components/cards.html>
  * <https://m3.material.io/components/cards>

## Dependencies

- StatelessWidget

## Members

- **color**: `Color?`
  The card's background color.

 Defines the card's [Material.color].

 If this property is null then the ambient [CardTheme.color] is used. If that is null,
 and [ThemeData.useMaterial3] is true, then [ColorScheme.surfaceContainerLow] of
 [ThemeData.colorScheme] is used. Otherwise, [ThemeData.cardColor] is used.

- **shadowColor**: `Color?`
  The color to paint the shadow below the card.

 If null then the ambient [CardTheme]'s shadowColor is used.
 If that's null too, then the overall theme's [ThemeData.shadowColor]
 (default black) is used.

- **surfaceTintColor**: `Color?`
  The color used as an overlay on [color] to indicate elevation.

 This is not recommended for use. [Material 3 spec](https://m3.material.io/styles/color/the-color-system/color-roles)
 introduced a set of tone-based surfaces and surface containers in its [ColorScheme],
 which provide more flexibility. The intention is to eventually remove surface tint color from
 the framework.

 If this is null, no overlay will be applied. Otherwise this color
 will be composited on top of [color] with an opacity related
 to [elevation] and used to paint the background of the card.

 The default is [Colors.transparent].

 See [Material.surfaceTintColor] for more details on how this
 overlay is applied.

- **elevation**: `double?`
  The z-coordinate at which to place this card. This controls the size of
 the shadow below the card.

 Defines the card's [Material.elevation].

 If this property is null then [CardTheme.elevation] of
 [ThemeData.cardTheme] is used. If that's null, the default value is 1.0.

- **shape**: `ShapeBorder?`
  The shape of the card's [Material].

 Defines the card's [Material.shape].

 If this property is null then [CardTheme.shape] of [ThemeData.cardTheme]
 is used. If that's null then the shape will be a [RoundedRectangleBorder]
 with a circular corner radius of 12.0 and if [ThemeData.useMaterial3] is
 false, then the circular corner radius will be 4.0.

- **borderOnForeground**: `bool`
  Whether to paint the [shape] border in front of the [child].

 The default value is true.
 If false, the border will be painted behind the [child].

- **clipBehavior**: `Clip?`
  

 If this property is null then [CardTheme.clipBehavior] of
 [ThemeData.cardTheme] is used. If that's null then the behavior will be [Clip.none].

- **margin**: `EdgeInsetsGeometry?`
  The empty space that surrounds the card.

 Defines the card's outer [Container.margin].

 If this property is null then [CardTheme.margin] of
 [ThemeData.cardTheme] is used. If that's null, the default margin is 4.0
 logical pixels on all sides: `EdgeInsets.all(4.0)`.

- **semanticContainer**: `bool`
  Whether this widget represents a single semantic container, or if false
 a collection of individual semantic nodes.

 Defaults to true.

 Setting this flag to true will attempt to merge all child semantics into
 this node. Setting this flag to false will force all child semantic nodes
 to be explicit.

 This flag should be false if the card contains multiple different types
 of content.

- **child**: `Widget?`
  The widget below this widget in the tree.

 

- **_variant**: `_CardVariant`
## Constructors

### Unnamed Constructor
Creates a Material Design card.

 The [elevation] must be null or non-negative.

### filled
Create a filled variant of Card.

 Filled cards provide subtle separation from the background. This has less
 emphasis than elevated(default) or outlined cards.

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
### outlined
Create an outlined variant of Card.

 Outlined cards have a visual boundary around the container. This can
 provide greater emphasis than the other types.

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
