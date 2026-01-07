# Overview for `RenderListWheelViewport`

## Description

Render, onto a wheel, a bigger sequential set of objects inside this viewport.

 Takes a scrollable set of fixed sized [RenderBox]es and renders them
 sequentially from top down on a vertical scrolling axis.

 It starts with the first scrollable item in the center of the main axis
 and ends with the last scrollable item in the center of the main axis. This
 is in contrast to typical lists that start with the first scrollable item
 at the start of the main axis and ends with the last scrollable item at the
 end of the main axis.

 Instead of rendering its children on a flat plane, it renders them
 as if each child is broken into its own plane and that plane is
 perpendicularly fixed onto a cylinder which rotates along the scrolling
 axis.

 This class works in 3 coordinate systems:

 1. The **scrollable layout coordinates**. This coordinate system is used to
    communicate with [ViewportOffset] and describes its children's abstract
    offset from the beginning of the scrollable list at (0.0, 0.0).

    The list is scrollable from the start of the first child item to the
    start of the last child item.

    Children's layout coordinates don't change as the viewport scrolls.

 2. The **untransformed plane's viewport painting coordinates**. Children are
    not painted in this coordinate system. It's an abstract intermediary used
    before transforming into the next cylindrical coordinate system.

    This system is the **scrollable layout coordinates** translated by the
    scroll offset such that (0.0, 0.0) is the top left corner of the
    viewport.

    Because the viewport is centered at the scrollable list's scroll offset
    instead of starting at the scroll offset, there are paintable children
    ~1/2 viewport length before and after the scroll offset instead of ~1
    viewport length after the scroll offset.

    Children's visibility inclusion in the viewport is determined in this
    system regardless of the cylinder's properties such as [diameterRatio]
    or [perspective]. In other words, a 100px long viewport will always
    paint 10-11 visible 10px children if there are enough children in the
    viewport.

 3. The **transformed cylindrical space viewport painting coordinates**.
    Children from system 2 get their positions transformed into a cylindrical
    projection matrix instead of its Cartesian offset with respect to the
    scroll offset.

    Children in this coordinate system are painted.

    The wheel's size and the maximum and minimum visible angles are both
    controlled by [diameterRatio]. Children visible in the **untransformed
    plane's viewport painting coordinates**'s viewport will be radially
    evenly laid out between the maximum and minimum angles determined by
    intersecting the viewport's main axis length with a cylinder whose
    diameter is [diameterRatio] times longer, as long as those angles are
    between -pi/2 and pi/2.

    For example, if [diameterRatio] is 2.0 and this [RenderListWheelViewport]
    is 100.0px in the main axis, then the diameter is 200.0. And children
    will be evenly laid out between that cylinder's -arcsin(1/2) and
    arcsin(1/2) angles.

    The cylinder's 0 degree side is always centered in the
    [RenderListWheelViewport]. The transformation from **untransformed
    plane's viewport painting coordinates** is also done such that the child
    in the center of that plane will be mostly untransformed with children
    above and below it being transformed more as the angle increases.

## Dependencies

- RenderBox, ContainerRenderObjectMixin, RenderAbstractViewport

## Members

- **defaultDiameterRatio**: `double`
  An arbitrary but aesthetically reasonable default value for [diameterRatio].

- **defaultPerspective**: `double`
  An arbitrary but aesthetically reasonable default value for [perspective].

- **diameterRatioZeroMessage**: `String`
  An error message to show when the provided [diameterRatio] is zero.

- **perspectiveTooHighMessage**: `String`
  An error message to show when the [perspective] value is too high.

- **clipBehaviorAndRenderChildrenOutsideViewportConflict**: `String`
  An error message to show when [clipBehavior] and [renderChildrenOutsideViewport]
 are set to conflicting values.

- **childManager**: `ListWheelChildManager`
  The delegate that manages the children of this object.

 This delegate must maintain the [ListWheelParentData.index] value.

- **_offset**: `ViewportOffset`
- **_diameterRatio**: `double`
- **_perspective**: `double`
- **_offAxisFraction**: `double`
- **_useMagnifier**: `bool`
- **_magnification**: `double`
- **_overAndUnderCenterOpacity**: `double`
- **_itemExtent**: `double`
- **_squeeze**: `double`
- **_renderChildrenOutsideViewport**: `bool`
- **_clipBehavior**: `Clip`
- **_clipRectLayer**: `LayerHandle&lt;ClipRectLayer&gt;`
- **_childOpacityLayerHandler**: `LayerHandle&lt;OpacityLayer&gt;`
## Constructors

### Unnamed Constructor
Creates a [RenderListWheelViewport] which renders children on a wheel.

 Optional arguments have reasonable defaults.

