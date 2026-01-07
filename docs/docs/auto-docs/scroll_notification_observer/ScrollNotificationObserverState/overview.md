# Overview for `ScrollNotificationObserverState`

## Description

The listener list state for a [ScrollNotificationObserver] returned by
 [ScrollNotificationObserver.of].

 [ScrollNotificationObserver] is similar to
 [NotificationListener]. It supports a listener list instead of
 just a single listener and its listeners run unconditionally, they
 do not require a gating boolean return value.

## Dependencies

- State

## Members

- **_listeners**: `LinkedList&lt;_ListenerEntry&gt;?`
