# Overview for `NavigatorState`

## Description

The state for a [Navigator] widget.

 A reference to this class can be obtained by calling [Navigator.of].

## Dependencies

- State, TickerProviderStateMixin, RestorationMixin

## Members

- **_overlayKey**: `GlobalKey&lt;OverlayState&gt;`
- **_history**: `_History`
- **_entryWaitingForSubTreeDisposal**: `Set&lt;_RouteEntry&gt;`
  A set for entries that are waiting to dispose until their subtrees are
 disposed.

 These entries are not considered to be in the _history and will usually
 remove themselves from this set once they can dispose.

 The navigator keep track of these entries so that, in case the navigator
 itself is disposed, it can dispose these entries immediately.

- **_serializableHistory**: `_HistoryProperty`
- **_observedRouteAdditions**: `Queue&lt;_NavigatorObservation&gt;`
- **_observedRouteDeletions**: `Queue&lt;_NavigatorObservation&gt;`
- **focusNode**: `FocusNode`
  The [FocusNode] for the [Focus] that encloses the routes.

- **_debugLocked**: `bool`
- **_heroControllerFromScope**: `HeroController?`
- **_effectiveObservers**: `List&lt;NavigatorObserver&gt;`
- **_rawNextPagelessRestorationScopeId**: `RestorableNum&lt;int&gt;`
- **_lastTopmostRoute**: `_RouteEntry?`
- **_lastAnnouncedRouteName**: `String?`
- **_debugUpdatingPage**: `bool`
- **_flushingHistory**: `bool`
- **_userGesturesInProgressCount**: `int`
- **userGestureInProgressNotifier**: `ValueNotifier&lt;bool&gt;`
  Notifies its listeners if the value of [userGestureInProgress] changes.

- **_activePointers**: `Set&lt;int&gt;`
