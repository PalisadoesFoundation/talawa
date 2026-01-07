# Overview for `PlatformViewSurface`

## Description

Integrates a platform view with Flutter's compositor, touch, and semantics subsystems.

 The compositor integration is done by adding a [PlatformViewLayer] to the layer tree. [PlatformViewSurface]
 isn't supported on all platforms (e.g on Android platform views can be composited by using a [TextureLayer] or
 [AndroidViewSurface]).
 Custom Flutter embedders can support [PlatformViewLayer]s by implementing a SystemCompositor.

 The widget fills all available space, the parent of this object must provide bounded layout
 constraints.

 If the associated platform view is not created the [PlatformViewSurface] does not paint any contents.

 See also:

  * [AndroidView] which embeds an Android platform view in the widget hierarchy using a [TextureLayer].
  * [UiKitView] which embeds an iOS platform view in the widget hierarchy.

## Dependencies

- LeafRenderObjectWidget

## Members

- **controller**: `PlatformViewController`
  The controller for the platform view integrated by this [PlatformViewSurface].

 [PlatformViewController] is used for dispatching touch events to the platform view.
 [PlatformViewController.viewId] identifies the platform view whose contents are painted by this widget.

- **gestureRecognizers**: `Set&lt;Factory&lt;OneSequenceGestureRecognizer&gt;&gt;`
  Which gestures should be forwarded to the PlatformView.

 

 For example, with the following setup vertical drags will not be dispatched to the platform view
 as the vertical drag gesture is claimed by the parent [GestureDetector].

 ```dart
 GestureDetector(
   onVerticalDragStart: (DragStartDetails details) ,
   child: PlatformViewSurface(
     gestureRecognizers: const <Factory&lt;OneSequenceGestureRecognizer>&gt;,
     controller: _controller,
     hitTestBehavior: PlatformViewHitTestBehavior.opaque,
   ),
 )
 ```

 To get the [PlatformViewSurface] to claim the vertical drag gestures we can pass a vertical drag
 gesture recognizer factory in [gestureRecognizers] e.g:

 ```dart
 GestureDetector(
   onVerticalDragStart: (DragStartDetails details) ,
   child: SizedBox(
     width: 200.0,
     height: 100.0,
     child: PlatformViewSurface(
       gestureRecognizers: <Factory&lt;OneSequenceGestureRecognizer>&gt;,
       controller: _controller,
       hitTestBehavior: PlatformViewHitTestBehavior.opaque,
     ),
   ),
 )
 ```

 

- **hitTestBehavior**: `PlatformViewHitTestBehavior`
  

## Constructors

### Unnamed Constructor
Construct a [PlatformViewSurface].

