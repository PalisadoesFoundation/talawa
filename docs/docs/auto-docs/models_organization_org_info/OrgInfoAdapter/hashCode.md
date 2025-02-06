


# hashCode property









**Annotations**

- @[override](https://api.flutter.dev/flutter/dart-core/override-constant.html)
[int](https://api.flutter.dev/flutter/dart-core/int-class.html) hashCode
  
_<span class="feature">override</span>_



<p>The hash code for this object.</p>
<p>A hash code is a single integer which represents the state of the object
that affects <a href="../../models_organization_org_info/OrgInfoAdapter/operator_equals.md">operator ==</a> comparisons.</p>
<p>All objects have hash codes.
The default hash code implemented by <a href="https://api.flutter.dev/flutter/dart-core/Object-class.html">Object</a>
represents only the identity of the object,
the same way as the default <a href="../../models_organization_org_info/OrgInfoAdapter/operator_equals.md">operator ==</a> implementation only considers objects
equal if they are identical (see <a href="https://api.flutter.dev/flutter/dart-core/identityHashCode.html">identityHashCode</a>).</p>
<p>If <a href="../../models_organization_org_info/OrgInfoAdapter/operator_equals.md">operator ==</a> is overridden to use the object state instead,
the hash code must also be changed to represent that state,
otherwise the object cannot be used in hash based data structures
like the default <a href="https://api.flutter.dev/flutter/dart-core/Set-class.html">Set</a> and <a href="https://api.flutter.dev/flutter/dart-core/Map-class.html">Map</a> implementations.</p>
<p>Hash codes must be the same for objects that are equal to each other
according to <a href="../../models_organization_org_info/OrgInfoAdapter/operator_equals.md">operator ==</a>.
The hash code of an object should only change if the object changes
in a way that affects equality.
There are no further requirements for the hash codes.
They need not be consistent between executions of the same program
and there are no distribution guarantees.</p>
<p>Objects that are not equal are allowed to have the same hash code.
It is even technically allowed that all instances have the same hash code,
but if clashes happen too often,
it may reduce the efficiency of hash-based data structures
like <a href="https://api.flutter.dev/flutter/dart-collection/HashSet-class.html">HashSet</a> or <a href="https://api.flutter.dev/flutter/dart-collection/HashMap-class.html">HashMap</a>.</p>
<p>If a subclass overrides <a href="../../models_organization_org_info/OrgInfoAdapter/hashCode.md">hashCode</a>, it should override the
<a href="../../models_organization_org_info/OrgInfoAdapter/operator_equals.md">operator ==</a> operator as well to maintain consistency.</p>



## Implementation

```dart
@override
int get hashCode => typeId.hashCode;
```








