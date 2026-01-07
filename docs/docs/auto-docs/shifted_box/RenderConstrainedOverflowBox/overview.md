# Overview for `RenderConstrainedOverflowBox`

## Description

A render object that imposes different constraints on its child than it gets
 from its parent, possibly allowing the child to overflow the parent.

 A render overflow box proxies most functions in the render box protocol to
 its child, except that when laying out its child, it passes constraints
 based on the minWidth, maxWidth, minHeight, and maxHeight fields instead of
 just passing the parent's constraints in. Specifically, it overrides any of
 the equivalent fields on the constraints given by the parent with the
 constraints given by these fields for each such field that is not null. It
 then sizes itself based on the parent's constraints' maxWidth and maxHeight,
 ignoring the child's dimensions.

 For example, if you wanted a box to always render 50 pixels high, regardless
 of where it was rendered, you would wrap it in a
 RenderConstrainedOverflowBox with minHeight and maxHeight set to 50.0.
 Generally speaking, to avoid confusing behavior around hit testing, a
 RenderConstrainedOverflowBox should usually be wrapped in a RenderClipRect.

 The child is positioned according to [alignment]. To position a smaller
 child inside a larger parent, use [RenderPositionedBox] and
 [RenderConstrainedBox] rather than RenderConstrainedOverflowBox.

 See also:

  * [RenderConstraintsTransformBox] for a render object that applies an
    arbitrary transform to its constraints before sizing its child using
    the new constraints, treating any overflow as error.
  * [RenderSizedOverflowBox], a render object that is a specific size but
    passes its original constraints through to its child, which it allows to
    overflow.

## Dependencies

- RenderAligningShiftedBox

## Members

- **_minWidth**: `double?`
- **_maxWidth**: `double?`
- **_minHeight**: `double?`
- **_maxHeight**: `double?`
- **_fit**: `OverflowBoxFit`
## Constructors

### Unnamed Constructor
Creates a render object that lets its child overflow itself.

