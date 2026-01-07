# Overview for `CupertinoScrollbar`

## Description

An iOS style scrollbar.

 To add a scrollbar to a [ScrollView], wrap the scroll view widget in
 a [CupertinoScrollbar] widget.

 

 

 When dragging a [CupertinoScrollbar] thumb, the thickness and radius will
 animate from [thickness] and [radius] to [thicknessWhileDragging] and
 [radiusWhileDragging], respectively.

 
 This sample shows a [CupertinoScrollbar] that fades in and out of view as scrolling occurs.
 The scrollbar will fade into view as the user scrolls, and fade out when scrolling stops.
 The `thickness` of the scrollbar will animate from 6 pixels to the `thicknessWhileDragging` of 10
 when it is dragged by the user. The `radius` of the scrollbar thumb corners will animate from 34
 to the `radiusWhileDragging` of 0 when the scrollbar is being dragged by the user.

 ** See code in examples/api/lib/cupertino/scrollbar/cupertino_scrollbar.0.dart **
 

 
 When [thumbVisibility] is true, the scrollbar thumb will remain visible without the
 fade animation. This requires that a [ScrollController] is provided to controller,
 or that the [PrimaryScrollController] is available.

 ** See code in examples/api/lib/cupertino/scrollbar/cupertino_scrollbar.1.dart **
 

 See also:

  * [ListView], which displays a linear, scrollable list of children.
  * [GridView], which displays a 2 dimensional, scrollable array of children.
  * [Scrollbar], a Material Design scrollbar.
  * [RawScrollbar], a basic scrollbar that fades in and out, extended
    by this class to add more animations and behaviors.

## Dependencies

- RawScrollbar

## Members

- **defaultThickness**: `double`
  Default value for [thickness] if it's not specified in [CupertinoScrollbar].

- **defaultThicknessWhileDragging**: `double`
  Default value for [thicknessWhileDragging] if it's not specified in
 [CupertinoScrollbar].

- **defaultRadius**: `Radius`
  Default value for [radius] if it's not specified in [CupertinoScrollbar].

- **defaultRadiusWhileDragging**: `Radius`
  Default value for [radiusWhileDragging] if it's not specified in
 [CupertinoScrollbar].

- **thicknessWhileDragging**: `double`
  The thickness of the scrollbar when it's being dragged by the user.

 When the user starts dragging the scrollbar, the thickness will animate
 from [thickness] to this value, then animate back when the user stops
 dragging the scrollbar.

- **radiusWhileDragging**: `Radius`
  The radius of the scrollbar edges when the scrollbar is being dragged by
 the user.

 When the user starts dragging the scrollbar, the radius will animate
 from [radius] to this value, then animate back when the user stops
 dragging the scrollbar.

## Constructors

### Unnamed Constructor
Creates an iOS style scrollbar that wraps the given [child].

 The [child] should be a source of [ScrollNotification] notifications,
 typically a [Scrollable] widget.

