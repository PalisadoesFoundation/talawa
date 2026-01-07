# Overview for `ViewAnchor`

## Description

Decorates a [child] widget with a side [View].

 This widget must have a [View] ancestor, into which the [child] widget
 is rendered.

 Typically, a [View] or [ViewCollection] widget is used in the [view] slot to
 define the content of the side view(s). Those widgets may be wrapped in
 other non-[RenderObjectWidget]s (e.g. [InheritedWidget]s). However, no
 [RenderObjectWidget] is allowed to appear between the [ViewAnchor] and the
 next [View] widget in the [view] slot. The widgets in the [view] slot have
 access to all [InheritedWidget]s above the [ViewAnchor] in the tree.

 In technical terms, the [ViewAnchor] can only be used in a rendering zone of
 the widget tree and the [view] slot marks the start of a new non-rendering
 zone (see [WidgetsBinding] for a definition of these zones). Typically,
 it is occupied by a [View] widget, which will start a new rendering zone.

 
 An example use case for this widget is a tooltip for a button. The tooltip
 should be able to extend beyond the bounds of the main view. For this, the
 tooltip can be implemented as a separate [View], which is anchored to the
 button in the main view by wrapping that button with a [ViewAnchor]. In this
 example, the [view] slot is configured with the tooltip [View] and the
 [child] is the button widget rendered into the surrounding view.
 

## Dependencies

- StatelessWidget

## Members

- **view**: `Widget?`
  The widget that defines the view anchored to this widget.

 Typically, a [View] or [ViewCollection] widget is used, which may be
 wrapped in other non-[RenderObjectWidget]s (e.g. [InheritedWidget]s).

 

- **child**: `Widget`
  The widget below this widget in the tree.

 It is rendered into the surrounding view, not in the view defined by
 [view].

 

## Constructors

### Unnamed Constructor
Creates a [ViewAnchor] widget.

