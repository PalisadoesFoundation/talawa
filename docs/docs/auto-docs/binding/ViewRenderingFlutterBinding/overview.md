# Overview for `ViewRenderingFlutterBinding`

## Description

An extension of [RenderingFlutterBinding] that owns and manages a
 [renderView].

 Unlike [RenderingFlutterBinding], this binding also creates and owns a
 [renderView] to simplify bootstrapping for apps that have a dedicated main
 view.

## Dependencies

- RenderingFlutterBinding

## Members

- **_root**: `RenderBox?`
- **_renderView**: `RenderView`
## Constructors

### Unnamed Constructor
Creates a binding for the rendering layer.

 The `root` render box is attached directly to the [renderView] and is
 given constraints that require it to fill the window. The [renderView]
 itself is attached to the [rootPipelineOwner].

 This binding does not automatically schedule any frames. Callers are
 responsible for deciding when to first call [scheduleFrame].

