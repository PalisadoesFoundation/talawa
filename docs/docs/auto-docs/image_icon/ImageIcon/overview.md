# Overview for `ImageIcon`

## Description

An icon that comes from an [ImageProvider], e.g. an [AssetImage].

 See also:

  * [IconButton], for interactive icons.
  * [IconTheme], which provides ambient configuration for icons.
  * [Icon], for icons based on glyphs from fonts instead of images.
  * [Icons], the library of Material Icons.

## Dependencies

- StatelessWidget

## Members

- **image**: `ImageProvider?`
  The image to display as the icon.

 The icon can be null, in which case the widget will render as an empty
 space of the specified [size].

- **size**: `double?`
  The size of the icon in logical pixels.

 Icons occupy a square with width and height equal to size.

 Defaults to the current [IconTheme] size, if any. If there is no
 [IconTheme], or it does not specify an explicit size, then it defaults to
 24.0.

- **color**: `Color?`
  The color to use when drawing the icon.

 Defaults to the current [IconTheme] color, if any. If there is
 no [IconTheme], then it defaults to not recolorizing the image.

 The image will be additionally adjusted by the opacity of the current
 [IconTheme], if any.

- **semanticLabel**: `String?`
  Semantic label for the icon.

 Announced by assistive technologies (e.g TalkBack/VoiceOver).
 This label does not show in the UI.

  * [SemanticsProperties.label], which is set to [semanticLabel] in the
    underlying	 [Semantics] widget.

## Constructors

### Unnamed Constructor
Creates an image icon.

 The [size] and [color] default to the value given by the current [IconTheme].

