# Method: `bounce`

## Description

The bounce parameter used in [SpringDescription.withDurationAndBounce].

 This value controls how bouncy the spring is:

  * A value of 0 results in a critically damped spring with no oscillation.
  * Values between 0 and 1 produce underdamping, where the spring oscillates a few times
    before settling. A value of 1 represents an undamped spring that
    oscillates indefinitely.
  * Negative values indicate overdamping, where the motion is slow and
    resistive, like moving through a thick fluid.

 Defaults to 0.

## Return Type
`double`

