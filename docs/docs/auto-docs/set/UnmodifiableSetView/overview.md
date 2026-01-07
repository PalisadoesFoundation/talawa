# Overview for `UnmodifiableSetView`

## Description

An unmodifiable [Set] view of another [Set].

 Methods that could change the set, such as [add] and [remove],
 must not be called.

 ```dart
 final baseSet = <String>;
 final unmodifiableSetView = UnmodifiableSetView(baseSet);

 // Remove an element from the original set.
 baseSet.remove('Venus');
 print(unmodifiableSetView); // 

 unmodifiableSetView.remove('Earth'); // Throws.
 ```

## Dependencies

- SetBase, _UnmodifiableSetMixin

## Members

- **_source**: `Set&lt;E&gt;`
## Constructors

### Unnamed Constructor
Creates an [UnmodifiableSetView] of [source].

