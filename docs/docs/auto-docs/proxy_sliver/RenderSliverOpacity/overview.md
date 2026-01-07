# Overview for `RenderSliverOpacity`

## Description

Makes its sliver child partially transparent.

 This class paints its sliver child into an intermediate buffer and then
 blends the sliver child back into the scene, partially transparent.

 For values of opacity other than 0.0 and 1.0, this class is relatively
 expensive, because it requires painting the sliver child into an intermediate
 buffer. For the value 0.0, the sliver child is not painted at all.
 For the value 1.0, the sliver child is painted immediately without an
 intermediate buffer.

## Dependencies

- RenderProxySliver

## Members

- **_alpha**: `int`
- **_opacity**: `double`
- **_alwaysIncludeSemantics**: `bool`
## Constructors

### Unnamed Constructor
Creates a partially transparent render object.

 The [opacity] argument must be between 0.0 and 1.0, inclusive.

