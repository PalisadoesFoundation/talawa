# Overview for `RenderView`

## Description

The root of the render tree.

 The view represents the total output surface of the render tree and handles
 bootstrapping the rendering pipeline. The view has a unique child
 [RenderBox], which is required to fill the entire output surface.

 This object must be bootstrapped in a specific order:

  1. First, set the [configuration] (either in the constructor or after
     construction).
  2. Second, [attach] the object to a [PipelineOwner].
  3. Third, use [prepareInitialFrame] to bootstrap the layout and paint logic.

 After the bootstrapping is complete, the [compositeFrame] method may be used
 to obtain the rendered output.

## Dependencies

- RenderObject, RenderObjectWithChildMixin

## Members

- **_size**: `Size`
- **_configuration**: `ViewConfiguration?`
- **_view**: `ui.FlutterView`
- **automaticSystemUiAdjustment**: `bool`
  Whether Flutter should automatically compute the desired system UI.

 When this setting is enabled, Flutter will hit-test the layer tree at the
 top and bottom of the screen on each frame looking for an
 [AnnotatedRegionLayer] with an instance of a [SystemUiOverlayStyle]. The
 hit-test result from the top of the screen provides the status bar settings
 and the hit-test result from the bottom of the screen provides the system
 nav bar settings.

 If there is no [AnnotatedRegionLayer] on the bottom, the hit-test result
 from the top provides the system nav bar settings. If there is no
 [AnnotatedRegionLayer] on the top, the hit-test result from the bottom
 provides the system status bar settings.

 Setting this to false does not cause previous automatic adjustments to be
 reset, nor does setting it to true cause the app to update immediately.

 If you want to imperatively set the system ui style instead, it is
 recommended that [automaticSystemUiAdjustment] is set to false.

 See also:

  * [AnnotatedRegion], for placing [SystemUiOverlayStyle] in the layer tree.
  * [SystemChrome.setSystemUIOverlayStyle], for imperatively setting the system ui style.

- **_rootTransform**: `Matrix4?`
- **_debugPaintCallbacks**: `List&lt;DebugPaintCallback&gt;`
## Constructors

### Unnamed Constructor
Creates the root of the render tree.

 Typically created by the binding (e.g., [RendererBinding]).

 Providing a [configuration] is optional, but a configuration must be set
 before calling [prepareInitialFrame]. This decouples creating the
 [RenderView] object from configuring it. Typically, the object is created
 by the [View] widget and configured by the [RendererBinding] when the
 [RenderView] is registered with it by the [View] widget.

