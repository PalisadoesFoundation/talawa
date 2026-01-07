# Method: `maybeOf`

## Description

The [PageStorageBucket] from the closest instance of a [PageStorage]
 widget that encloses the given context.

 Returns null if none exists.

 Typical usage is as follows:

 ```dart
 PageStorageBucket? bucket = PageStorage.of(context);
 ```

 This method can be expensive (it walks the element tree).

 See also:

 * [PageStorage.of], which is similar to this method, but
   asserts if no [PageStorage] ancestor is found.

## Return Type
`PageStorageBucket?`

## Parameters

- `context`: `BuildContext`
