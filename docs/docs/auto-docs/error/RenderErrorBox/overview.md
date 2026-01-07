# Overview for `RenderErrorBox`

## Description

A render object used as a placeholder when an error occurs.

 The box will be painted in the color given by the
 [RenderErrorBox.backgroundColor] static property.

 A message can be provided. To simplify the class and thus help reduce the
 likelihood of this class itself being the source of errors, the message
 cannot be changed once the object has been created. If provided, the text
 will be painted on top of the background, using the styles given by the
 [RenderErrorBox.textStyle] and [RenderErrorBox.paragraphStyle] static
 properties.

 Again to help simplify the class, if the parent has left the constraints
 unbounded, this box tries to be 100000.0 pixels wide and high, to
 approximate being infinitely high but without using infinities.

## Dependencies

- RenderBox

## Members

- **message**: `String`
  The message to attempt to display at paint time.

- **_paragraph**: `ui.Paragraph?`
- **padding**: `EdgeInsets`
  The distance to place around the text.

 This is intended to ensure that if the [RenderErrorBox] is placed at the top left
 of the screen, under the system's status bar, the error text is still visible in
 the area below the status bar.

 The padding is ignored if the error box is smaller than the padding.

 See also:

  * [minimumWidth], which controls how wide the box must be before the
    horizontal padding is applied.

- **minimumWidth**: `double`
  The width below which the horizontal padding is not applied.

 If the left and right padding would reduce the available width to less than
 this value, then the text is rendered flush with the left edge.

- **backgroundColor**: `Color`
  The color to use when painting the background of [RenderErrorBox] objects.

 Defaults to red in debug mode, a light gray otherwise.

- **textStyle**: `ui.TextStyle`
  The text style to use when painting [RenderErrorBox] objects.

 Defaults to a yellow monospace font in debug mode, and a dark gray
 sans-serif font otherwise.

- **paragraphStyle**: `ui.ParagraphStyle`
  The paragraph style to use when painting [RenderErrorBox] objects.

## Constructors

### Unnamed Constructor
Creates a RenderErrorBox render object.

 A message can optionally be provided. If a message is provided, an attempt
 will be made to render the message when the box paints.

