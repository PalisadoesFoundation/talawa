# Method: `lastEntry`

## Description

The entry object of the last element in the queue.

 Each element of the queue has an associated [DoubleLinkedQueueEntry].

 Returns the entry object corresponding to the last element of the queue,
 or `null` if the queue is empty.

 The entry objects can also be accessed using [firstEntry],
 and they can be iterated using [DoubleLinkedQueueEntry.nextEntry] and
 [DoubleLinkedQueueEntry.previousEntry].

## Return Type
`DoubleLinkedQueueEntry&lt;E&gt;?`

