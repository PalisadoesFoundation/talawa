# Overview for `RenderDecoratedBox`

## Description

Paints a [Decoration] either before or after its child paints.

## Dependencies

- RenderProxyBox

## Members

- **_painter**: `BoxPainter?`
- **_decoration**: `Decoration`
- **_position**: `DecorationPosition`
- **_configuration**: `ImageConfiguration`
## Constructors

### Unnamed Constructor
Creates a decorated box.

 The [decoration], [position], and [configuration] arguments must not be
 null. By default the decoration paints behind the child.

 The [ImageConfiguration] will be passed to the decoration (with the size
 filled in) to let it resolve images.

