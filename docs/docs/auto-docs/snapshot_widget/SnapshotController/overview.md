# Overview for `SnapshotController`

## Description

A controller for the [SnapshotWidget] that controls when the child image is displayed
 and when to regenerated the child image.

 When the value of [allowSnapshotting] is true, the [SnapshotWidget] will paint the child
 widgets based on the [SnapshotMode] of the snapshot widget.

 The controller notifies its listeners when the value of [allowSnapshotting] changes
 or when [clear] is called.

 To force [SnapshotWidget] to recreate the child image, call [clear].

## Dependencies

- ChangeNotifier

## Members

- **_allowSnapshotting**: `bool`
## Constructors

### Unnamed Constructor
Create a new [SnapshotController].

 By default, [allowSnapshotting] is `false` and cannot be `null`.

