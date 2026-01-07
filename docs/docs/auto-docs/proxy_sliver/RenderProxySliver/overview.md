# Overview for `RenderProxySliver`

## Description

A base class for sliver render objects that resemble their children.

 A proxy sliver has a single child and mimics all the properties of
 that child by calling through to the child for each function in the render
 sliver protocol. For example, a proxy sliver determines its geometry by
 asking its sliver child to layout with the same constraints and then
 matching the geometry.

 A proxy sliver isn't useful on its own because you might as well just
 replace the proxy sliver with its child. However, RenderProxySliver is a
 useful base class for render objects that wish to mimic most, but not all,
 of the properties of their sliver child.

 See also:

  * [RenderProxyBox], a base class for render boxes that resemble their
    children.

## Dependencies

- RenderSliver, RenderObjectWithChildMixin

## Constructors

### Unnamed Constructor
Creates a proxy render sliver.

 Proxy render slivers aren't created directly because they proxy
 the render sliver protocol to their sliver [child]. Instead, use one of
 the subclasses.

