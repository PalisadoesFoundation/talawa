# Overview for `RootBackButtonDispatcher`

## Description

The default implementation of back button dispatcher for the root router.

 This dispatcher listens to platform pop route notifications. When the
 platform wants to pop the current route, this dispatcher calls the
 [BackButtonDispatcher.invokeCallback] method to handle the request.

## Dependencies

- BackButtonDispatcher, WidgetsBindingObserver

## Constructors

### Unnamed Constructor
Create a root back button dispatcher.

