# Overview for `UnmodifiableListView`

## Description

An unmodifiable [List] view of another List.

 The source of the elements may be a [List] or any [Iterable] with
 efficient [Iterable.length] and [Iterable.elementAt].

 ```dart
 final numbers = <int>[10, 20, 30];
 final unmodifiableListView = UnmodifiableListView(numbers);

 // Insert new elements into the original list.
 numbers.addAll([40, 50]);
 print(unmodifiableListView); // [10, 20, 30, 40, 50]

 unmodifiableListView.remove(20); // Throws.
 ```

## Dependencies

- UnmodifiableListBase

## Members

- **_source**: `Iterable&lt;E&gt;`
## Constructors

### Unnamed Constructor
Creates an unmodifiable list backed by [source].

 The [source] of the elements may be a [List] or any [Iterable] with
 efficient [Iterable.length] and [Iterable.elementAt].

