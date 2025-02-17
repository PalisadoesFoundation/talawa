
<div>

# hashCode property

</div>



<div>

1.  @[override](https://api.flutter.dev/flutter/dart-core/override-constant.html)

</div>

[[int](https://api.flutter.dev/flutter/dart-core/int-class.html)]
get hashCode


override




The hash code for this object.

A hash code is a single integer which represents the state of the object
that affects [operator
==](../../enums_enums/CachedOperationTypeAdapter/operator_equals.md)
comparisons.

All objects have hash codes. The default hash code implemented by
[Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)
represents only the identity of the object, the same way as the default
[operator
==](../../enums_enums/CachedOperationTypeAdapter/operator_equals.md)
implementation only considers objects equal if they are identical (see
[identityHashCode](https://api.flutter.dev/flutter/dart-core/identityHashCode.md)).

If [operator
==](../../enums_enums/CachedOperationTypeAdapter/operator_equals.md)
is overridden to use the object state instead, the hash code must also
be changed to represent that state, otherwise the object cannot be used
in hash based data structures like the default
[Set](https://api.flutter.dev/flutter/dart-core/Set-class.html) and
[Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)
implementations.

Hash codes must be the same for objects that are equal to each other
according to [operator
==](../../enums_enums/CachedOperationTypeAdapter/operator_equals.md).
The hash code of an object should only change if the object changes in a
way that affects equality. There are no further requirements for the
hash codes. They need not be consistent between executions of the same
program and there are no distribution guarantees.

Objects that are not equal are allowed to have the same hash code. It is
even technically allowed that all instances have the same hash code, but
if clashes happen too often, it may reduce the efficiency of hash-based
data structures like
[HashSet](https://api.flutter.dev/flutter/dart-collection/HashSet-class.html)
or
[HashMap](https://api.flutter.dev/flutter/dart-collection/HashMap-class.html).

If a subclass overrides
[hashCode](../../enums_enums/CachedOperationTypeAdapter/hashCode.md),
it should override the [operator
==](../../enums_enums/CachedOperationTypeAdapter/operator_equals.md)
operator as well to maintain consistency.



## Implementation

``` language-dart
@override
int get hashCode => typeId.hashCode;
```








1.  [talawa](../../index.md)
2.  [enums](../../enums_enums/)
3.  [CachedOperationTypeAdapter](../../enums_enums/CachedOperationTypeAdapter-class.md)
4.  hashCode property

##### CachedOperationTypeAdapter class







