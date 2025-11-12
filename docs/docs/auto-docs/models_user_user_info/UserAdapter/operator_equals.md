



menu

1.  [talawa](../../index.md)
2.  [models/user/user_info.dart](../../models_user_user_info/)
3.  [UserAdapter](../../models_user_user_info/UserAdapter-class.md)
4.  operator == method


operator ==


 dark_mode   light_mode 




<div>

# operator == method

</div>


<div>

1.  @[override](https://api.flutter.dev/flutter/dart-core/override-constant.html)

</div>

[[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]
operator ==(

1.  [[[Object](https://api.flutter.dev/flutter/dart-core/Object-class.md)]
    other]

)


override




The equality operator.

The default behavior for all
[Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)s
is to return true if and only if this object and `other` are the same
object.

Override this method to specify a different equality relation on a
class. The overriding method must still be an equivalence relation. That
is, it must be:

-   Total: It must return a boolean for all arguments. It should never
    throw.

-   Reflexive: For all objects `o`, `o == o` must be true.

-   Symmetric: For all objects `o1` and `o2`, `o1 == o2` and `o2 == o1`
    must either both be true, or both be false.

-   Transitive: For all objects `o1`, `o2`, and `o3`, if `o1 == o2` and
    `o2 == o3` are true, then `o1 == o3` must be true.

The method should also be consistent over time, so whether two objects
are equal should only change if at least one of the objects was
modified.

If a subclass overrides the equality operator, it should override the
[hashCode](../../models_user_user_info/UserAdapter/hashCode.md) method
as well to maintain consistency.



## Implementation

``` language-dart
@override
bool operator ==(Object other) =>
    identical(this, other) ||
    other is UserAdapter &&
        runtimeType == other.runtimeType &&
        typeId == other.typeId;
```







1.  [talawa](../../index.md)
2.  [user_info](../../models_user_user_info/)
3.  [UserAdapter](../../models_user_user_info/UserAdapter-class.md)
4.  operator == method

##### UserAdapter class









 talawa 1.0.0+1 
