# Overview for `RenderProxyBox`

## Description

A base class for render boxes that resemble their children.

 A proxy box has a single child and mimics all the properties of that
 child by calling through to the child for each function in the render box
 protocol. For example, a proxy box determines its size by asking its child
 to layout with the same constraints and then matching the size.

 A proxy box isn't useful on its own because you might as well just replace
 the proxy box with its child. However, RenderProxyBox is a useful base class
 for render objects that wish to mimic most, but not all, of the properties
 of their child.

 See also:

  * [RenderProxySliver], a base class for render slivers that resemble their
    children.

## Dependencies

- RenderBox, RenderObjectWithChildMixin, RenderProxyBoxMixin

## Constructors

### Unnamed Constructor
Creates a proxy render box.

 Proxy render boxes are rarely created directly because they proxy
 the render box protocol to [child]. Instead, consider using one of the
 subclasses.

