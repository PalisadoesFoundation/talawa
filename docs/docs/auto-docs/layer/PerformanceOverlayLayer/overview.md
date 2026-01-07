# Overview for `PerformanceOverlayLayer`

## Description

A layer that indicates to the compositor that it should display
 certain performance statistics within it.

 Performance overlay layers are always leaves in the layer tree.

## Dependencies

- Layer

## Members

- **_overlayRect**: `Rect`
- **optionsMask**: `int`
  The mask is created by shifting 1 by the index of the specific
 [PerformanceOverlayOption] to enable.

## Constructors

### Unnamed Constructor
Creates a layer that displays a performance overlay.

