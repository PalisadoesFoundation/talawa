# Method: `buildViewport`

## Description

Build the two dimensional viewport.

 Subclasses may override this method to change how the viewport is built,
 likely a subclass of [TwoDimensionalViewport].

 The `verticalOffset` and `horizontalOffset` arguments are the values
 obtained from [TwoDimensionalScrollable.viewportBuilder].

## Return Type
`Widget`

## Parameters

- `context`: `BuildContext`
- `verticalOffset`: `ViewportOffset`
- `horizontalOffset`: `ViewportOffset`
