# Overview for `NavigationNotification`

## Description

A notification that a change in navigation has taken place.

 Specifically, this notification indicates that at least one of the following
 has occurred:

  * That route stack of a [Navigator] has changed in any way.
  * The ability to pop has changed, such as controlled by [PopScope].

## Dependencies

- Notification

## Members

- **canHandlePop**: `bool`
  Indicates that the originator of this [Notification] is capable of
 handling a navigation pop.

## Constructors

### Unnamed Constructor
Creates a notification that some change in navigation has happened.

