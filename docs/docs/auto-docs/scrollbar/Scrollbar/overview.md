# Overview for `Scrollbar`

## Description

A Material Design scrollbar.

 To add a scrollbar to a [ScrollView], wrap the scroll view
 widget in a [Scrollbar] widget.

 

 

 Dynamically changes to a [CupertinoScrollbar], an iOS style scrollbar, by
 default on the iOS platform.

 The color of the Scrollbar thumb will change when [WidgetState.dragged],
 or [WidgetState.hovered] on desktop and web platforms. These stateful
 color choices can be changed using [ScrollbarThemeData.thumbColor].

 
 This sample shows a [Scrollbar] that executes a fade animation as scrolling
 occurs. The Scrollbar will fade into view as the user scrolls, and fade out
 when scrolling stops.

 ** See code in examples/api/lib/material/scrollbar/scrollbar.0.dart **
 

 
 When [thumbVisibility] is true, the scrollbar thumb will remain visible
 without the fade animation. This requires that a [ScrollController] is
 provided to controller, or that the [PrimaryScrollController] is available.

 When a [ScrollView.scrollDirection] is [Axis.horizontal], it is recommended
 that the [Scrollbar] is always visible, since scrolling in the horizontal
 axis is less discoverable.

 ** See code in examples/api/lib/material/scrollbar/scrollbar.1.dart **
 

 A scrollbar track can be added using [trackVisibility]. This can also be
 drawn when triggered by a hover event, or based on any [WidgetState] by
 using [ScrollbarThemeData.trackVisibility].

 The [thickness] of the track and scrollbar thumb can be changed dynamically
 in response to [WidgetState]s using [ScrollbarThemeData.thickness].

 See also:

  * [RawScrollbar], a basic scrollbar that fades in and out, extended
    by this class to add more animations and behaviors.
  * [ScrollbarTheme], which configures the Scrollbar's appearance.
  * [CupertinoScrollbar], an iOS style scrollbar.
  * [ListView], which displays a linear, scrollable list of children.
  * [GridView], which displays a 2 dimensional, scrollable array of children.

## Dependencies

- StatelessWidget

## Members

- **child**: `Widget`
  

- **controller**: `ScrollController?`
  

- **thumbVisibility**: `bool?`
  

 If this property is null, then [ScrollbarThemeData.thumbVisibility] of
 [ThemeData.scrollbarTheme] is used. If that is also null, the default value
 is false.

 If the thumb visibility is related to the scrollbar's material state,
 use the global [ScrollbarThemeData.thumbVisibility] or override the
 sub-tree's theme data.

- **trackVisibility**: `bool?`
  

 If this property is null, then [ScrollbarThemeData.trackVisibility] of
 [ThemeData.scrollbarTheme] is used. If that is also null, the default value
 is false.

 If the track visibility is related to the scrollbar's material state,
 use the global [ScrollbarThemeData.trackVisibility] or override the
 sub-tree's theme data.

- **thickness**: `double?`
  The thickness of the scrollbar in the cross axis of the scrollable.

 If null, the default value is platform dependent. On [TargetPlatform.android],
 the default thickness is 4.0 pixels. On [TargetPlatform.iOS],
 [CupertinoScrollbar.defaultThickness] is used. The remaining platforms have a
 default thickness of 8.0 pixels.

- **radius**: `Radius?`
  The [Radius] of the scrollbar thumb's rounded rectangle corners.

 If null, the default value is platform dependent. On [TargetPlatform.android],
 no radius is applied to the scrollbar thumb. On [TargetPlatform.iOS],
 [CupertinoScrollbar.defaultRadius] is used. The remaining platforms have a
 default [Radius.circular] of 8.0 pixels.

- **interactive**: `bool?`
  

- **notificationPredicate**: `ScrollNotificationPredicate?`
  

- **scrollbarOrientation**: `ScrollbarOrientation?`
  

## Constructors

### Unnamed Constructor
Creates a Material Design scrollbar that by default will connect to the
 closest Scrollable descendant of [child].

 The [child] should be a source of [ScrollNotification] notifications,
 typically a [Scrollable] widget.

 If the [controller] is null, the default behavior is to
 enable scrollbar dragging using the [PrimaryScrollController].

 When null, [thickness] defaults to 8.0 pixels on desktop and web, and 4.0
 pixels when on mobile platforms. A null [radius] will result in a default
 of an 8.0 pixel circular radius about the corners of the scrollbar thumb,
 except for when executing on [TargetPlatform.android], which will render the
 thumb without a radius.

