# Method: `show`

## Description

Show the refresh indicator and run the refresh callback as if it had
 been started interactively. If this method is called while the refresh
 callback is running, it quietly does nothing.

 Creating the [RefreshIndicator] with a [GlobalKey&lt;RefreshIndicatorState&gt;]
 makes it possible to refer to the [RefreshIndicatorState].

 The future returned from this method completes when the
 [RefreshIndicator.onRefresh] callback's future completes.

 If you await the future returned by this function from a [State], you
 should check that the state is still [mounted] before calling [setState].

 When initiated in this manner, the refresh indicator is independent of any
 actual scroll view. It defaults to showing the indicator at the top. To
 show it at the bottom, set `atTop` to false.

## Return Type
`Future&lt;void&gt;`

## Parameters

- ``: `dynamic`
