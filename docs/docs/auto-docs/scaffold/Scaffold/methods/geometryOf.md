# Method: `geometryOf`

## Description

Returns a [ValueListenable] for the [ScaffoldGeometry] for the closest
 [Scaffold] ancestor of the given context.

 The [ValueListenable.value] is only available at paint time.

 Notifications are guaranteed to be sent before the first paint pass
 with the new geometry, but there is no guarantee whether a build or
 layout passes are going to happen between the notification and the next
 paint pass.

 The closest [Scaffold] ancestor for the context might change, e.g when
 an element is moved from one scaffold to another. For [StatefulWidget]s
 using this listenable, a change of the [Scaffold] ancestor will
 trigger a [State.didChangeDependencies].

 A typical pattern for listening to the scaffold geometry would be to
 call [Scaffold.geometryOf] in [State.didChangeDependencies], compare the
 return value with the previous listenable, if it has changed, unregister
 the listener, and register a listener to the new [ScaffoldGeometry]
 listenable.

## Return Type
`ValueListenable&lt;ScaffoldGeometry&gt;`

## Parameters

- `context`: `BuildContext`
