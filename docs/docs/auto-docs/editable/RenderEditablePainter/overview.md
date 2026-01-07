# Overview for `RenderEditablePainter`

## Description

An interface that paints within a [RenderEditable]'s bounds, above or
 beneath its text content.

 This painter is typically used for painting auxiliary content that depends
 on text layout metrics (for instance, for painting carets and text highlight
 blocks). It can paint independently from its [RenderEditable], allowing it
 to repaint without triggering a repaint on the entire [RenderEditable] stack
 when only auxiliary content changes (e.g. a blinking cursor) are present. It
 will be scheduled to repaint when:

  * It's assigned to a new [RenderEditable] (replacing a prior
    [RenderEditablePainter]) and the [shouldRepaint] method returns true.
  * Any of the [RenderEditable]s it is attached to repaints.
  * The [notifyListeners] method is called, which typically happens when the
    painter's attributes change.

 See also:

  * [RenderEditable.foregroundPainter], which takes a [RenderEditablePainter]
    and sets it as the foreground painter of the [RenderEditable].
  * [RenderEditable.painter], which takes a [RenderEditablePainter]
    and sets it as the background painter of the [RenderEditable].
  * [CustomPainter], a similar class which paints within a [RenderCustomPaint].

## Dependencies

- ChangeNotifier

