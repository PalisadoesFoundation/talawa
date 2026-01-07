# Overview for `List`

## Description

An indexable collection of objects with a length.

 Subclasses of this class implement different kinds of lists.
 The most common kinds of lists are:

 * **Fixed-length list**

   An error occurs when attempting to use operations
   that can change the length of the list.

 * **Growable list**

   Full implementation of the API defined in this class.

 The default growable list, as created by `[]`, keeps
 an internal buffer, and grows that buffer when necessary. This guarantees
 that a sequence of [add] operations will each execute in amortized constant
 time. Setting the length directly may take time proportional to the new
 length, and may change the internal capacity so that a following add
 operation will need to immediately increase the buffer capacity.
 Other list implementations may have different performance behavior.

 Example of fixed-length list:
 ```dart
 final fixedLengthList = List&lt;int&gt;.filled(5, 0); // Creates fixed-length list.
 print(fixedLengthList); // [0, 0, 0, 0, 0]
 fixedLengthList[0] = 87;
 fixedLengthList.setAll(1, [1, 2, 3]);
 print(fixedLengthList); // [87, 1, 2, 3, 0]
 // Fixed length list length can't be changed or increased
 fixedLengthList.length = 0;  // Throws
 fixedLengthList.add(499);    // Throws
 ```

 Example of growable list:
 ```dart
 final growableList = <String>['A', 'B']; // Creates growable list.
 ```
 To add data to the growable list, use [operator[]=], [add] or [addAll].
 ```
 growableList[0] = 'G';
 print(growableList); // [G, B]
 growableList.add('X');
 growableList.;
 print(growableList); // [G, B, X, C, B]
 ```
 To check whether, and where, the element is in the list, use [indexOf] or
 [lastIndexOf].
 ```
 final indexA = growableList.indexOf('A'); // -1 (not in the list)
 final firstIndexB = growableList.indexOf('B'); // 1
 final lastIndexB = growableList.lastIndexOf('B'); // 4
 ```
 To remove an element from the growable list, use [remove], [removeAt],
 [removeLast], [removeRange] or [removeWhere].
 ```
 growableList.remove('C');
 growableList.;
 print(growableList); // [G, B, X]
 ```
 To insert an element at position in the list, use [insert] or [insertAll].
 ```
 growableList.insert(1, 'New');
 print(growableList); // [G, New, B, X]
 ```
 To replace a range of elements in the list, use [fillRange], [replaceRange]
 or [setRange].
 ```
 growableList.replaceRange(0, 2, ['AB', 'A']);
 print(growableList); // [AB, A, B, X]
 growableList.fillRange(2, 4, 'F');
 print(growableList); // [AB, A, F, F]
 ```
 To sort the elements of the list, use [sort].
 ```
 growableList.sort((a, b) => a.compareTo(b));
 print(growableList); // [A, AB, F, F]
 ```
 To shuffle the elements of this list randomly, use [shuffle].
 ```
 growableList.;
 print(growableList); // e.g. [AB, F, A, F]
 ```
 To find the first element satisfying some predicate, or give a default
 value if none do, use [firstWhere].
 ```
 bool isVowel(String char) => char.length == 1 && "AEIOU".contains(char);
 final firstVowel = growableList.firstWhere(isVowel, orElse:  => ''); // ''
 ```
 There are similar [lastWhere] and [singleWhere] methods.

 A list is an [Iterable] and supports all its methods, including
 [where], [map], [whereType] and [toList].

 Lists are [Iterable]. Iteration occurs over values in index order. Changing
 the values does not affect iteration, but changing the valid
 indices&mdash;that is, changing the list's length&mdash;between iteration
 steps causes a [ConcurrentModificationError]. This means that only growable
 lists can throw ConcurrentModificationError. If the length changes
 temporarily and is restored before continuing the iteration, the iterator
 might not detect it.

 It is generally not allowed to modify the list's length (adding or removing
 elements) while an operation on the list is being performed,
 for example during a call to [forEach] or [sort].
 Changing the list's length while it is being iterated, either by iterating it
 directly or through iterating an [Iterable] that is backed by the list, will
 break the iteration.

## Dependencies

- Iterable, _ListIterable

## Constructors

### filled
Creates a list of the given length with [fill] at each position.

 The [length] must be a non-negative integer.

 Example:
 ```dart
 final zeroList = List&lt;int&gt;.filled(3, 0, growable: true); // [0, 0, 0]
 ```

 The created list is fixed-length if [growable] is false (the default)
 and growable if [growable] is true.
 If the list is growable, increasing its [length] will *not* initialize
 new entries with [fill].
 After being created and filled, the list is no different from any other
 growable or fixed-length list created
 using `[]` or other [List] constructors.

 All elements of the created list share the same [fill] value.
 ```dart
 final shared = List.filled(3, []);
 shared[0].add(499);
 print(shared);  // [[499], [499], [499]]
 ```
 You can use [List.generate] to create a list with a fixed length
 and a new object at each position.
 ```dart
 final unique = List.generate(3, (_) => []);
 unique[0].add(499);
 print(unique); // [[499], [], []]
 ```

#### Parameters

- `length`: `int`
- `fill`: `E`
- ``: `dynamic`
### empty
Creates a new empty list.

 If [growable] is `false`, which is the default,
 the list is a fixed-length list of length zero.
 If [growable] is `true`, the list is growable and equivalent to `<E>[]`.
 ```dart
 final growableList = List.empty(growable: true); // []
 growableList.add(1); // [1]

 final fixedLengthList = List.empty(growable: false);
 fixedLengthList.add(1); // error
 ```

#### Parameters

- ``: `dynamic`
### from
Creates a list containing all [elements].

 The [Iterator] of [elements] provides the order of the elements.

 All the [elements] should be instances of [E].

 Example:
 ```dart
 final numbers = <num>[1, 2, 3];
 final listFrom = List&lt;int&gt;.from(numbers);
 print(listFrom); // [1, 2, 3]
 ```
 The `elements` iterable itself may have any element type, so this
 constructor can be used to down-cast a `List`, for example as:
 ```dart import:convert
 const jsonArray = '''
   [,
    ]
 ''';
 final List&lt;dynamic&gt; dynamicList = jsonDecode(jsonArray);
 final List&lt;Map&lt;String, dynamic&gt;&gt; fooData =
     List.from(dynamicList.where((x) => x is Map && x['text'] == 'foo'));
 print(fooData); // []
 ```

 This constructor creates a growable list when [growable] is true;
 otherwise, it returns a fixed-length list.

#### Parameters

- `elements`: `Iterable`
- ``: `dynamic`
### of
Creates a list from [elements].

 The [Iterator] of [elements] provides the order of the elements.

 This constructor creates a growable list when [growable] is true;
 otherwise, it returns a fixed-length list.
 ```dart
 final numbers = <int>[1, 2, 3];
 final listOf = List&lt;num&gt;.of(numbers);
 print(listOf); // [1, 2, 3]
 ```

#### Parameters

- `elements`: `Iterable&lt;E&gt;`
- ``: `dynamic`
### generate
Generates a list of values.

 Creates a list with [length] positions and fills it with values created by
 calling [generator] for each index in the range `0` .. `length - 1`
 in increasing order.
 ```dart
 final growableList =
     List&lt;int&gt;.generate(3, (int index) => index * index, growable: true);
 print(growableList); // [0, 1, 4]

 final fixedLengthList =
     List&lt;int&gt;.generate(3, (int index) => index * index, growable: false);
 print(fixedLengthList); // [0, 1, 4]
 ```
 The created list is fixed-length if [growable] is set to false.

 The [length] must be non-negative.

#### Parameters

- `length`: `int`
- ``: `dynamic`
- ``: `dynamic`
### unmodifiable
Creates an unmodifiable list containing all [elements].

 The [Iterator] of [elements] provides the order of the elements.

 An unmodifiable list cannot have its length or elements changed.
 If the elements are themselves immutable, then the resulting list
 is also immutable.
 ```dart
 final numbers = <int>[1, 2, 3];
 final unmodifiableList = List.unmodifiable(numbers); // [1, 2, 3]
 unmodifiableList[1] = 87; // Throws.
 ```

#### Parameters

- `elements`: `Iterable`
