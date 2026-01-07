# Method: `buildViewport`

## Description

Build the viewport.

 Subclasses may override this method to change how the viewport is built.
 The default implementation uses a [ShrinkWrappingViewport] if [shrinkWrap]
 is true, and a regular [Viewport] otherwise.

 The `offset` argument is the value obtained from
 [Scrollable.viewportBuilder].

 The `axisDirection` argument is the value obtained from [getDirection],
 which by default uses [scrollDirection] and [reverse].

 The `slivers` argument is the value obtained from [buildSlivers].

## Return Type
`Widget`

## Parameters

- `context`: `BuildContext`
- `offset`: `ViewportOffset`
- `axisDirection`: `AxisDirection`
- `slivers`: `List&lt;Widget&gt;`
