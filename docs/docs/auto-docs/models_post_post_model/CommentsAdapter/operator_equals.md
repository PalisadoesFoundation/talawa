
<div>

# operator == method

</div>


<div>

1.  @[override](https://api.flutter.dev/flutter/dart-core/override-constant.html)

</div>

[[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]
operator ==(

1.  [[[Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)]
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
[hashCode](../../models_post_post_model/CommentsAdapter/hashCode.html)
method as well to maintain consistency.



## Implementation

``` language-dart
@override
bool operator ==(Object other) =>
    identical(this, other) ||
    other is CommentsAdapter &&
        runtimeType == other.runtimeType &&
        typeId == other.typeId;
```







1.  [talawa](../../index.html)
2.  [post_model](../../models_post_post_model/)
3.  [CommentsAdapter](../../models_post_post_model/CommentsAdapter-class.html)
4.  operator == method

##### CommentsAdapter class







