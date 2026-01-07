# Overview for `AppKitView`

## Description

Widget that contains a macOS AppKit view.

 Embedding macOS views is an expensive operation and should be avoided where
 a Flutter equivalent is possible.

 The platform view's lifetime is the same as the lifetime of the [State]
 object for this widget. When the [State] is disposed the platform view (and
 auxiliary resources) are lazily released (some resources are immediately
 released and some by platform garbage collector). A stateful widget's state
 is disposed when the widget is removed from the tree or when it is moved
 within the tree. If the stateful widget has a key and it's only moved
 relative to its siblings, or it has a [GlobalKey] and it's moved within the
 tree, it will not be disposed.

 Construction of AppKitViews is done asynchronously, before the underlying
 NSView is ready this widget paints nothing while maintaining the same
 layout constraints.

## Dependencies

- _DarwinView

## Constructors

### Unnamed Constructor
Creates a widget that embeds a macOS AppKit NSView.

