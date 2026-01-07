# Overview for `RenderBackdropFilter`

## Description

Applies a filter to the existing painted content and then paints [child].

 This effect is relatively expensive, especially if the filter is non-local,
 such as a blur.

## Dependencies

- RenderProxyBox

## Members

- **_enabled**: `bool`
- **_filter**: `ui.ImageFilter`
- **_blendMode**: `BlendMode`
- **_backdropKey**: `BackdropKey?`
## Constructors

### Unnamed Constructor
Creates a backdrop filter.
 The [blendMode] argument defaults to [BlendMode.srcOver].

