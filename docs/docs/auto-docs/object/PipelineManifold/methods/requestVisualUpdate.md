# Method: `requestVisualUpdate`

## Description

Called by a [PipelineOwner] connected to this [PipelineManifold] when a
 [RenderObject] associated with that pipeline owner wishes to update its
 visual appearance.

 Typical implementations of this function will schedule a task to flush the
 various stages of the pipeline. This function might be called multiple
 times in quick succession. Implementations should take care to discard
 duplicate calls quickly.

 A [PipelineOwner] connected to this [PipelineManifold] will call
 [PipelineOwner.onNeedVisualUpdate] instead of this method if it has been
 configured with a non-null [PipelineOwner.onNeedVisualUpdate] callback.

 See also:

  * [SchedulerBinding.ensureVisualUpdate], which [PipelineManifold]
    implementations typically call to implement this method.

## Return Type
`void`

