# Method: `update`

## Description

Updates the overlay after the selection has changed.

 If this method is called while the [SchedulerBinding.schedulerPhase] is
 [SchedulerPhase.persistentCallbacks], i.e. during the build, layout, or
 paint phases (see [WidgetsBinding.drawFrame]), then the update is delayed
 until the post-frame callbacks phase. Otherwise the update is done
 synchronously. This means that it is safe to call during builds, but also
 that if you do call this during a build, the UI will not update until the
 next frame (i.e. many milliseconds later).

## Return Type
`void`

## Parameters

- `newValue`: `TextEditingValue`
