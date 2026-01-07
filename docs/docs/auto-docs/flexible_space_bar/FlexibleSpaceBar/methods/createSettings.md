# Method: `createSettings`

## Description

Wraps a widget that contains an [AppBar] to convey sizing information down
 to the [FlexibleSpaceBar].

 Used by [Scaffold] and [SliverAppBar].

 `toolbarOpacity` affects how transparent the text within the toolbar
 appears. `minExtent` sets the minimum height of the resulting
 [FlexibleSpaceBar] when fully collapsed. `maxExtent` sets the maximum
 height of the resulting [FlexibleSpaceBar] when fully expanded.
 `currentExtent` sets the scale of the [FlexibleSpaceBar.background] and
 [FlexibleSpaceBar.title] widgets of [FlexibleSpaceBar] upon
 initialization. `scrolledUnder` is true if the [FlexibleSpaceBar]
 overlaps the app's primary scrollable, false if it does not, and null
 if the caller has not determined as much.
 See also:

  * [FlexibleSpaceBarSettings] which creates a settings object that can be
    used to specify these settings to a [FlexibleSpaceBar].

## Return Type
`Widget`

## Parameters

- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
