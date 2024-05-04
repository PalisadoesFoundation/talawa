


# operator == method







- @[override](https://api.flutter.dev/flutter/dart-core/override-constant.html)

[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html) operator ==
([Object](https://api.flutter.dev/flutter/dart-core/Object-class.html) other)

_<span class="feature">override</span>_



<p>The equality operator.</p>
<p>The default behavior for all <a href="https://api.flutter.dev/flutter/dart-core/Object-class.html">Object</a>s is to return true if and
only if this object and <code>other</code> are the same object.</p>
<p>Override this method to specify a different equality relation on
a class. The overriding method must still be an equivalence relation.
That is, it must be:</p>
<ul>
<li>
<p>Total: It must return a boolean for all arguments. It should never throw.</p>
</li>
<li>
<p>Reflexive: For all objects <code>o</code>, <code>o == o</code> must be true.</p>
</li>
<li>
<p>Symmetric: For all objects <code>o1</code> and <code>o2</code>, <code>o1 == o2</code> and <code>o2 == o1</code> must
either both be true, or both be false.</p>
</li>
<li>
<p>Transitive: For all objects <code>o1</code>, <code>o2</code>, and <code>o3</code>, if <code>o1 == o2</code> and
<code>o2 == o3</code> are true, then <code>o1 == o3</code> must be true.</p>
</li>
</ul>
<p>The method should also be consistent over time,
so whether two objects are equal should only change
if at least one of the objects was modified.</p>
<p>If a subclass overrides the equality operator, it should override
the <a href="../../models_organization_org_info/OrgInfoAdapter/hashCode.md">hashCode</a> method as well to maintain consistency.</p>



## Implementation

```dart
@override
bool operator ==(Object other) =>
    identical(this, other) ||
    other is OrgInfoAdapter &&
        runtimeType == other.runtimeType &&
        typeId == other.typeId;
```







