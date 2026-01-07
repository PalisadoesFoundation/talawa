# Overview for `InkFeature`

## Description

A visual reaction on a piece of [Material].

 To add an ink feature to a piece of [Material], obtain the
 [MaterialInkController] via [Material.of] and call
 [MaterialInkController.addInkFeature].

## Members

- **_controller**: `_RenderInkFeatures`
- **referenceBox**: `RenderBox`
  The render box whose visual position defines the frame of reference for this ink feature.

- **onRemoved**: `VoidCallback?`
  Called when the ink feature is no longer visible on the material.

- **_debugDisposed**: `bool`
## Constructors

### Unnamed Constructor
Initializes fields for subclasses.

