# Method: `extendedAnimation`

## Description

Returns the animation that controls the [NavigationRail.extended] state.

 This can be used to synchronize animations in the [leading] or [trailing]
 widget, such as an animated menu or a [FloatingActionButton] animation.

 
 This example shows how to use this animation to create a [FloatingActionButton]
 that animates itself between the normal and extended states of the
 [NavigationRail].

 An instance of `MyNavigationRailFab` is created for [NavigationRail.leading].
 Pressing the FAB button toggles the "extended" state of the [NavigationRail].

 ** See code in examples/api/lib/material/navigation_rail/navigation_rail.extended_animation.0.dart **
 

## Return Type
`Animation&lt;double&gt;`

## Parameters

- `context`: `BuildContext`
