# Method: `scheduleFrame`

## Description

Requests that, at the next appropriate opportunity, the [onBeginFrame] and
 [onDrawFrame] callbacks be invoked.

 
 Calling this function forwards the call to the same function on the
 [PlatformDispatcher] singleton, so instead of calling it here, you should
 consider calling it on `WidgetsBinding.instance.platformDispatcher` instead (or, when
 `WidgetsBinding` isn't available, on [PlatformDispatcher.instance]). The
 reason this function forwards to the [PlatformDispatcher] is to provide
 convenience for applications that only use a single main window.
 

 See also:

 * [SchedulerBinding], the Flutter framework class which manages the
   scheduling of frames.

## Return Type
`void`

