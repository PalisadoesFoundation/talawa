# Overview for `SizeChangedLayoutNotification`

## Description

Indicates that the size of one of the descendants of the object receiving
 this notification has changed, and that therefore any assumptions about that
 layout are no longer valid.

 For example, sent by the [SizeChangedLayoutNotifier] widget whenever that
 widget changes size.

 This notification can be used for triggering repaints, but if you use this
 notification to trigger rebuilds or relayouts, you'll create a backwards
 dependency in the frame pipeline because [SizeChangedLayoutNotification]s
 are generated during layout, which is after the build phase and in the
 middle of the layout phase. This backwards dependency can lead to visual
 corruption or lags.

 See [LayoutChangedNotification] for additional discussion of layout
 notifications such as this one.

 See also:

  * [SizeChangedLayoutNotifier], which sends this notification.
  * [LayoutChangedNotification], of which this is a subclass.

## Dependencies

- LayoutChangedNotification

## Constructors

### Unnamed Constructor
Create a new [SizeChangedLayoutNotification].

