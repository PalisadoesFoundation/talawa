# Method: `lookup`

## Description

If an object equal to [object] is in the set, return it.

 Checks whether [object] is in the set, like [contains], and if so,
 returns the object in the set, otherwise returns `null`.

 If the equality relation used by the set is not identity,
 then the returned object may not be *identical* to [object].
 Some set implementations may not be able to implement this method.
 If the [contains] method is computed,
 rather than being based on an actual object instance,
 then there may not be a specific object instance representing the
 set element.
 ```dart
 final characters = <String>;
 final containsB = characters.lookup('B');
 print(containsB); // B
 final containsD = characters.lookup('D');
 print(containsD); // null
 ```

## Return Type
`E?`

## Parameters

- `object`: `Object?`
