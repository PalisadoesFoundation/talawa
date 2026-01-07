# Overview for `ViewConfiguration`

## Description

The layout constraints for the root render object.

## Members

- **logicalConstraints**: `BoxConstraints`
  The constraints of the output surface in logical pixel.

 The constraints are passed to the child of the root render object.

- **physicalConstraints**: `BoxConstraints`
  The constraints of the output surface in physical pixel.

 These constraints are enforced in [toPhysicalSize] when translating
 the logical size of the root render object back to physical pixels for
 the [ui.FlutterView.render] method.

- **devicePixelRatio**: `double`
  The pixel density of the output surface.

## Constructors

### Unnamed Constructor
Creates a view configuration.

 By default, the view has [logicalConstraints] and [physicalConstraints]
 with all dimensions set to zero (i.e. the view is forced to [Size.zero])
 and a [devicePixelRatio] of 1.0.

 [ViewConfiguration.fromView] is a more convenient way for deriving a
 [ViewConfiguration] from a given [ui.FlutterView].

### fromView
Creates a view configuration for the provided [ui.FlutterView].

#### Parameters

- `view`: `ui.FlutterView`
