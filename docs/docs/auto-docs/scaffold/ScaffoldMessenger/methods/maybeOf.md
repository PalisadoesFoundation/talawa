# Method: `maybeOf`

## Description

The state from the closest instance of this class that encloses the given
 context, if any.

 Will return null if a [ScaffoldMessenger] is not found in the given context.

 See also:

  * [of], which is a similar function, except that it will throw an
    exception if a [ScaffoldMessenger] is not found in the given context.

## Return Type
`ScaffoldMessengerState?`

## Parameters

- `context`: `BuildContext`
