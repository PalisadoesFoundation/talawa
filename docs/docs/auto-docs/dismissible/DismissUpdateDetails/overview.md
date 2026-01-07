# Overview for `DismissUpdateDetails`

## Description

Details for [DismissUpdateCallback].

 See also:

   * [Dismissible.onUpdate], which receives this information.

## Members

- **direction**: `DismissDirection`
  The direction that the dismissible is being dragged.

- **reached**: `bool`
  Whether the dismiss threshold is currently reached.

- **previousReached**: `bool`
  Whether the dismiss threshold was reached the last time this callback was invoked.

 This can be used in conjunction with [DismissUpdateDetails.reached] to catch the moment
 that the [Dismissible] is dragged across the threshold.

- **progress**: `double`
  The offset ratio of the dismissible in its parent container.

 A value of 0.0 represents the normal position and 1.0 means the child is
 completely outside its parent.

 This can be used to synchronize other elements to what the dismissible is doing on screen,
 e.g. using this value to set the opacity thereby fading dismissible as it's dragged offscreen.

## Constructors

### Unnamed Constructor
Create a new instance of [DismissUpdateDetails].

