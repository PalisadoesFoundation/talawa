# Method: `forEachEntry`

## Description

Calls [action] for each entry object of this double-linked queue.

 Each element of the queue has an associated [DoubleLinkedQueueEntry].
 This method iterates the entry objects from first to last and calls
 [action] with each object in turn.

 The entry objects can also be accessed using [firstEntry] and [lastEntry],
 and iterated using [DoubleLinkedQueueEntry.] and
 [DoubleLinkedQueueEntry.].

 The [action] function can use methods on [DoubleLinkedQueueEntry] to
 remove the entry or it can insert elements before or after the entry.
 If the current entry is removed, iteration continues with the entry that
 was following the current entry when [action] was called. Any elements
 inserted after the current element before it is removed will not be
 visited by the iteration.

## Return Type
`void`

## Parameters

- ``: `dynamic`
