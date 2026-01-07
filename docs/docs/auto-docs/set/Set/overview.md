# Overview for `Set`

## Description

A collection of objects in which each object can occur only once.

 That is, for each object of the element type, the object is either considered
 to be in the set, or to _not_ be in the set.

 Set implementations may consider some elements indistinguishable. These
 elements are treated as being the same for any operation on the set.

 The default [Set] implementation, [LinkedHashSet], considers objects
 indistinguishable if they are equal with regard to [Object.==] and
 [Object.hashCode].

 Iterating over elements of a set may be either unordered
 or ordered in some way. Examples:

 * A [HashSet] is unordered, which means that its iteration order is
   unspecified,
 * [LinkedHashSet] iterates in the insertion order of its elements, and
 * a sorted set like [SplayTreeSet] iterates the elements in sorted order.

 It is generally not allowed to modify the set (add or remove elements) while
 an operation on the set is being performed, for example during a call to
 [forEach] or [containsAll]. Nor is it allowed to modify the set while
 iterating either the set itself or any [Iterable] that is backed by the set,
 such as the ones returned by methods like [where] and [map].

 It is generally not allowed to modify the equality of elements (and thus not
 their hashcode) while they are in the set. Some specialized subtypes may be
 more permissive, in which case they should document this behavior.

## Dependencies

- Iterable, _SetIterable

## Constructors

### Unnamed Constructor
Creates an empty [Set].

 The created [Set] is a plain [LinkedHashSet].
 As such, it considers elements that are equal (using [operator ==]) to be
 indistinguishable, and requires them to have a compatible
 [Object.hashCode] implementation.

 The set is equivalent to one created by `LinkedHashSet&lt;E&gt;`.

### identity
Creates an empty identity [Set].

 The created [Set] is a [LinkedHashSet] that uses identity as equality
 relation.

 The set is equivalent to one created by `LinkedHashSet&lt;E&gt;.`.

### from
Creates a [Set] that contains all [elements].

 All the [elements] should be instances of [E].
 The `elements` iterable itself can have any type,
 so this constructor can be used to down-cast a `Set`, for example as:
 ```
 Set&lt;SuperType&gt; superSet = ...;
 Set&lt;SubType&gt; subSet =
     Set&lt;SubType&gt;.from(superSet.where((e) => e is SubType));
 ```
 The created [Set] is a [LinkedHashSet]. As such, it considers elements that
 are equal (using [operator ==]) to be indistinguishable, and requires them to
 have a compatible [Object.hashCode] implementation.

 The set is equivalent to one created by
 `LinkedHashSet&lt;E&gt;.from(elements)`.
 ```dart
 final numbers = <num>;
 final setFrom = Set&lt;int&gt;.from(numbers);
 print(setFrom); // 
 ```

#### Parameters

- `elements`: `Iterable`
### of
Creates a [Set] from [elements].

 The created [Set] is a [LinkedHashSet]. As such, it considers elements that
 are equal (using [operator ==]) to be indistinguishable, and requires them to
 have a compatible [Object.hashCode] implementation.

 The set is equivalent to one created by
 `LinkedHashSet&lt;E&gt;.of(elements)`.
 ```dart
 final baseSet = <int>;
 final setOf = Set&lt;num&gt;.of(baseSet);
 print(setOf); // 
 ```

#### Parameters

- `elements`: `Iterable&lt;E&gt;`
### unmodifiable
Creates an unmodifiable [Set] from [elements].

 The new set behaves like the result of [Set.of],
 except that the set returned by this constructor is not modifiable.
 ```dart
 final characters = <String>;
 final unmodifiableSet = Set.unmodifiable(characters);
 ```

#### Parameters

- `elements`: `Iterable&lt;E&gt;`
