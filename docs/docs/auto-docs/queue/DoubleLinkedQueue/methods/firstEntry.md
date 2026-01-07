# Method: `firstEntry`

## Description

The entry object of the first element in the queue.

 Each element of the queue has an associated [DoubleLinkedQueueEntry].

 Returns the entry object corresponding to the first element of the queue,
 or `null` if the queue is empty.

 The entry objects can also be accessed using [lastEntry],
 and they can be iterated using [DoubleLinkedQueueEntry.nextEntry] and
 [DoubleLinkedQueueEntry.previousEntry].

## Return Type
`DoubleLinkedQueueEntry&lt;E&gt;?`

