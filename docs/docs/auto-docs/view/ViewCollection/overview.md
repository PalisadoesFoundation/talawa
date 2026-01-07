# Overview for `ViewCollection`

## Description

A collection of sibling [View]s.

 This widget can only be used in places were a [View] widget is allowed, i.e.
 in a non-rendering zone of the widget tree. In practical terms, it can be
 used at the root of the widget tree outside of any [View] widget, as a child
 to a another [ViewCollection], or in the [ViewAnchor.view] slot of a
 [ViewAnchor] widget. It is not required to be a direct child of those
 widgets; other non-[RenderObjectWidget]s may appear in between the two (such
 as an [InheritedWidget]).

 Similarly, the [views] children of this widget must be [View]s, but they
 may be wrapped in additional non-[RenderObjectWidget]s (e.g.
 [InheritedWidget]s).

 See also:

  * [WidgetsBinding] for an explanation of rendering and non-rendering zones.

## Dependencies

- _MultiChildComponentWidget

## Constructors

### Unnamed Constructor
Creates a [ViewCollection] widget.

