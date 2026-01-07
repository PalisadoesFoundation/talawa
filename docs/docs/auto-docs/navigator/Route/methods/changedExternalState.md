# Method: `changedExternalState`

## Description

Called whenever the [Navigator] has updated in some manner that might
 affect routes, to indicate that the route may wish to rebuild as well.

 This is called by the [Navigator] whenever the
 [NavigatorState]'s [State.widget] changes (as in [State.didUpdateWidget]),
 for example because the [MaterialApp] has been rebuilt. This
 ensures that routes that directly refer to the state of the
 widget that built the [MaterialApp] will be notified when that
 widget rebuilds, since it would otherwise be difficult to notify
 the routes that state they depend on may have changed.

 It is also called whenever the [Navigator]'s dependencies change
 (as in [State.didChangeDependencies]). This allows routes to use the
 [Navigator]'s context ([NavigatorState.context]), for example in
 [ModalRoute.barrierColor], and update accordingly.

 The [ModalRoute] subclass overrides this to force the barrier
 overlay to rebuild.

 See also:

  * [changedInternalState], the equivalent but for changes to the internal
    state of the route.

## Return Type
`void`

