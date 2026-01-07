# Overview for `BannerPainter`

## Description

Paints a [Banner].

## Dependencies

- CustomPainter

## Members

- **message**: `String`
  The message to show in the banner.

- **textDirection**: `TextDirection`
  The directionality of the text.

 This value is used to disambiguate how to render bidirectional text. For
 example, if the message is an English phrase followed by a Hebrew phrase,
 in a [TextDirection.ltr] context the English phrase will be on the left
 and the Hebrew phrase to its right, while in a [TextDirection.rtl]
 context, the English phrase will be on the right and the Hebrew phrase on
 its left.

 See also:

  * [layoutDirection], which controls the interpretation of values in
    [location].

- **location**: `BannerLocation`
  Where to show the banner (e.g., the upper right corner).

- **layoutDirection**: `TextDirection`
  The directionality of the layout.

 This value is used to interpret the [location] of the banner.

 See also:

  * [textDirection], which controls the reading direction of the [message].

- **color**: `Color`
  The color to paint behind the [message].

 Defaults to a dark red.

- **textStyle**: `TextStyle`
  The text style to use for the [message].

 Defaults to bold, white text.

- **shadow**: `BoxShadow`
  The shadow properties for the banner.

 Use a [BoxShadow] object to define the shadow's color, blur radius,
 and spread radius. These properties can be used to create different
 shadow effects.

- **_prepared**: `bool`
- **_textPainter**: `TextPainter?`
- **_paintShadow**: `Paint`
- **_paintBanner**: `Paint`
## Constructors

### Unnamed Constructor
Creates a banner painter.

