




operator == method - ItemType enum - event\_agenda\_item library - Dart API







menu

1. [talawa](../../index.html)
2. [models/events/event\_agenda\_item.dart](../../models_events_event_agenda_item/models_events_event_agenda_item-library.html)
3. [ItemType](../../models_events_event_agenda_item/ItemType.html)
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
2. [event\_agenda\_item](../../models_events_event_agenda_item/models_events_event_agenda_item-library.html)
3. [ItemType](../../models_events_event_agenda_item/ItemType.html)
4. operator == method

##### ItemType enum





talawa
1.0.0+1






