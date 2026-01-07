# Method: `of`

## Description

The [PageStorageBucket] from the closest instance of a [PageStorage]
 widget that encloses the given context.

 If no ancestor is found, this method will assert in debug mode, and throw
 an exception in release mode.

 Typical usage is as follows:

 ```dart
 PageStorageBucket bucket = PageStorage.of(context);
 ```

 This method can be expensive (it walks the element tree).

 See also:

 * [PageStorage.maybeOf], which is similar to this method, but
   returns null if no [PageStorage] ancestor is found.

## Return Type
`PageStorageBucket`

## Parameters

- `context`: `BuildContext`
