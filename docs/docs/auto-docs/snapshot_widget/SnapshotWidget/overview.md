# Overview for `SnapshotWidget`

## Description

A widget that can replace its child with a snapshotted version of the child.

 A snapshot is a frozen texture-backed representation of all child pictures
 and layers stored as a [ui.Image].

 This widget is useful for performing short animations that would otherwise
 be expensive or that cannot rely on raster caching. For example, scale and
 skew animations are often expensive to perform on complex children, as are
 blurs. For a short animation, a widget that contains these expensive effects
 can be replaced with a snapshot of itself and manipulated instead.

 For example, the Android Q [ZoomPageTransitionsBuilder] uses a snapshot widget
 for the forward and entering route to avoid the expensive scale animation.
 This also has the effect of briefly pausing any animations on the page.

 Generally, this widget should not be used in places where users expect the
 child widget to continue animating or to be responsive, such as an unbounded
 animation.

 Caveats:

 * The contents of platform views cannot be captured by a snapshot
   widget. If a platform view is encountered, then the snapshot widget will
   determine how to render its children based on the [SnapshotMode]. This
   defaults to [SnapshotMode.normal] which will throw an exception if a
   platform view is encountered.

 * On the CanvasKit backend of Flutter, the performance of using this widget may regress
   performance due to the fact that both the UI and engine share a single thread.

## Dependencies

- SingleChildRenderObjectWidget

## Members

- **controller**: `SnapshotController`
  The controller that determines when to display the children as a snapshot.

- **mode**: `SnapshotMode`
  Configuration that controls how the snapshot widget decides to paint its children.

 Defaults to [SnapshotMode.normal], which throws an error when a platform view
 or texture view is encountered.

 See [SnapshotMode] for more information.

- **autoresize**: `bool`
  Whether or not changes in render object size should automatically re-create
 the snapshot.

 Defaults to false.

- **painter**: `SnapshotPainter`
  The painter used to paint the child snapshot or child widgets.

## Constructors

### Unnamed Constructor
Create a new [SnapshotWidget].

 The [controller] and [child] arguments are required.

