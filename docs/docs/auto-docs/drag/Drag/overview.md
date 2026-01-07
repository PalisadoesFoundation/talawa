# Overview for `Drag`

## Description

Interface for objects that receive updates about drags.

 This interface is used in various ways. For example,
 [MultiDragGestureRecognizer] uses it to update its clients when it
 recognizes a gesture. Similarly, the scrolling infrastructure in the widgets
 library uses it to notify the [DragScrollActivity] when the user drags the
 scrollable.

