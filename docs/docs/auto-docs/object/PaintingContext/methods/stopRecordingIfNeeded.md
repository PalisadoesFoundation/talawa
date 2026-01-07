# Method: `stopRecordingIfNeeded`

## Description

Stop recording to a canvas if recording has started.

 Do not call this function directly: functions in this class will call
 this method as needed. This function is called internally to ensure that
 recording is stopped before adding layers or finalizing the results of a
 paint.

 Subclasses that need to customize how recording to a canvas is performed
 should override this method to save the results of the custom canvas
 recordings.

## Return Type
`void`

