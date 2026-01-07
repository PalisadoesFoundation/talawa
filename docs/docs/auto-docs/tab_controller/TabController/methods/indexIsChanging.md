# Method: `indexIsChanging`

## Description

True while we're animating from [previousIndex] to [index] as a
 consequence of calling [animateTo].

 This value is true during the [animateTo] animation that's triggered when
 the user taps a [TabBar] tab. It is false when [offset] is changing as a
 consequence of the user dragging (and "flinging") the [TabBarView].

## Return Type
`bool`

