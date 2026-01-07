# Overview for `SingleChildLayoutDelegate`

## Description

A delegate for computing the layout of a render object with a single child.

 Used by [CustomSingleChildLayout] (in the widgets library) and
 [RenderCustomSingleChildLayoutBox] (in the rendering library).

 When asked to layout, [CustomSingleChildLayout] first calls [getSize] with
 its incoming constraints to determine its size. It then calls
 [getConstraintsForChild] to determine the constraints to apply to the child.
 After the child completes its layout, [RenderCustomSingleChildLayoutBox]
 calls [getPositionForChild] to determine the child's position.

 The [shouldRelayout] method is called when a new instance of the class
 is provided, to check if the new instance actually represents different
 information.

 The most efficient way to trigger a relayout is to supply a `relayout`
 argument to the constructor of the [SingleChildLayoutDelegate]. The custom
 layout will listen to this value and relayout whenever the Listenable
 notifies its listeners, such as when an [Animation] ticks. This allows
 the custom layout to avoid the build phase of the pipeline.

 See also:

  * [CustomSingleChildLayout], the widget that uses this delegate.
  * [RenderCustomSingleChildLayoutBox], render object that uses this
    delegate.

## Members

- **_relayout**: `Listenable?`
## Constructors

### Unnamed Constructor
Creates a layout delegate.

 The layout will update whenever [relayout] notifies its listeners.

