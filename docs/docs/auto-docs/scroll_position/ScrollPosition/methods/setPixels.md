# Method: `setPixels`

## Description

Update the scroll position ([pixels]) to a given pixel value.

 This should only be called by the current [ScrollActivity], either during
 the transient callback phase or in response to user input.

 Returns the overscroll, if any. If the return value is 0.0, that means
 that [pixels] now returns the given `value`. If the return value is
 positive, then [pixels] is less than the requested `value` by the given
 amount (overscroll past the max extent), and if it is negative, it is
 greater than the requested `value` by the given amount (underscroll past
 the min extent).

 The amount of overscroll is computed by [applyBoundaryConditions].

 The amount of the change that is applied is reported using [didUpdateScrollPositionBy].
 If there is any overscroll, it is reported using [didOverscrollBy].

## Return Type
`double`

## Parameters

- `newPixels`: `double`
