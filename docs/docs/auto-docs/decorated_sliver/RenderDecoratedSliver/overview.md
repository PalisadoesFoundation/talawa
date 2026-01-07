# Overview for `RenderDecoratedSliver`

## Description

Paints a [Decoration] either before or after its child paints.

 If the child has infinite scroll extent, then the [Decoration] paints itself up to the
 bottom cache extent.

## Dependencies

- RenderProxySliver

## Members

- **_decoration**: `Decoration`
- **_position**: `DecorationPosition`
- **_configuration**: `ImageConfiguration`
- **_painter**: `BoxPainter?`
## Constructors

### Unnamed Constructor
Creates a decorated sliver.

 The [decoration], [position], and [configuration] arguments must not be
 null. By default the decoration paints behind the child.

 The [ImageConfiguration] will be passed to the decoration (with the size
 filled in) to let it resolve images.

