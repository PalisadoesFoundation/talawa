# Overview for `SingletonFlutterWindow`

## Description

Deprecated. Will be removed in a future version of Flutter.

 This class is deprecated to prepare for Flutter's upcoming support for
 multiple views and eventually multiple windows.

 This class has been split into two classes: [FlutterView] and
 [PlatformDispatcher]. A [FlutterView] gives an application access to
 view-specific functionality while the [PlatformDispatcher] contains
 platform-specific functionality that applies to all views.

 This class backs the global [window] singleton, which is also deprecated.
 See the docs on [window] for migration options.

 See also:

 * [FlutterView], which gives an application access to view-specific
   functionality.
 * [PlatformDispatcher], which gives an application access to
   platform-specific functionality.

## Dependencies

- FlutterView

## Constructors

### _


