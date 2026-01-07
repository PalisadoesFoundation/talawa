# Method: `maybeOf`

## Description

Finds the [ScaffoldState] from the closest instance of this class that
 encloses the given context.

 If no instance of this class encloses the given context, will return null.
 To throw an exception instead, use [of] instead of this function.

 This method can be expensive (it walks the element tree).

 See also:

  * [of], a similar function to this one that throws if no instance
    encloses the given context. Also includes some sample code in its
    documentation.

## Return Type
`ScaffoldState?`

## Parameters

- `context`: `BuildContext`
