# Overview for `PlatformViewLink`

## Description

Links a platform view with the Flutter framework.

 Provides common functionality for embedding a platform view (e.g an android.view.View on Android)
 with the Flutter framework.

 

 To implement a new platform view widget, return this widget in the `build` method.
 For example:

 ```dart
 class FooPlatformView extends StatelessWidget 
 ```

 The `surfaceFactory` and the `onCreatePlatformView` are only called when the
 state of this widget is initialized, or when the `viewType` changes.

## Dependencies

- StatefulWidget

## Members

- **_surfaceFactory**: `PlatformViewSurfaceFactory`
- **_onCreatePlatformView**: `CreatePlatformViewCallback`
- **viewType**: `String`
  The unique identifier for the view type to be embedded.

 Typically, this viewType has already been registered on the platform side.

## Constructors

### Unnamed Constructor
Construct a [PlatformViewLink] widget.

 See also:

  * [PlatformViewSurface] for details on the widget returned by `surfaceFactory`.
  * [PlatformViewCreationParams] for how each parameter can be used when implementing `createPlatformView`.

