# Overview for `GridTileBar`

## Description

A header used in a Material Design [GridTile].

 Typically used to add a one or two line header or footer on a [GridTile].

 For a one-line header, include a [title] widget. To add a second line, also
 include a [subtitle] widget. Use [leading] or [trailing] to add an icon.

 See also:

  * [GridTile]
  * <https://material.io/design/components/image-lists.html#anatomy>

## Dependencies

- StatelessWidget

## Members

- **backgroundColor**: `Color?`
  The color to paint behind the child widgets.

 Defaults to transparent.

- **leading**: `Widget?`
  A widget to display before the title.

 Typically an [Icon] or an [IconButton] widget.

- **title**: `Widget?`
  The primary content of the list item.

 Typically a [Text] widget.

- **subtitle**: `Widget?`
  Additional content displayed below the title.

 Typically a [Text] widget.

- **trailing**: `Widget?`
  A widget to display after the title.

 Typically an [Icon] or an [IconButton] widget.

## Constructors

### Unnamed Constructor
Creates a grid tile bar.

 Typically used to with [GridTile].

