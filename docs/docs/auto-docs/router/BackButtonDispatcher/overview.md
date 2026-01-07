# Overview for `BackButtonDispatcher`

## Description

Report to a [Router] when the user taps the back button on platforms that
 support back buttons (such as Android).

 When [Router] widgets are nested, consider using a
 [ChildBackButtonDispatcher], passing it the parent [BackButtonDispatcher],
 so that the back button requests get dispatched to the appropriate [Router].
 To make this work properly, it's important that whenever a [Router] thinks
 it should get the back button messages (e.g. after the user taps inside it),
 it calls [takePriority] on its [BackButtonDispatcher] (or
 [ChildBackButtonDispatcher]) instance.

 The class takes a single callback, which must return a [Future&lt;bool&gt;]. The
 callback's semantics match [WidgetsBindingObserver.didPopRoute]'s, namely,
 the callback should return a future that completes to true if it can handle
 the pop request, and a future that completes to false otherwise.

## Dependencies

- _CallbackHookProvider

## Members

- **_children**: `LinkedHashSet&lt;ChildBackButtonDispatcher&gt;`
