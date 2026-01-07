# Method: `maybeOf`

## Description

Finds the [Expansible] from the closest instance of this class that
 encloses the given context and returns its [ExpansibleController].

 If no [Expansible] encloses the given context then return null.
 To throw an exception instead, use [of] instead of this function.

 See also:

  * [of], a similar function to this one that throws if no [Expansible]
    encloses the given context.

## Return Type
`ExpansibleController?`

## Parameters

- `context`: `BuildContext`
