# Overview for `Queue`

## Description

A [Queue] is a collection that can be manipulated at both ends. One
 can iterate over the elements of a queue through [forEach] or with
 an [Iterator].

 It is generally not allowed to modify the queue (add or remove entries)
 while an operation in the queue is being performed, for example during a
 call to [forEach].
 Modifying the queue while it is being iterated will most likely break the
 iteration.
 This goes both for using the [iterator] directly, or for iterating an
 `Iterable` returned by a method like [map] or [where].

 Example:
 ```dart
 final queue = Queue&lt;int&gt;; //  by default
 print(queue.runtimeType); // ListQueue

 // Adding items to queue
 queue.addAll([1, 2, 3]);
 queue.addFirst(0);
 queue.addLast(10);
 print(queue); // 

 // Removing items from queue
 queue.;
 queue.;
 print(queue); // 
 ```

## Dependencies

- Iterable, _QueueIterable

## Constructors

### Unnamed Constructor
Creates a queue.

### from
Creates a queue containing all [elements].

 The element order in the queue is as if the elements were added using
 [addLast] in the order provided by [elements].iterator.

 All the [elements] should be instances of [E].
 The `elements` iterable itself may have any element type, so this
 constructor can be used to down-cast a `Queue`, for example as:
 ```dart
 Queue&lt;SuperType&gt; superQueue = ...;
 Queue&lt;SubType&gt; subQueue =
     Queue&lt;SubType&gt;.from(superQueue.whereType&lt;SubType&gt;);
 ```

#### Parameters

- `elements`: `Iterable`
### of
Creates a queue from [elements].

 The element order in the queue is as if the elements were added using
 [addLast] in the order provided by [elements].iterator.

#### Parameters

- `elements`: `Iterable&lt;E&gt;`
