# Overview for `AnnounceSemanticsEvent`

## Description

An event for a semantic announcement.

 This should be used for announcement that are not seamlessly announced by
 the system as a result of a UI state change.

 For example a camera application can use this method to make accessibility
 announcements regarding objects in the viewfinder.

 When possible, prefer using mechanisms like [Semantics] to implicitly
 trigger announcements over using this event.

 ### Android
 Android has [deprecated announcement events][1] due to its disruptive
 behavior with TalkBack forcing it to clear its speech queue and speak the
 provided text. Instead, use mechanisms like [Semantics] to implicitly
 trigger announcements.

 [1]: https://developer.android.com/reference/android/view/View#announceForAccessibility(java.lang.CharSequence)

## Dependencies

- SemanticsEvent

## Members

- **message**: `String`
  The message to announce.

- **textDirection**: `TextDirection`
  Text direction for [message].

- **assertiveness**: `Assertiveness`
  Determines whether the announcement should interrupt any existing announcement,
 or queue after it.

 On the web this option uses the aria-live level to set the assertiveness
 of the announcement. On iOS, Android, Windows, Linux, macOS, and Fuchsia
 this option currently has no effect.

## Constructors

### Unnamed Constructor
Constructs an event that triggers an announcement by the platform.

