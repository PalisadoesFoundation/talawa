# Overview for `Map`

## Description

A collection of key/value pairs, from which you retrieve a value
 using its associated key.

 There is a finite number of keys in the map,
 and each key has exactly one value associated with it.

 Maps, and their keys and values, can be iterated.
 The order of iteration is defined by the individual type of map.
 Examples:

 * The plain [HashMap] is unordered (no order is guaranteed),
 * the [LinkedHashMap] iterates in key insertion order,
 * and a sorted map like [SplayTreeMap] iterates the keys in sorted order.

 It is generally not allowed to modify the map (add or remove keys) while
 an operation is being performed on the map, for example in functions called
 during a [forEach] call.
 Modifying the map while iterating the keys or values
 may also break the iteration.

 It is generally not allowed to modify the equality of keys (and thus not
 their hashcode) while they are in the map. Some specialized subtypes may be
 more permissive, in which case they should document this behavior.

 Key equality must be an equality relation. If the key stored in a map
 and the key used for lookup do not agree on whether the two are equal,
 so equality is not *symmetric*, then lookup behavior is unspecified.

## Constructors

### Unnamed Constructor
Creates an empty [LinkedHashMap].

 This constructor is equivalent to the non-const map literal `<K, V>`.

 A `LinkedHashMap` requires the keys to implement compatible
 `operator==` and `hashCode`.
 It iterates in key insertion order.

### from
Creates a [LinkedHashMap] with the same keys and values as [other].

 The keys must all be instances of [K] and the values of [V].
 The [other] map itself can have any type, unlike for [Map.of],
 and the key and value types are checked (and can fail) at run-time.

 Prefer using [Map.of] when possible, and only use `Map.from`
 to create a new map with more precise types than the original,
 and when it's known that all the keys and values have those
 more precise types.

 A `LinkedHashMap` requires the keys to implement compatible
 `operator==` and `hashCode`.
 It iterates in key insertion order.
 ```dart
 final planets = <num, String>;
 final mapFrom = Map&lt;int, String&gt;.from(planets);
 print(mapFrom); // 
 ```

#### Parameters

- `other`: `Map`
### of
Creates a [LinkedHashMap] with the same keys and values as [other].

 A `LinkedHashMap` requires the keys to implement compatible
 `operator==` and `hashCode`, and it allows `null` as a key.
 It iterates in key insertion order.
 ```dart
 final planets = <int, String>;
 final mapOf = Map&lt;num, String&gt;.of(planets);
 print(mapOf); // 
 ```

#### Parameters

- `other`: `Map&lt;K, V&gt;`
### unmodifiable
Creates an unmodifiable hash-based map containing the entries of [other].

 The keys must all be instances of [K] and the values of [V].
 The [other] map itself can have any type.

 The map requires the keys to implement compatible
 `operator==` and `hashCode`.
 The created map iterates keys in a fixed order,
 preserving the order provided by [other].

 The resulting map behaves like the result of [Map.from],
 except that the map returned by this constructor is not modifiable.
 ```dart
 final planets = <int, String>;
 final unmodifiableMap = Map.unmodifiable(planets);
 unmodifiableMap[4] = 'Mars'; // Throws
 ```

#### Parameters

- `other`: `Map&lt;dynamic, dynamic&gt;`
### identity
Creates an identity map with the default implementation, [LinkedHashMap].

 An identity map uses [identical] for equality and [identityHashCode]
 for hash codes of keys instead of the intrinsic [Object.==] and
 [Object.hashCode] of the keys.

 The map iterates in key insertion order.

### fromIterable
Creates a Map instance in which the keys and values are computed from the
 [iterable].

 For each element of the [iterable], a key/value pair is computed
 by applying [key] and [value] respectively to the element of the iterable.

 Equivalent to the map literal:
 ```dart
 <K, V>
 ```
 The literal is generally preferable because it allows
 for a more precise typing.

 The example below creates a new map from a list of integers.
 The keys of `map` are the `list` values converted to strings,
 and the values of the `map` are the squares of the `list` values:
 ```dart
 final numbers = <int>[1, 2, 3];
 final map = Map&lt;String, int&gt;.fromIterable(numbers,
     key: (item) => item.,
     value: (item) => item * item);
 print(map); // 
 ```
 If no values are specified for [key] and [value],
 the default is the identity function.
 In that case, the iterable element must be assignable to the
 key or value type of the created map.

 In the following example, the keys and corresponding values of `map`
 are the `list` values directly:
 ```dart
 final numbers = <int>[1, 2, 3];
 final map = Map.fromIterable(numbers);
 print(map); // 
 ```
 The keys computed by the source [iterable] do not need to be unique.
 The last occurrence of a key will overwrite
 the value of any previous occurrence.

 The created map is a [LinkedHashMap].
 A `LinkedHashMap` requires the keys to implement compatible
 `operator==` and `hashCode`.
 It iterates in key insertion order.

#### Parameters

- `iterable`: `Iterable`
- ``: `dynamic`
- ``: `dynamic`
### fromIterables
Creates a map associating the given [keys] to the given [values].

 The map construction iterates over [keys] and [values] simultaneously,
 and adds an entry to the map for each pair of key and value.
 ```dart
 final rings = <bool>[false, false, true, true];
 final planets = <String>;
 final map = Map&lt;String, bool&gt;.fromIterables(planets, rings);
 print(map); // 
 ```
 If [keys] contains the same object multiple times,
 the value of the last occurrence overwrites any previous value.

 The two [Iterable]s must have the same length.

 The created map is a [LinkedHashMap].
 A `LinkedHashMap` requires the keys to implement compatible
 `operator==` and `hashCode`.
 It iterates in key insertion order.

#### Parameters

- `keys`: `Iterable&lt;K&gt;`
- `values`: `Iterable&lt;V&gt;`
### fromEntries
Creates a new map and adds all entries.

 Returns a new `Map&lt;K, V&gt;` where all entries of [entries]
 have been added in iteration order.

 If multiple [entries] have the same key,
 later occurrences overwrite the value of the earlier ones.

 Equivalent to the map literal:
 ```dart
 <K, V>
 ```
 Example:
 ```dart
 final moonCount = <String, int>;
 final map = Map.fromEntries(moonCount.entries);
 ```

#### Parameters

- `entries`: `Iterable&lt;MapEntry&lt;K, V&gt;&gt;`
