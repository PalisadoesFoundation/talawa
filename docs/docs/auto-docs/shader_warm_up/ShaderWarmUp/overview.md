# Overview for `ShaderWarmUp`

## Description

Interface for drawing an image to warm up Skia shader compilations.

 When Skia first sees a certain type of draw operation on the GPU, it needs
 to compile the corresponding shader. The compilation can be slow (20ms-
 200ms). Having that time as startup latency is often better than having
 jank in the middle of an animation.

 Therefore, we use this during the [PaintingBinding.initInstances] call to
 move common shader compilations from animation time to startup time. If
 needed, app developers can create a custom [ShaderWarmUp] subclass and
 hand it to [PaintingBinding.shaderWarmUp] before
 [PaintingBinding.initInstances] is called. Usually, that can be done before
 calling [runApp].

 To determine whether a draw operation is useful for warming up shaders,
 check whether it improves the slowest frame rasterization time. Also,
 tracing with `flutter run --profile --trace-skia` may reveal whether there
 is shader-compilation-related jank. If there is such jank, some long
 `GrGLProgramBuilder::finalize` calls would appear in the middle of an
 animation. Their parent calls, which look like `XyzOp` (e.g., `FillRecOp`,
 `CircularRRectOp`) would suggest Xyz draw operations are causing the shaders
 to be compiled. A useful shader warm-up draw operation would eliminate such
 long compilation calls in the animation. To double-check the warm-up, trace
 with `flutter run --profile --trace-skia --start-paused`. The
 `GrGLProgramBuilder` with the associated `XyzOp` should appear during
 startup rather than in the middle of a later animation.

 This warm-up needs to be run on each individual device because the shader
 compilation depends on the specific GPU hardware and driver a device has. It
 can't be pre-computed during the Flutter engine compilation as the engine is
 device-agnostic.

 If no warm-up is desired (e.g., when the startup latency is crucial), set
 [PaintingBinding.shaderWarmUp] either to a custom ShaderWarmUp with an empty
 [warmUpOnCanvas] or null.

 See also:

  * [PaintingBinding.shaderWarmUp], the actual instance of [ShaderWarmUp]
    that's used to warm up the shaders.
  * <https://docs.flutter.dev/perf/shader>

## Constructors

### Unnamed Constructor
Abstract const constructor. This constructor enables subclasses to provide
 const constructors so that they can be used in const expressions.

