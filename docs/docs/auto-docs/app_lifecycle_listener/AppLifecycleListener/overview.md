# Overview for `AppLifecycleListener`

## Description

A listener that can be used to listen to changes in the application
 lifecycle.

 To listen for requests for the application to exit, and to decide whether or
 not the application should exit when requested, create an
 [AppLifecycleListener] and set the [onExitRequested] callback.

 To listen for changes in the application lifecycle state, define an
 [onStateChange] callback. See the [AppLifecycleState] enum for details on
 the various states.

 The [onStateChange] callback is called for each state change, and the
 individual state transitions ([onResume], [onInactive], etc.) are also
 called if the state transition they represent occurs.

 State changes will occur in accordance with the state machine described by
 this diagram:

 ![Diagram of the application lifecycle defined by the AppLifecycleState enum](
 https://flutter.github.io/assets-for-api-docs/assets/dart-ui/app_lifecycle.png)

 The initial state of the state machine is the [AppLifecycleState.detached]
 state, and the arrows describe valid state transitions. Transitions in blue
 are transitions that only happen on iOS and Android.

 
 This example shows how an application can listen to changes in the
 application state.

 ** See code in examples/api/lib/widgets/app_lifecycle_listener/app_lifecycle_listener.0.dart **
 

 
 This example shows how an application can optionally decide to abort a
 request for exiting instead of obeying the request.

 ** See code in examples/api/lib/widgets/app_lifecycle_listener/app_lifecycle_listener.1.dart **
 

 See also:

 * [ServicesBinding.exitApplication] for a function to call that will request
   that the application exits.
 * [WidgetsBindingObserver.didRequestAppExit] for the handler which this
   class uses to receive exit requests.
 * [WidgetsBindingObserver.didChangeAppLifecycleState] for the handler which
   this class uses to receive lifecycle state changes.

## Dependencies

- WidgetsBindingObserver, Diagnosticable

## Members

- **_lifecycleState**: `AppLifecycleState?`
- **binding**: `WidgetsBinding`
  The [WidgetsBinding] to listen to for application lifecycle events.

 Typically, this is set to [WidgetsBinding.instance], but may be
 substituted for testing or other specialized bindings.

 Defaults to [WidgetsBinding.instance].

- **onStateChange**: `ValueChanged&lt;AppLifecycleState&gt;?`
  Called anytime the state changes, passing the new state.

- **onInactive**: `VoidCallback?`
  A callback that is called when the application loses input focus.

 On mobile platforms, this can be during a phone call or when a system
 dialog is visible.

 On desktop platforms, this is when all views in an application have lost
 input focus but at least one view of the application is still visible.

 On the web, this is when the window (or tab) has lost input focus.

- **onResume**: `VoidCallback?`
  A callback that is called when a view in the application gains input
 focus.

 A call to this callback indicates that the application is entering a state
 where it is visible, active, and accepting user input.

- **onHide**: `VoidCallback?`
  A callback that is called when the application is hidden.

 On mobile platforms, this is usually just before the application is
 replaced by another application in the foreground.

 On desktop platforms, this is just before the application is hidden by
 being minimized or otherwise hiding all views of the application.

 On the web, this is just before a window (or tab) is hidden.

- **onShow**: `VoidCallback?`
  A callback that is called when the application is shown.

 On mobile platforms, this is usually just before the application replaces
 another application in the foreground.

 On desktop platforms, this is just before the application is shown after
 being minimized or otherwise made to show at least one view of the
 application.

 On the web, this is just before a window (or tab) is shown.

- **onPause**: `VoidCallback?`
  A callback that is called when the application is paused.

 On mobile platforms, this happens right before the application is replaced
 by another application.

 On desktop platforms and the web, this function is not called.

- **onRestart**: `VoidCallback?`
  A callback that is called when the application is resumed after being
 paused.

 On mobile platforms, this happens just before this application takes over
 as the active application.

 On desktop platforms and the web, this function is not called.

- **onExitRequested**: `AppExitRequestCallback?`
  A callback used to ask the application if it will allow exiting the
 application for cases where the exit is cancelable.

 Exiting the application isn't always cancelable, but when it is, this
 function will be called before exit occurs.

 Responding [AppExitResponse.exit] will continue termination, and
 responding [AppExitResponse.cancel] will cancel it. If termination is not
 canceled, the application will immediately exit.

- **onDetach**: `VoidCallback?`
  A callback that is called when an application has exited, and detached all
 host views from the engine.

 This callback is only called on iOS and Android.

- **_debugDisposed**: `bool`
## Constructors

### Unnamed Constructor
Creates an [AppLifecycleListener].

