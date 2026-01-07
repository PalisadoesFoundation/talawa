# Overview for `HoldScrollActivity`

## Description

A scroll activity that does nothing but can be released to resume
 normal idle behavior.

 This is used while the user is touching the [Scrollable] but before the
 touch has become a [Drag].

 For the purposes of [ScrollNotification]s, this activity does not constitute
 scrolling, and does not prevent the user from interacting with the contents
 of the [Scrollable] (unlike when a drag has begun or there is a scroll
 animation underway).

## Dependencies

- ScrollActivity, ScrollHoldController

## Members

- **onHoldCanceled**: `VoidCallback?`
  Called when [dispose] is called.

## Constructors

### Unnamed Constructor
Creates a scroll activity that does nothing.

