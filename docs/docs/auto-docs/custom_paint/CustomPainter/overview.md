# Overview for `CustomPainter`

## Description

The interface used by [CustomPaint] (in the widgets library) and
 [RenderCustomPaint] (in the rendering library).

 To implement a custom painter, either subclass or implement this interface
 to define your custom paint delegate. [CustomPainter] subclasses must
 implement the [paint] and [shouldRepaint] methods, and may optionally also
 implement the [hitTest] and [shouldRebuildSemantics] methods, and the
 [semanticsBuilder] getter.

 The [paint] method is called whenever the custom object needs to be repainted.

 The [shouldRepaint] method is called when a new instance of the class
 is provided, to check if the new instance actually represents different
 information.

 

 The most efficient way to trigger a repaint is to either:

 * Extend this class and supply a `repaint` argument to the constructor of
   the [CustomPainter], where that object notifies its listeners when it is
   time to repaint.
 * Extend [Listenable] (e.g. via [ChangeNotifier]) and implement
   [CustomPainter], so that the object itself provides the notifications
   directly.

 In either case, the [CustomPaint] widget or [RenderCustomPaint]
 render object will listen to the [Listenable] and repaint whenever the
 animation ticks, avoiding both the build and layout phases of the pipeline.

 The [hitTest] method is called when the user interacts with the underlying
 render object, to determine if the user hit the object or missed it.

 The [semanticsBuilder] is called whenever the custom object needs to rebuild
 its semantics information.

 The [shouldRebuildSemantics] method is called when a new instance of the
 class is provided, to check if the new instance contains different
 information that affects the semantics tree.

 

 This sample extends the same code shown for [RadialGradient] to create a
 custom painter that paints a sky.

 ```dart
 class Sky extends CustomPainter 
 ```
 

 ## Composition and the sharing of canvases

 Widgets (or rather, render objects) are composited together using a minimum
 number of [Canvas]es, for performance reasons. As a result, a
 [CustomPainter]'s [Canvas] may be the same as that used by other widgets
 (including other [CustomPaint] widgets).

 This is mostly unnoticeable, except when using unusual [BlendMode]s. For
 example, trying to use [BlendMode.dstOut] to "punch a hole" through a
 previously-drawn image may erase more than was intended, because previous
 widgets will have been painted onto the same canvas.

 To avoid this issue, consider using [Canvas.saveLayer] and
 [Canvas.restore] when using such blend modes. Creating new layers is
 relatively expensive, however, and should be done sparingly to avoid
 introducing jank.

 See also:

  * [Canvas], the class that a custom painter uses to paint.
  * [CustomPaint], the widget that uses [CustomPainter], and whose sample
    code shows how to use the above `Sky` class.
  * [RadialGradient], whose sample code section shows a different take
    on the sample code above.

## Dependencies

- Listenable

## Members

- **_repaint**: `Listenable?`
## Constructors

### Unnamed Constructor
Creates a custom painter.

 The painter will repaint whenever `repaint` notifies its listeners.

