# Overview for `PreferredSizeWidget`

## Description

An interface for widgets that can return the size this widget would prefer
 if it were otherwise unconstrained.

 There are a few cases, notably [AppBar] and [TabBar], where it would be
 undesirable for the widget to constrain its own size but where the widget
 needs to expose a preferred or "default" size. For example a primary
 [Scaffold] sets its app bar height to the app bar's preferred height
 plus the height of the system status bar.

 Widgets that need to know the preferred size of their child can require
 that their child implement this interface by using this class rather
 than [Widget] as the type of their `child` property.

 Use [PreferredSize] to give a preferred size to an arbitrary widget.

## Dependencies

- Widget

