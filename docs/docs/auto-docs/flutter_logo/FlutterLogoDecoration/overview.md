# Overview for `FlutterLogoDecoration`

## Description

An immutable description of how to paint Flutter's logo.

## Dependencies

- Decoration

## Members

- **textColor**: `Color`
  The color used to paint the "Flutter" text on the logo, if [style] is
 [FlutterLogoStyle.horizontal] or [FlutterLogoStyle.stacked].

 If possible, the default (a medium grey) should be used against a white
 background.

- **style**: `FlutterLogoStyle`
  Whether and where to draw the "Flutter" text. By default, only the logo
 itself is drawn.

- **margin**: `EdgeInsets`
  How far to inset the logo from the edge of the container.

- **_position**: `double`
- **_opacity**: `double`
## Constructors

### Unnamed Constructor
Creates a decoration that knows how to paint Flutter's logo.

 The [style] controls whether and where to draw the "Flutter" label. If one
 is shown, the [textColor] controls the color of the label.

### _


#### Parameters

- `textColor`: `dynamic`
- `style`: `dynamic`
- `margin`: `dynamic`
- `_position`: `dynamic`
- `_opacity`: `dynamic`
