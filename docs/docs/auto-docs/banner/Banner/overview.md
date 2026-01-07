# Overview for `Banner`

## Description

Displays a diagonal message above the corner of another widget.

 Useful for showing the execution mode of an app (e.g., that asserts are
 enabled.)

 See also:

  * [CheckedModeBanner], which the [WidgetsApp] widget includes by default in
    debug mode, to show a banner that says "DEBUG".

## Dependencies

- StatefulWidget

## Members

- **child**: `Widget?`
  The widget to show behind the banner.

 

- **message**: `String`
  The message to show in the banner.

- **textDirection**: `TextDirection?`
  The directionality of the text.

 This is used to disambiguate how to render bidirectional text. For
 example, if the message is an English phrase followed by a Hebrew phrase,
 in a [TextDirection.ltr] context the English phrase will be on the left
 and the Hebrew phrase to its right, while in a [TextDirection.rtl]
 context, the English phrase will be on the right and the Hebrew phrase on
 its left.

 Defaults to the ambient [Directionality], if any.

 See also:

  * [layoutDirection], which controls the interpretation of the [location].

- **location**: `BannerLocation`
  Where to show the banner (e.g., the upper right corner).

- **layoutDirection**: `TextDirection?`
  The directionality of the layout.

 This is used to resolve the [location] values.

 Defaults to the ambient [Directionality], if any.

 See also:

  * [textDirection], which controls the reading direction of the [message].

- **color**: `Color`
  The color of the banner.

- **textStyle**: `TextStyle`
  The style of the text shown on the banner.

- **shadow**: `BoxShadow`
  The shadow properties for the banner.

 Use a [BoxShadow] object to define the shadow's color, blur radius,
 and spread radius. These properties can be used to create different
 shadow effects.

## Constructors

### Unnamed Constructor
Creates a banner.

