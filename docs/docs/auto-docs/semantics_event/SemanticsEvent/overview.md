# Overview for `SemanticsEvent`

## Description

An event sent by the application to notify interested listeners that
 something happened to the user interface (e.g. a view scrolled).

 These events are usually interpreted by assistive technologies to give the
 user additional clues about the current state of the UI.

## Members

- **type**: `String`
  The type of this event.

 The type is used by the engine to translate this event into the
 appropriate native event (`UIAccessibility*Notification` on iOS and
 `AccessibilityEvent` on Android).

## Constructors

### Unnamed Constructor
Initializes internal fields.

 [type] is a string that identifies this class of [SemanticsEvent]s.

