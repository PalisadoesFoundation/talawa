# Overview for `ListQueue`

## Description

List based [Queue].

 Keeps a cyclic buffer of elements, and grows to a larger buffer when
 it fills up. This guarantees constant time peek and remove operations, and
 amortized constant time add operations.

 The structure is efficient for any queue or stack usage.

 Example:
 ```dart
 final queue = ListQueue&lt;int&gt;;
 ```
 To add objects to a queue, use [add], [addAll], [addFirst] or[addLast].
 ```dart continued
 queue.add(5);
 queue.addFirst(0);
 queue.addLast(10);
 queue.addAll([1, 2, 3]);
 print(queue); // 
 ```
 To check if the queue is empty, use [isEmpty] or [isNotEmpty].
 To find the number of queue entries, use [length].
 ```dart continued
 final isEmpty = queue.isEmpty; // false
 final queueSize = queue.length; // 6
 ```
 To get first or last item from queue, use [first] or [last].
 ```dart continued
 final first = queue.first; // 0
 final last = queue.last; // 3
 ```
 To get item value using index, use [elementAt].
 ```dart continued
 final itemAt = queue.elementAt(2); // 10
 ```
 To convert queue to list, call [toList].
 ```dart continued
 final numbers = queue.;
 print(numbers); // [0, 5, 10, 1, 2, 3]
 ```
 To remove item from queue, call [remove], [removeFirst] or [removeLast].
 ```dart continued
 queue.remove(10);
 queue.;
 queue.;
 print(queue); // 
 ```
 To remove multiple elements at the same time, use [removeWhere].
 ```dart continued
 queue.removeWhere((element) => element == 1);
 print(queue); // 
 ```
 To remove all elements in this queue that do not meet a condition,
 use [retainWhere].
 ```dart continued
 queue.retainWhere((element) => element < 4);
 print(queue); // 
 ```
 To remove all items and empty the set, use [clear].
 ```dart continued
 queue.;
 print(queue.isEmpty); // true
 print(queue); // 
 ```

## Dependencies

- ListIterable, Queue

## Members

- **_INITIAL_CAPACITY**: `int`
- **_table**: `List<E?>`
- **_head**: `int`
- **_tail**: `int`
- **_modificationCount**: `int`
## Constructors

### Unnamed Constructor
Create an empty queue.

 If [initialCapacity] is given, prepare the queue for at least that many
 elements.

### from
Create a `ListQueue` containing all [elements].

 The elements are added to the queue, as by [addLast], in the order given
 by `elements.iterator`.

 All the [elements] should be instances of [E].
 The `elements` iterable itself may have any element type, so this
 constructor can be used to down-cast a `Queue`, for example as:
 ```dart
 Queue&lt;SuperType&gt; superQueue = ...;
 Queue&lt;SubType&gt; subQueue =
     ListQueue&lt;SubType&gt;.from(superQueue.whereType&lt;SubType&gt;);
 ```
 Example:
 ```dart
 final numbers = <num>[10, 20, 30];
 final queue = ListQueue&lt;int&gt;.from(numbers);
 print(queue); // 
 ```

#### Parameters

- `elements`: `Iterable&lt;dynamic&gt;`
### of
Create a `ListQueue` from [elements].

 The elements are added to the queue, as by [addLast], in the order given
 by `elements.iterator`.
 Example:
 ```dart
 final baseQueue = ListQueue.of([1.0, 2.0, 3.0]); // A ListQueue&lt;double&gt;
 final numQueue = ListQueue&lt;num&gt;.of(baseQueue);
 print(numQueue); // 
 ```

#### Parameters

- `elements`: `Iterable&lt;E&gt;`
