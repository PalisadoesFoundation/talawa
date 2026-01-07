# Method: `respond`

## Description

Method that the framework/app can call to respond to the native event
 that triggered this [PointerData].

 The parameter [allowPlatformDefault] allows the platform to perform the
 default action associated with the native event when it's set to `true`.

 This method can be called any number of times, but once `allowPlatformDefault`
 is set to `true`, it can't be set to `false` again.

 If `allowPlatformDefault` is never set to `true`, the Flutter engine will
 consume the event, so it won't be seen by the platform. In the web, this
 means that `preventDefault` will be called in the DOM event that triggered
 the `PointerData`. See [Event:  method in MDN][EpDmiMDN].

 The implementation of this method is configured through the `onRespond`
 parameter of the [PointerData] constructor.

 See also [PointerDataRespondCallback].

 [EpDmiMDN]: https://developer.mozilla.org/en-US/docs/Web/API/Event/preventDefault

## Return Type
`void`

## Parameters

- ``: `dynamic`
