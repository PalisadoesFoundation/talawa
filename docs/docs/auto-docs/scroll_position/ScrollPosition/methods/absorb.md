# Method: `absorb`

## Description

Take any current applicable state from the given [ScrollPosition].

 This method is called by the constructor if it is given an `oldPosition`.
 The `other` argument might not have the same [runtimeType] as this object.

 This method can be destructive to the other [ScrollPosition]. The other
 object must be disposed immediately after this call (in the same call
 stack, before microtask resolution, by whomever called this object's
 constructor).

 If the old [ScrollPosition] object is a different [runtimeType] than this
 one, the [ScrollActivity.resetActivity] method is invoked on the newly
 adopted [ScrollActivity].

 ## Overriding

 Overrides of this method must call `super.absorb` after setting any
 metrics-related or activity-related state, since this method may restart
 the activity and scroll activities tend to use those metrics when being
 restarted.

 Overrides of this method might need to start an [IdleScrollActivity] if
 they are unable to absorb the activity from the other [ScrollPosition].

 Overrides of this method might also need to update the delegates of
 absorbed scroll activities if they use themselves as a
 [ScrollActivityDelegate].

## Return Type
`void`

## Parameters

- `other`: `ScrollPosition`
