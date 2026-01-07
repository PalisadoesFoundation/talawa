# Method: `maybeOf`

## Description

Returns the [RestorationBucket] inserted into the widget tree by the
 closest ancestor [RestorationScope] of `context`.

 
 To avoid accidentally overwriting data already stored in the bucket by its
 owner, data should not be stored directly in the bucket returned by this
 method. Instead, consider claiming a child bucket from the returned bucket
 (via [RestorationBucket.claimChild]) and store the restoration data in
 that child.
 

 This method returns null if state restoration is turned off for this
 subtree.

 Calling this method will create a dependency on the closest
 [RestorationScope] in the [context], if there is one.

 See also:

 * [RestorationScope.maybeOf], which is similar to this method, but asserts
   if no [RestorationScope] ancestor is found.

## Return Type
`RestorationBucket?`

## Parameters

- `context`: `BuildContext`
