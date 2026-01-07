# Overview for `VerticesBuilder`

## Description

Creates vertices from path commands.

 First, build up the path contours with the [moveTo], [lineTo], [cubicTo],
 and [close] methods. All methods expect absolute coordinates.

 Then, use the [tessellate] method to create a [Float32List] of vertex pairs.

 Finally, use the [dispose] method to clean up native resources. After
 [dispose] has been called, this class must not be used again.

## Members

- **_builder**: `ffi.Pointer&lt;_PathBuilder&gt;?`
- **_vertices**: `List<ffi.Pointer&lt;_Vertices>&gt;`
## Constructors

### Unnamed Constructor
Constructs a [VerticesBuilder] instance to which path commands can be
 added.

