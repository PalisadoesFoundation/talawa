# Overview for `AndroidViewSurface`

## Description

Integrates an Android view with Flutter's compositor, touch, and semantics subsystems.

 The compositor integration is done by adding a [TextureLayer] to the layer tree.

 The parent of this object must provide bounded layout constraints.

 If the associated platform view is not created, the [AndroidViewSurface] does not paint any contents.

 When possible, you may want to use [AndroidView] directly, since it requires less boilerplate code
 than [AndroidViewSurface], and there's no difference in performance, or other trade-off(s).

 See also:

  * [AndroidView] which embeds an Android platform view in the widget hierarchy.
  * [UiKitView] which embeds an iOS platform view in the widget hierarchy.

## Dependencies

- StatefulWidget

## Members

- **controller**: `AndroidViewController`
  The controller for the platform view integrated by this [AndroidViewSurface].

 See [PlatformViewSurface.controller] for details.

- **gestureRecognizers**: `Set&lt;Factory&lt;OneSequenceGestureRecognizer&gt;&gt;`
  Which gestures should be forwarded to the PlatformView.

 See [PlatformViewSurface.gestureRecognizers] for details.

- **hitTestBehavior**: `PlatformViewHitTestBehavior`
  

## Constructors

### Unnamed Constructor
Construct an `AndroidPlatformViewSurface`.

