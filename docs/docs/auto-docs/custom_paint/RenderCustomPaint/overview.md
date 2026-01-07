# Overview for `RenderCustomPaint`

## Description

Provides a canvas on which to draw during the paint phase.

 When asked to paint, [RenderCustomPaint] first asks its [painter] to paint
 on the current canvas, then it paints its child, and then, after painting
 its child, it asks its [foregroundPainter] to paint. The coordinate system of
 the canvas matches the coordinate system of the [CustomPaint] object. The
 painters are expected to paint within a rectangle starting at the origin and
 encompassing a region of the given size. (If the painters paint outside
 those bounds, there might be insufficient memory allocated to rasterize the
 painting commands and the resulting behavior is undefined.)

 Painters are implemented by subclassing or implementing [CustomPainter].

 Because custom paint calls its painters during paint, you cannot mark the
 tree as needing a new layout during the callback (the layout for this frame
 has already happened).

 Custom painters normally size themselves to their child. If they do not have
 a child, they attempt to size themselves to the [preferredSize], which
 defaults to [Size.zero].

 See also:

  * [CustomPainter], the class that custom painter delegates should extend.
  * [Canvas], the API provided to custom painter delegates.

## Dependencies

- RenderProxyBox

## Members

- **_painter**: `CustomPainter?`
- **_foregroundPainter**: `CustomPainter?`
- **_preferredSize**: `Size`
- **isComplex**: `bool`
  Whether to hint that this layer's painting should be cached.

 The compositor contains a raster cache that holds bitmaps of layers in
 order to avoid the cost of repeatedly rendering those layers on each
 frame. If this flag is not set, then the compositor will apply its own
 heuristics to decide whether the layer containing this render object is
 complex enough to benefit from caching.

- **willChange**: `bool`
  Whether the raster cache should be told that this painting is likely
 to change in the next frame.

 This hint tells the compositor not to cache the layer containing this
 render object because the cache will not be used in the future. If this
 hint is not set, the compositor will apply its own heuristics to decide
 whether this layer is likely to be reused in the future.

- **_backgroundSemanticsBuilder**: `SemanticsBuilderCallback?`
  Builds semantics for the picture drawn by [painter].

- **_foregroundSemanticsBuilder**: `SemanticsBuilderCallback?`
  Builds semantics for the picture drawn by [foregroundPainter].

- **_backgroundSemanticsNodes**: `List&lt;SemanticsNode&gt;?`
  Describe the semantics of the picture painted by the [painter].

- **_foregroundSemanticsNodes**: `List&lt;SemanticsNode&gt;?`
  Describe the semantics of the picture painted by the [foregroundPainter].

## Constructors

### Unnamed Constructor
Creates a render object that delegates its painting.

