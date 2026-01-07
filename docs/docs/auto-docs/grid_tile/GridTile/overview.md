# Overview for `GridTile`

## Description

A tile in a Material Design grid list.

 A grid list is a [GridView] of tiles in a vertical and horizontal
 array. Each tile typically contains some visually rich content (e.g., an
 image) together with a [GridTileBar] in either a [header] or a [footer].

 See also:

  * [GridView], which is a scrollable grid of tiles.
  * [GridTileBar], which is typically used in either the [header] or
    [footer].
  * <https://material.io/design/components/image-lists.html>

## Dependencies

- StatelessWidget

## Members

- **header**: `Widget?`
  The widget to show over the top of this grid tile.

 Typically a [GridTileBar].

- **footer**: `Widget?`
  The widget to show over the bottom of this grid tile.

 Typically a [GridTileBar].

- **child**: `Widget`
  The widget that fills the tile.

 

## Constructors

### Unnamed Constructor
Creates a grid tile.

 Must have a child. Does not typically have both a header and a footer.

