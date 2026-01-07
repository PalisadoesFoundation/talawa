# Overview for `KeySet`

## Description

A set of [KeyboardKey]s that can be used as the keys in a [Map].

 A key set contains the keys that are down simultaneously to represent a
 shortcut.

 This is a thin wrapper around a [Set], but changes the equality comparison
 from an identity comparison to a contents comparison so that non-identical
 sets with the same keys in them will compare as equal.

 See also:

  * [ShortcutManager], which uses [LogicalKeySet] (a [KeySet] subclass) to
    define its key map.

## Members

- **_keys**: `HashSet&lt;T&gt;`
- **hashCode**: `int`
- **_tempHashStore3**: `List&lt;int&gt;`
- **_tempHashStore4**: `List&lt;int&gt;`
## Constructors

### Unnamed Constructor
A constructor for making a [KeySet] of up to four keys.

 If you need a set of more than four keys, use [KeySet.fromSet].

 The same [KeyboardKey] may not be appear more than once in the set.

### fromSet
Create a [KeySet] from a set of [KeyboardKey]s.

 Do not mutate the `keys` set after passing it to this object.

 The `keys` set must not be empty.

#### Parameters

- `keys`: `Set&lt;T&gt;`
