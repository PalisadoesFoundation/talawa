# Method: `paint`

## Description

Called whenever the object needs to paint. The given [Canvas] has its
 coordinate space configured such that the origin is at the top left of the
 box. The area of the box is the size of the [size] argument.

 Paint operations should remain inside the given area. Graphical
 operations outside the bounds may be silently ignored, clipped, or not
 clipped. It may sometimes be difficult to guarantee that a certain
 operation is inside the bounds (e.g., drawing a rectangle whose size is
 determined by user inputs). In that case, consider calling
 [Canvas.clipRect] at the beginning of [paint] so everything that follows
 will be guaranteed to only draw within the clipped area.

 Implementations should be wary of correctly pairing any calls to
 [Canvas.save]/[Canvas.saveLayer] and [Canvas.restore], otherwise all
 subsequent painting on this canvas may be affected, with potentially
 hilarious but confusing results.

 To paint text on a [Canvas], use a [TextPainter].

 To paint an image on a [Canvas]:

 1. Obtain an [ImageStream], for example by calling [ImageProvider.resolve]
    on an [AssetImage] or [NetworkImage] object.

 2. Whenever the [ImageStream]'s underlying [ImageInfo] object changes
    (see [ImageStream.addListener]), create a new instance of your custom
    paint delegate, giving it the new [ImageInfo] object.

 3. In your delegate's [paint] method, call the [Canvas.drawImage],
    [Canvas.drawImageRect], or [Canvas.drawImageNine] methods to paint the
    [ImageInfo.image] object, applying the [ImageInfo.scale] value to
    obtain the correct rendering size.

## Return Type
`void`

## Parameters

- `canvas`: `Canvas`
- `size`: `Size`
