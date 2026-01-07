# Method: `of`

## Description

Finds the [ExpansibleController] for the closest [Expansible] instance
 that encloses the given context.

 If no [Expansible] encloses the given context, calling this
 method will cause an assert in debug mode, and throw an
 exception in release mode.

 To return null if there is no [Expansible] use [maybeOf] instead.

 Typical usage of the [ExpansibleController.of] function is to call it from
 within the `build` method of a descendant of an [Expansible].

## Return Type
`ExpansibleController`

## Parameters

- `context`: `BuildContext`
