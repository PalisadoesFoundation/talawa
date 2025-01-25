




operator == method - OrgInfoAdapter class - org\_info library - Dart API







menu

1. [talawa](../../index.html)
2. [models/organization/org\_info.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_models_organization_org_info/)
3. [OrgInfoAdapter](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_models_organization_org_info/OrgInfoAdapter-class.html)
4. operator == method

operator ==


dark\_mode

light\_mode




# operator == method


1. @[override](https://api.flutter.dev/flutter/dart-core/override-constant.html)

[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)
operator ==(

1. [Object](https://api.flutter.dev/flutter/dart-core/Object-class.html) other

)
override

The equality operator.

The default behavior for all [Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)s is to return true if and
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
the [hashCode](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_models_organization_org_info/OrgInfoAdapter/hashCode.html) method as well to maintain consistency.


## Implementation

```
@override
bool operator ==(Object other) =>
    identical(this, other) ||
    other is OrgInfoAdapter &&
        runtimeType == other.runtimeType &&
        typeId == other.typeId;
```

 


1. [talawa](../../index.html)
2. [org\_info](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_models_organization_org_info/)
3. [OrgInfoAdapter](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_models_organization_org_info/OrgInfoAdapter-class.html)
4. operator == method

##### OrgInfoAdapter class





talawa
1.0.0+1






