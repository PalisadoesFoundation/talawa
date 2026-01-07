# Method: `clear`

## Description

Evicts all pending and keepAlive entries from the cache.

 This is useful if, for instance, the root asset bundle has been updated
 and therefore new images must be obtained.

 Images which have not finished loading yet will not be removed from the
 cache, and when they complete they will be inserted as normal.

 This method does not clear live references to images, since clearing those
 would not reduce memory pressure. Such images still have listeners in the
 application code, and will still remain resident in memory.

 To clear live references, use [clearLiveImages].

## Return Type
`void`

