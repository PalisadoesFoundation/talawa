# Overview for `LogicalKeySet`

## Description

A set of [LogicalKeyboardKey]s that can be used as the keys in a map.

 [LogicalKeySet] can be used as a [ShortcutActivator]. It is not recommended
 to use [LogicalKeySet] for a common shortcut such as `Delete` or `Ctrl+C`,
 prefer [SingleActivator] when possible, whose behavior more closely resembles
 that of typical platforms.

 When used as a [ShortcutActivator], [LogicalKeySet] will activate the intent
 when all [keys] are pressed, and no others, except that modifier keys are
 considered without considering sides (e.g. control left and control right are
 considered the same).

 
 In the following example, the counter is increased when the following key
 sequences are pressed:

  * Control left, then C.
  * Control right, then C.
  * C, then Control left.

 But not when:

  * Control left, then A, then C.

 ** See code in examples/api/lib/widgets/shortcuts/logical_key_set.0.dart **
 

 This is also a thin wrapper around a [Set], but changes the equality
 comparison from an identity comparison to a contents comparison so that
 non-identical sets with the same keys in them will compare as equal.

## Dependencies

- KeySet, Diagnosticable, ShortcutActivator

## Members

- **_triggers**: `Set&lt;LogicalKeyboardKey&gt;`
- **_modifiers**: `Set&lt;LogicalKeyboardKey&gt;`
- **_unmapSynonyms**: `Map&lt;LogicalKeyboardKey, List&lt;LogicalKeyboardKey&gt;&gt;`
## Constructors

### Unnamed Constructor
A constructor for making a [LogicalKeySet] of up to four keys.

 If you need a set of more than four keys, use [LogicalKeySet.fromSet].

 The same [LogicalKeyboardKey] may not be appear more than once in the set.

### fromSet
Create a [LogicalKeySet] from a set of [LogicalKeyboardKey]s.

 Do not mutate the `keys` set after passing it to this object.

#### Parameters

- ``: `dynamic`
