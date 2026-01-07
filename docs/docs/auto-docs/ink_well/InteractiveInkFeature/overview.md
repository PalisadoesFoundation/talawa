# Overview for `InteractiveInkFeature`

## Description

An ink feature that displays a [color] "splash" in response to a user
 gesture that can be confirmed or canceled.

 Subclasses call [confirm] when an input gesture is recognized. For
 example a press event might trigger an ink feature that's confirmed
 when the corresponding up event is seen.

 Subclasses call [cancel] when an input gesture is aborted before it
 is recognized. For example a press event might trigger an ink feature
 that's canceled when the pointer is dragged out of the reference
 box.

 The [InkWell] and [InkResponse] widgets generate instances of this
 class.

## Dependencies

- InkFeature

## Members

- **_color**: `Color`
- **_customBorder**: `ShapeBorder?`
## Constructors

### Unnamed Constructor
Creates an InteractiveInkFeature.

