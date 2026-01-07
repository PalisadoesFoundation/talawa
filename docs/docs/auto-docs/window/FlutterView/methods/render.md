# Method: `render`

## Description

Updates the view's rendering on the GPU with the newly provided [Scene].

 This function must be called within the scope of the
 [PlatformDispatcher.onBeginFrame] or [PlatformDispatcher.onDrawFrame]
 callbacks being invoked.

 If this function is called a second time during a single
 [PlatformDispatcher.onBeginFrame]/[PlatformDispatcher.onDrawFrame]
 callback sequence or called outside the scope of those callbacks, the call
 will be ignored.

 To record graphical operations, first create a [PictureRecorder], then
 construct a [Canvas], passing that [PictureRecorder] to its constructor.
 After issuing all the graphical operations, call the
 [PictureRecorder.endRecording] function on the [PictureRecorder] to obtain
 the final [Picture] that represents the issued graphical operations.

 Next, create a [SceneBuilder], and add the [Picture] to it using
 [SceneBuilder.addPicture]. With the [SceneBuilder.build] method you can
 then obtain a [Scene] object, which you can display to the user via this
 [render] function.

 If the view is configured with loose [physicalConstraints] (i.e.
 [ViewConstraints.isTight] returns false) a `size` satisfying those
 constraints must be provided. This method does not check that the provided
 `size` actually meets the constraints (this should be done in a higher
 level), but an illegal `size` may result in undefined rendering behavior.
 If no `size` is provided, [physicalSize] is used instead.

 See also:

 * [SchedulerBinding], the Flutter framework class which manages the
   scheduling of frames.
 * [RendererBinding], the Flutter framework class which manages layout and
   painting.

## Return Type
`void`

## Parameters

- `scene`: `Scene`
- ``: `dynamic`
