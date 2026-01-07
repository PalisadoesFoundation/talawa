# Method: `prepareInitialFrame`

## Description

Bootstrap the rendering pipeline by preparing the first frame.

 This should only be called once. It is typically called immediately after
 setting the [configuration] the first time (whether by passing one to the
 constructor, or setting it directly). The [configuration] must have been
 set before calling this method, and the [RenderView] must have been
 attached to a [PipelineOwner] using [attach].

 This does not actually schedule the first frame. Call
 [PipelineOwner.requestVisualUpdate] on the [owner] to do that.

 This should be called before using any methods that rely on the [layer]
 being initialized, such as [compositeFrame].

 This method calls [scheduleInitialLayout] and [scheduleInitialPaint].

## Return Type
`void`

