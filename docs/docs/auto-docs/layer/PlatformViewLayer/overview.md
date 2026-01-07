# Overview for `PlatformViewLayer`

## Description

A layer that shows an embedded [UIView](https://developer.apple.com/documentation/uikit/uiview)
 on iOS.

## Dependencies

- Layer

## Members

- **rect**: `Rect`
  Bounding rectangle of this layer in the global coordinate space.

- **viewId**: `int`
  The unique identifier of the UIView displayed on this layer.

 A UIView with this identifier must have been created by [PlatformViewsService.initUiKitView].

## Constructors

### Unnamed Constructor
Creates a platform view layer.

