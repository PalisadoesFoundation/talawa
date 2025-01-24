




hashCode property - CachedUserActionStatusAdapter class - enums library - Dart API







menu

1. [talawa](../../index.html)
2. [enums/enums.dart](../../enums_enums/enums_enums-library.html)
3. [CachedUserActionStatusAdapter](../../enums_enums/CachedUserActionStatusAdapter-class.html)
4. hashCode property

hashCode


dark\_mode

light\_mode




# hashCode property


1. @override

int
get
hashCode

The hash code for this object.

A hash code is a single integer which represents the state of the object
that affects [operator ==](../../enums_enums/CachedUserActionStatusAdapter/operator_equals.html) comparisons.

All objects have hash codes.
The default hash code implemented by `Object`
represents only the identity of the object,
the same way as the default [operator ==](../../enums_enums/CachedUserActionStatusAdapter/operator_equals.html) implementation only considers objects
equal if they are identical (see `identityHashCode`).

If [operator ==](../../enums_enums/CachedUserActionStatusAdapter/operator_equals.html) is overridden to use the object state instead,
the hash code must also be changed to represent that state,
otherwise the object cannot be used in hash based data structures
like the default `Set` and `Map` implementations.

Hash codes must be the same for objects that are equal to each other
according to [operator ==](../../enums_enums/CachedUserActionStatusAdapter/operator_equals.html).
The hash code of an object should only change if the object changes
in a way that affects equality.
There are no further requirements for the hash codes.
They need not be consistent between executions of the same program
and there are no distribution guarantees.

Objects that are not equal are allowed to have the same hash code.
It is even technically allowed that all instances have the same hash code,
but if clashes happen too often,
it may reduce the efficiency of hash-based data structures
like `HashSet` or `HashMap`.

If a subclass overrides [hashCode](../../enums_enums/CachedUserActionStatusAdapter/hashCode.html), it should override the
[operator ==](../../enums_enums/CachedUserActionStatusAdapter/operator_equals.html) operator as well to maintain consistency.


## Implementation

```
@override
int get hashCode => typeId.hashCode;
```


 


1. [talawa](../../index.html)
2. [enums](../../enums_enums/enums_enums-library.html)
3. [CachedUserActionStatusAdapter](../../enums_enums/CachedUserActionStatusAdapter-class.html)
4. hashCode property

##### CachedUserActionStatusAdapter class





talawa
1.0.0+1






