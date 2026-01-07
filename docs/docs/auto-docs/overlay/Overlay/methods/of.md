# Method: `of`

## Description

The [OverlayState] from the closest instance of [Overlay] that encloses
 the given context within the closest [LookupBoundary], and, in debug mode,
 will throw if one is not found.

 In debug mode, if the `debugRequiredFor` argument is provided and an
 overlay isn't found, then this function will throw an exception containing
 the runtime type of the given widget in the error message. The exception
 attempts to explain that the calling [Widget] (the one given by the
 `debugRequiredFor` argument) needs an [Overlay] to be present to function.
 If `debugRequiredFor` is not supplied, then the error message is more
 generic.

 Typical usage is as follows:

 ```dart
 OverlayState overlay = Overlay.of(context);
 ```

 If `rootOverlay` is set to true, the state from the furthest instance of
 this class is given instead. Useful for installing overlay entries above
 all subsequent instances of [Overlay].

 This method can be expensive (it walks the element tree).

 See also:

 * [Overlay.maybeOf] for a similar function that returns null if an
   [Overlay] is not found.

## Return Type
`OverlayState`

## Parameters

- `context`: `BuildContext`
- ``: `dynamic`
- ``: `dynamic`
