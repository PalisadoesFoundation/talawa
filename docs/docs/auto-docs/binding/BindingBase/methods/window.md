# Method: `window`

## Description

Deprecated. Will be removed in a future version of Flutter.

 This property has been deprecated to prepare for Flutter's upcoming
 support for multiple views and multiple windows.

 It represents the main view for applications where there is only one
 view, such as applications designed for single-display mobile devices.
 If the embedder supports multiple views, it points to the first view
 created which is assumed to be the main view. It throws if no view has
 been created yet or if the first view has been removed again.

 The following options exists to migrate code that relies on accessing
 this deprecated property:

 If a [BuildContext] is available, consider looking up the current
 [FlutterView] associated with that context via [View.of]. It gives access
 to the same functionality as this deprecated property. However, the
 platform-specific functionality has moved to the [PlatformDispatcher],
 which may be accessed from the view returned by [View.of] via
 [FlutterView.platformDispatcher]. Using [View.of] with a [BuildContext] is
 the preferred option to migrate away from this deprecated [window]
 property.

 If no context is available to look up a [FlutterView], the
 [platformDispatcher] exposed by this binding can be used directly for
 platform-specific functionality. It also maintains a list of all available
 [FlutterView]s in [PlatformDispatcher.views] to access view-specific
 functionality without a context.

 See also:

 * [View.of] to access view-specific functionality on the [FlutterView]
   associated with the provided [BuildContext].
 * [FlutterView.platformDispatcher] to access platform-specific
   functionality from a given [FlutterView].
 * [platformDispatcher] on this binding to access the [PlatformDispatcher],
   which provides platform-specific functionality.

## Return Type
`ui.SingletonFlutterWindow`

