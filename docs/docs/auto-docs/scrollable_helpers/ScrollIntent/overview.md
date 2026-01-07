# Overview for `ScrollIntent`

## Description

An [Intent] that represents scrolling the nearest scrollable by an amount
 appropriate for the [type] specified.

 The actual amount of the scroll is determined by the
 [Scrollable.incrementCalculator], or by its defaults if that is not
 specified.

## Dependencies

- Intent

## Members

- **direction**: `AxisDirection`
  The direction in which to scroll the scrollable containing the focused
 widget.

- **type**: `ScrollIncrementType`
  The type of scrolling that is intended.

## Constructors

### Unnamed Constructor
Creates a const [ScrollIntent] that requests scrolling in the given
 [direction], with the given [type].

