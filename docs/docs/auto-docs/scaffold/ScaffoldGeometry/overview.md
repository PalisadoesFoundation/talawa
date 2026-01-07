# Overview for `ScaffoldGeometry`

## Description

Geometry information for [Scaffold] components after layout is finished.

 To get a [ValueNotifier] for the scaffold geometry of a given
 [BuildContext], use [Scaffold.geometryOf].

 The ScaffoldGeometry is only available during the paint phase, because
 its value is computed during the animation and layout phases prior to painting.

 For an example of using the [ScaffoldGeometry], see the [BottomAppBar],
 which uses the [ScaffoldGeometry] to paint a notch around the
 [FloatingActionButton].

 For information about the [Scaffold]'s geometry that is used while laying
 out the [FloatingActionButton], see [ScaffoldPrelayoutGeometry].

## Members

- **bottomNavigationBarTop**: `double?`
  The distance from the [Scaffold]'s top edge to the top edge of the
 rectangle in which the [Scaffold.bottomNavigationBar] bar is laid out.

 Null if [Scaffold.bottomNavigationBar] is null.

- **floatingActionButtonArea**: `Rect?`
  The [Scaffold.floatingActionButton]'s bounding rectangle.

 This is null when there is no floating action button showing.

## Constructors

### Unnamed Constructor
Create an object that describes the geometry of a [Scaffold].

