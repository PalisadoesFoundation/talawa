# Overview for `FocusListenerContainer`

## Description

This widget listens for changes in the focus state of the subtree defined by
 its [child] widget, changing the border and color of the container it is in
 when it has focus.

 A [FocusListenerContainer] swaps out the [BorderSide] of a border around the
 child widget with [focusedSide], and the background color with
 [focusedColor], when a widget that is a descendant of this widget has focus.

## Dependencies

- StatefulWidget

## Members

- **border**: `OutlinedBorder?`
  This is the border that will be used when not focused, and which defines
 all the attributes except for the [OutlinedBorder.side] when focused.

- **focusedSide**: `BorderSide?`
  This is the [BorderSide] that will be used for [border] when the [child]
 subtree is focused.

- **focusedColor**: `Color?`
  This is the [Color] that will be used as the fill color for the background
 of the [child] when a descendant widget is focused.

- **padding**: `EdgeInsetsGeometry?`
  The padding around the inside of the container.

- **child**: `Widget`
  This is defines the subtree to listen to for focus changes.

## Constructors

### Unnamed Constructor


