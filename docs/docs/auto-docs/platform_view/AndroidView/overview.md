# Overview for `AndroidView`

## Description

Embeds an Android view in the Widget hierarchy.

 Requires Android API level 23 or greater.

 Embedding Android views is an expensive operation and should be avoided when a Flutter
 equivalent is possible.

 The embedded Android view is painted just like any other Flutter widget and transformations
 apply to it as well.

 
 The widget fills all available space, the parent of this object must provide bounded layout
 constraints.
 

 
 The widget participates in Flutter's gesture arenas, and dispatches touch events to the
 platform view iff it won the arena. Specific gestures that should be dispatched to the platform
 view can be specified in the `gestureRecognizers` constructor parameter. If
 the set of gesture recognizers is empty, a gesture will be dispatched to the platform
 view iff it was not claimed by any other gesture recognizer.
 

 The Android view object is created using a [PlatformViewFactory](..//javadoc/io/flutter/plugin/platform/PlatformViewFactory.md).
 Plugins can register platform view factories with [PlatformViewRegistry#registerViewFactory](..//javadoc/io/flutter/plugin/platform/PlatformViewRegistry#registerViewFactory-java.lang.String-io.flutter.plugin.platform.PlatformViewFactory-.md).

 Registration is typically done in the plugin's registerWith method, e.g:

 ```java
   public static void registerWith(Registrar registrar) 
 ```

 
 The platform view's lifetime is the same as the lifetime of the [State] object for this widget.
 When the [State] is disposed the platform view (and auxiliary resources) are lazily
 released (some resources are immediately released and some by platform garbage collector).
 A stateful widget's state is disposed when the widget is removed from the tree or when it is
 moved within the tree. If the stateful widget has a key and it's only moved relative to its siblings,
 or it has a [GlobalKey] and it's moved within the tree, it will not be disposed.
 

## Dependencies

- StatefulWidget

## Members

- **viewType**: `String`
  The unique identifier for Android view type to be embedded by this widget.

 A [PlatformViewFactory](..//javadoc/io/flutter/plugin/platform/PlatformViewFactory.md)
 for this type must have been registered.

 See also:

  * [AndroidView] for an example of registering a platform view factory.

- **onPlatformViewCreated**: `PlatformViewCreatedCallback?`
  
 Callback to invoke after the platform view has been created.

 May be null.
 

- **hitTestBehavior**: `PlatformViewHitTestBehavior`
  
 How this widget should behave during hit testing.

 This defaults to [PlatformViewHitTestBehavior.opaque].
 

- **layoutDirection**: `TextDirection?`
  
 The text direction to use for the embedded view.

 If this is null, the ambient [Directionality] is used instead.
 

- **gestureRecognizers**: `Set&lt;Factory&lt;OneSequenceGestureRecognizer&gt;&gt;?`
  Which gestures should be forwarded to the Android view.

 
 The gesture recognizers built by factories in this set participate in the gesture arena for
 each pointer that was put down on the widget. If any of these recognizers win the
 gesture arena, the entire pointer event sequence starting from the pointer down event
 will be dispatched to the platform view.

 When null, an empty set of gesture recognizer factories is used, in which case a pointer event sequence
 will only be dispatched to the platform view if no other member of the arena claimed it.
 

 For example, with the following setup vertical drags will not be dispatched to the Android
 view as the vertical drag gesture is claimed by the parent [GestureDetector].

 ```dart
 GestureDetector(
   onVerticalDragStart: (DragStartDetails d) ,
   child: const AndroidView(
     viewType: 'webview',
   ),
 )
 ```

 To get the [AndroidView] to claim the vertical drag gestures we can pass a vertical drag
 gesture recognizer factory in [gestureRecognizers] e.g:

 ```dart
 GestureDetector(
   onVerticalDragStart: (DragStartDetails details) ,
   child: SizedBox(
     width: 200.0,
     height: 100.0,
     child: AndroidView(
       viewType: 'webview',
       gestureRecognizers: <Factory&lt;OneSequenceGestureRecognizer>&gt;,
     ),
   ),
 )
 ```

 
 A platform view can be configured to consume all pointers that were put
 down in its bounds by passing a factory for an [EagerGestureRecognizer] in
 [gestureRecognizers]. [EagerGestureRecognizer] is a special gesture
 recognizer that immediately claims the gesture after a pointer down event.

 The [gestureRecognizers] property must not contain more than one factory
 with the same [Factory.type].

 Changing [gestureRecognizers] results in rejection of any active gesture
 arenas (if the platform view is actively participating in an arena).
 

- **creationParams**: `dynamic`
  Passed as the args argument of [PlatformViewFactory#create](..//javadoc/io/flutter/plugin/platform/PlatformViewFactory#create-android.content.Context-int-java.lang.Object-.md)

 This can be used by plugins to pass constructor parameters to the embedded Android view.

- **creationParamsCodec**: `MessageCodec&lt;dynamic&gt;?`
  The codec used to encode `creationParams` before sending it to the
 platform side. It should match the codec passed to the constructor of [PlatformViewFactory](..//javadoc/io/flutter/plugin/platform/PlatformViewFactory#PlatformViewFactory-io.flutter.plugin.common.MessageCodec-.md).

 This is typically one of: [StandardMessageCodec], [JSONMessageCodec], [StringCodec], or [BinaryCodec].

 This must not be null if [creationParams] is not null.

- **clipBehavior**: `Clip`
  

 Defaults to [Clip.hardEdge].

## Constructors

### Unnamed Constructor
Creates a widget that embeds an Android view.

 
 If `creationParams` is not null then `creationParamsCodec` must not be null.
 

