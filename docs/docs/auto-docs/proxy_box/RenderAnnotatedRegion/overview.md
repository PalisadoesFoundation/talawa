# Overview for `RenderAnnotatedRegion`

## Description

Render object which inserts an [AnnotatedRegionLayer] into the layer tree.

 See also:

  * [Layer.find], for an example of how this value is retrieved.
  * [AnnotatedRegionLayer], the layer this render object creates.

## Dependencies

- RenderProxyBox

## Members

- **_value**: `T`
- **_sized**: `bool`
- **_layerHandle**: `LayerHandle&lt;AnnotatedRegionLayer&lt;T&gt;&gt;`
- **alwaysNeedsCompositing**: `bool`
## Constructors

### Unnamed Constructor
Creates a new [RenderAnnotatedRegion] to insert [value] into the
 layer tree.

 If [sized] is true, the layer is provided with the size of this render
 object to clip the results of [Layer.find].

 Neither [value] nor [sized] can be null.

