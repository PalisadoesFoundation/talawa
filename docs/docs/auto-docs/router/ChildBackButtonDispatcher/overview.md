# Overview for `ChildBackButtonDispatcher`

## Description

A variant of [BackButtonDispatcher] which listens to notifications from a
 parent back button dispatcher, and can take priority from its parent for the
 handling of such notifications.

 Useful when [Router]s are being nested within each other.

 Use [Router.of] to obtain a reference to the nearest ancestor [Router], from
 which the [Router.backButtonDispatcher] can be found, and then used as the
 [parent] of the [ChildBackButtonDispatcher].

## Dependencies

- BackButtonDispatcher

## Members

- **parent**: `BackButtonDispatcher`
  The back button dispatcher that this object will attempt to take priority
 over when [takePriority] is called.

 The parent must have a listener registered before this child object can
 have its [takePriority] or [deferTo] methods used.

## Constructors

### Unnamed Constructor
Creates a back button dispatcher that acts as the child of another.

