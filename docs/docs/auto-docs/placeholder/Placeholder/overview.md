# Overview for `Placeholder`

## Description

A widget that draws a box that represents where other widgets will one day
 be added.

 This widget is useful during development to indicate that the interface is
 not yet complete.

 By default, the placeholder is sized to fit its container. If the
 placeholder is in an unbounded space, it will size itself according to the
 given [fallbackWidth] and [fallbackHeight].

 

## Dependencies

- StatelessWidget

## Members

- **color**: `Color`
  The color to draw the placeholder box.

- **strokeWidth**: `double`
  The width of the lines in the placeholder box.

- **fallbackWidth**: `double`
  The width to use when the placeholder is in a situation with an unbounded
 width.

 See also:

  * [fallbackHeight], the same but vertically.

- **fallbackHeight**: `double`
  The height to use when the placeholder is in a situation with an unbounded
 height.

 See also:

  * [fallbackWidth], the same but horizontally.

- **child**: `Widget?`
  The [child] contained by the placeholder box.

 Defaults to null.

## Constructors

### Unnamed Constructor
Creates a widget which draws a box.

