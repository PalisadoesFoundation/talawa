# Overview for `DoubleLinkedQueue`

## Description

A [Queue] implementation based on a double-linked list.

 Allows constant time add, remove-at-ends and peek operations.

## Dependencies

- Iterable, Queue

## Members

- **_sentinel**: `_DoubleLinkedQueueSentinel&lt;E&gt;`
- **_elementCount**: `int`
## Constructors

### Unnamed Constructor


### from
Creates a double-linked queue containing all [elements].

 The element order in the queue is as if the elements were added using
 [addLast] in the order provided by [elements].iterator.

 All the [elements] should be instances of [E].
 The [elements] iterable itself may have any element type, so this
 constructor can be used to down-cast a [Queue], for example as:
 ```dart
 Queue&lt;SuperType&gt; superQueue = ...;
 Queue&lt;SubType&gt; subQueue =
     DoubleLinkedQueue&lt;SubType&gt;.from(superQueue.whereType&lt;SubType&gt;);
 ```

#### Parameters

- `elements`: `Iterable&lt;dynamic&gt;`
### of
Creates a double-linked queue from [elements].

 The element order in the queue is as if the elements were added using
 [addLast] in the order provided by [elements].iterator.

#### Parameters

- `elements`: `Iterable&lt;E&gt;`
