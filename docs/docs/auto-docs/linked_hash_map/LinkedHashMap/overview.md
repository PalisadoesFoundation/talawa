# Overview for `LinkedHashMap`

## Description

An insertion-ordered [Map] with expected constant-time lookup.

 A non-constant map literal, like ``, is a `LinkedHashMap`.

 The [keys], [values] and [entries] are iterated in key insertion order.

 The map uses a hash-table to look up entries, so keys must have
 suitable implementations of [Object.operator==] and [Object.hashCode].
 If the hash codes are not well-distributed, the performance of map
 operations may suffer.

 The insertion order of keys is remembered,
 and keys are iterated in the order they were inserted into the map.
 Values and entries are iterated in their corresponding key's order.
 Changing a key's value, when the key is already in the map,
 does not change the iteration order,
 but removing the key and adding it again
 will make it be last in the iteration order.

 **Notice:**
 Do not modify a map (add or remove keys) while an operation
 is being performed on that map, for example in functions
 called during a [forEach] or [putIfAbsent] call,
 or while iterating the map ([keys], [values] or [entries]).

 The keys of a `LinkedHashMap` must have consistent [Object.==]
 and [Object.hashCode] implementations. This means that the `==` operator
 must define a stable equivalence relation on the keys (reflexive,
 symmetric, transitive, and consistent over time), and that `hashCode`
 must be the same for objects that are considered equal by `==`.

 Example:

 ```dart
 final planetsByDiameter = ; // A new LinkedHashMap
 ```
 To add data to a map, use [operator[]=], [addAll] or [addEntries].
 ```dart continued
 planetsByDiameter[1] = 'Earth';
 planetsByDiameter.;
 ```
 To check if the map is empty, use [isEmpty] or [isNotEmpty].
 To find the number of map entries, use [length].
 ```dart continued
 print(planetsByDiameter.isEmpty); // false
 print(planetsByDiameter.length); // 4
 print(planetsByDiameter);
 // 
 ```
 The [forEach] method calls a function for each key/value entry of the map.
 ```dart continued
 planetsByDiameter.forEach((key, value) );
 ```
 To check whether the map has an entry with a specific key, use [containsKey].
 ```dart continued
 final keyOneExists = planetsByDiameter.containsKey(1); // true
 final keyFiveExists = planetsByDiameter.containsKey(5); // false
 ```
 To check whether the map has an entry with a specific value,
 use [containsValue].
 ```dart continued
 final earthExists = planetsByDiameter.containsValue('Earth'); // true
 final saturnExists =  planetsByDiameter.containsValue('Saturn'); // false
 ```
 To remove an entry with a specific key, use [remove].
 ```dart continued
 final removedValue = planetsByDiameter.remove(1);
 print(removedValue); // Earth
 print(planetsByDiameter); // 
 ```
 To remove multiple entries at the same time, based on their keys and values,
 use [removeWhere].
 ```dart continued
 planetsByDiameter.removeWhere((key, value) => key == 0.949);
 print(planetsByDiameter); // 
 ```
 To conditionally add or modify a value for a specific key, depending on
 whether there already is an entry with that key,
 use [putIfAbsent] or [update].
 ```dart continued
 planetsByDiameter.update(0.949, (v) => 'Venus', ifAbsent:  => 'Venus');
 planetsByDiameter.putIfAbsent(0.532,  => "Another Mars if needed");
 print(planetsByDiameter); // 
 ```
 To update the values of all keys, based on the existing key and value,
 use [updateAll].
 ```dart continued
 planetsByDiameter.updateAll((key, value) => 'X');
 print(planetsByDiameter); // 
 ```
 To remove all entries and empty the map, use [clear].
 ```dart continued
 planetsByDiameter.;
 print(planetsByDiameter); // 
 print(planetsByDiameter.isEmpty); // true
 ```
 **See also:**
 * [Map], the general interface of key/value pair collections.
 * [HashMap] is unordered (the order of iteration is not guaranteed).
 * [SplayTreeMap] iterates the keys in sorted order.

## Dependencies

- Map

## Constructors

### Unnamed Constructor
Creates an insertion-ordered hash-table based [Map].

 If [equals] is provided, it is used to compare the keys in the table with
 new keys. If [equals] is omitted, the key's own [Object.==] is used
 instead.
 The [equals] function *must not* change the map it's used as an equality
 for. If it does, the resulting behavior is unspecified.

 Similarly, if [hashCode] is provided, it is used to produce a hash value
 for keys in order to place them in the hash table. If it is omitted, the
 key's own [Object.hashCode] is used.
 The [hashCode] function *must not* change the map it's used as a hash code
 for. If it does, the resulting behavior is unspecified.

 The used `equals` and `hashCode` methods should always be consistent,
 so that if `equals(a, b)` then `hashCode(a) == hashCode(b)`. The hash
 of an object, or what it compares equal to, should not change while the
 object is in the table. If the hash code or equality of an object does
 change, the resulting behavior is unspecified.

 If you supply one of [equals] or [hashCode],
 you should generally also supply the other.

 Some [equals] or [hashCode] functions might not work for all objects.
 If [isValidKey] is supplied, it's used to check a potential key
 which is not necessarily an instance of [K], like the arguments to
 [operator []], [remove] and [containsKey], which are typed as `Object?`.
 If [isValidKey] returns `false`, for an object, the [equals] and
 [hashCode] functions are not called, and no key equal to that object
 is assumed to be in the map.
 The [isValidKey] function defaults to just testing if the object is an
 instance of [K].

 Example:
 ```dart template:expression
 LikedHashMap&lt;int,int&gt;(equals: (int a, int b) => (b - a) % 5 == 0,
                       hashCode: (int e) => e % 5)
 ```
 This example map does not need an `isValidKey` function to be passed.
 The default function accepts precisely `int` values, which can safely be
 passed to both the `equals` and `hashCode` functions.

 If neither `equals`, `hashCode`, nor `isValidKey` is provided,
 the default `isValidKey` instead accepts all keys.
 The default equality and hashcode operations are assumed to work on all
 objects.

 Likewise, if `equals` is [identical], `hashCode` is [identityHashCode]
 and `isValidKey` is omitted, the resulting map is identity based,
 and the `isValidKey` defaults to accepting all keys.
 Such a map can be created directly using [LinkedHashMap.identity].

### identity
Creates an insertion-ordered identity-based map.

 Effectively shorthand for:
 ```dart template:expression
 LinkedHashMap&lt;K, V&gt;(equals: identical,
                     hashCode: identityHashCode)
 ```

### from
Creates a [LinkedHashMap] that contains all key value pairs of [other].

 The keys must all be instances of [K] and the values to [V].
 The [other] map itself can have any type.
 Example:
 ```dart
 final baseMap = <num, Object>;
 final fromBaseMap = LinkedHashMap&lt;int, String&gt;.from(baseMap);
 print(fromBaseMap); // 
 ```

#### Parameters

- `other`: `Map&lt;dynamic, dynamic&gt;`
### of
Creates a [LinkedHashMap] that contains all key value pairs of [other].
 Example:
 ```dart
 final baseMap = <int, String>;
 final mapOf = LinkedHashMap&lt;num, Object&gt;.of(baseMap);
 print(mapOf); // 
 ```

#### Parameters

- `other`: `Map&lt;K, V&gt;`
### fromIterable
Creates a [LinkedHashMap] where the keys and values are computed from the
 [iterable].

 For each element of the [iterable], this constructor computes a key/value
 pair by applying [key] and [value] respectively.

 The keys of the key/value pairs do not need to be unique. The last
 occurrence of a key will simply overwrite any previous value.

 If no values are specified for [key] and [value], the default is the
 both default to the identity function.
 Example:
 ```dart
 final numbers = [11, 12, 13, 14];
 final mapFromIterable =
     LinkedHashMap.fromIterable(numbers, key: (i) => i, value: (i) => i * i);
 print(mapFromIterable); // 
 ```

#### Parameters

- `iterable`: `Iterable`
- ``: `dynamic`
- ``: `dynamic`
### fromIterables
Creates a [LinkedHashMap] associating the given [keys] to [values].

 This constructor iterates over [keys] and [values] and maps each element of
 [keys] to the corresponding element of [values].

 If [keys] contains the same object multiple times, the last occurrence
 overwrites the previous value.

 It is an error if the two [Iterable]s don't have the same length.
 Example:
 ```dart
 final values = [0.06, 0.81, 1, 0.11];
 final keys = ['Mercury', 'Venus', 'Earth', 'Mars'];
 final mapFromIterables = LinkedHashMap.fromIterables(keys, values);
 print(mapFromIterables);
 // 
 ```

#### Parameters

- `keys`: `Iterable&lt;K&gt;`
- `values`: `Iterable&lt;V&gt;`
### fromEntries
Creates a [LinkedHashMap] containing the entries of [entries].

 Returns a new `LinkedHashMap&lt;K, V&gt;` where all entries of [entries]
 have been added in iteration order.

 If multiple [entries] have the same key,
 later occurrences overwrite the earlier ones.
 Example:
 ```dart
 final numbers = [11, 12, 13, 14];
 final map = LinkedHashMap.fromEntries(numbers.map((i) => MapEntry(i, i * i)));
 print(map); // 
 ```

#### Parameters

- `entries`: `Iterable&lt;MapEntry&lt;K, V&gt;&gt;`
