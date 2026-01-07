# Method: `maybeOf`

## Description

The [OverlayState] from the closest instance of [Overlay] that encloses
 the given context within the closest [LookupBoundary], if any.

 Typical usage is as follows:

 ```dart
 OverlayState? overlay = Overlay.maybeOf(context);
 ```

 If `rootOverlay` is set to true, the state from the furthest instance of
 this class is given instead. Useful for installing overlay entries above
 all subsequent instances of [Overlay].

 This method can be expensive (it walks the element tree).

 See also:

  * [Overlay.of] for a similar function that returns a non-nullable result
    and throws if an [Overlay] is not found.

## Return Type
`OverlayState?`

## Parameters

- `context`: `BuildContext`
- ``: `dynamic`
