




operator == method - BaseFeedManager class - base\_feed\_manager library - Dart API







menu

1. [talawa](../../index.html)
2. [services/caching/base\_feed\_manager.dart](../../services_caching_base_feed_manager/services_caching_base_feed_manager-library.html)
3. [BaseFeedManager<T>](../../services_caching_base_feed_manager/BaseFeedManager-class.html)
4. operator == method

operator ==


dark\_mode

light\_mode




# operator == method


bool
operator ==(

1. Object other

)
inherited

The equality operator.

The default behavior for all `Object`s is to return true if and
only if this object and `other` are the same object.

Override this method to specify a different equality relation on
a class. The overriding method must still be an equivalence relation.
That is, it must be:

* Total: It must return a boolean for all arguments. It should never throw.
* Reflexive: For all objects `o`, `o == o` must be true.
* Symmetric: For all objects `o1` and `o2`, `o1 == o2` and `o2 == o1` must
  either both be true, or both be false.
* Transitive: For all objects `o1`, `o2`, and `o3`, if `o1 == o2` and
  `o2 == o3` are true, then `o1 == o3` must be true.

The method should also be consistent over time,
so whether two objects are equal should only change
if at least one of the objects was modified.

If a subclass overrides the equality operator, it should override
the `hashCode` method as well to maintain consistency.


## Implementation

```
external bool operator ==(Object other);
```

 


1. [talawa](../../index.html)
2. [base\_feed\_manager](../../services_caching_base_feed_manager/services_caching_base_feed_manager-library.html)
3. [BaseFeedManager<T>](../../services_caching_base_feed_manager/BaseFeedManager-class.html)
4. operator == method

##### BaseFeedManager class





talawa
1.0.0+1






