# Method: `shouldRepaint`

## Description

Called whenever a new instance of the snapshot widget delegate class is
 provided to the [SnapshotWidget] object, or any time that a new
 [SnapshotPainter] object is created with a new instance of the
 delegate class (which amounts to the same thing, because the latter is
 implemented in terms of the former).

 If the new instance represents different information than the old
 instance, then the method should return true, otherwise it should return
 false.

 If the method returns false, then the [paint] call might be optimized
 away.

 It's possible that the [paint] method will get called even if
 [shouldRepaint] returns false (e.g. if an ancestor or descendant needed to
 be repainted). It's also possible that the [paint] method will get called
 without [shouldRepaint] being called at all (e.g. if the box changes
 size).

 Changing the delegate will not cause the child image retained by the
 [SnapshotWidget] to be updated. Instead, [SnapshotController.clear] can
 be used to force the generation of a new image.

 The `oldPainter` argument will never be null.

## Return Type
`bool`

## Parameters

- `oldPainter`: `SnapshotPainter`
