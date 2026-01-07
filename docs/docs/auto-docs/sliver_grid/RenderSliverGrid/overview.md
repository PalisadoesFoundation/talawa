# Overview for `RenderSliverGrid`

## Description

A sliver that places multiple box children in a two dimensional arrangement.

 [RenderSliverGrid] places its children in arbitrary positions determined by
 [gridDelegate]. Each child is forced to have the size specified by the
 [gridDelegate].

 See also:

  * [RenderSliverList], which places its children in a linear
    array.
  * [RenderSliverFixedExtentList], which places its children in a linear
    array with a fixed extent in the main axis.

## Dependencies

- RenderSliverMultiBoxAdaptor

## Members

- **_gridDelegate**: `SliverGridDelegate`
## Constructors

### Unnamed Constructor
Creates a sliver that contains multiple box children that whose size and
 position are determined by a delegate.

