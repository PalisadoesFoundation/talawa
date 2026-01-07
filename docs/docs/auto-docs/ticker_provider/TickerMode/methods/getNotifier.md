# Method: `getNotifier`

## Description

Obtains a [ValueListenable] from the [TickerMode] surrounding the `context`,
 which indicates whether tickers are enabled in the given subtree.

 When that [TickerMode] enabled or disabled tickers, the listenable notifies
 its listeners.

 While the [ValueListenable] is stable for the lifetime of the surrounding
 [TickerMode], calling this method does not establish a dependency between
 the `context` and the [TickerMode] and the widget owning the `context`
 does not rebuild when the ticker mode changes from true to false or vice
 versa. This is preferable when the ticker mode does not impact what is
 currently rendered on screen, e.g. because it is only used to mute/unmute a
 [Ticker]. Since no dependency is established, the widget owning the
 `context` is also not informed when it is moved to a new location in the
 tree where it may have a different [TickerMode] ancestor. When this
 happens, the widget must manually unsubscribe from the old listenable,
 obtain a new one from the new ancestor [TickerMode] by calling this method
 again, and re-subscribe to it. [StatefulWidget]s can, for example, do this
 in [State.activate], which is called after the widget has been moved to
 a new location.

 Alternatively, [of] can be used instead of this method to create a
 dependency between the provided `context` and the ancestor [TickerMode].
 In this case, the widget automatically rebuilds when the ticker mode
 changes or when it is moved to a new [TickerMode] ancestor, which
 simplifies the management cost in the widget at the expensive of some
 potential unnecessary rebuilds.

 In the absence of a [TickerMode] widget, this function returns a
 [ValueListenable], whose [ValueListenable.value] is always true.

## Return Type
`ValueListenable&lt;bool&gt;`

## Parameters

- `context`: `BuildContext`
