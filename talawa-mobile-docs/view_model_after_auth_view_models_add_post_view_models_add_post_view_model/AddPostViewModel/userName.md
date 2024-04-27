


# userName property









[String](https://api.flutter.dev/flutter/dart-core/String-class.html) userName
  




<p>The Username.</p>
<p>params:
None
returns:</p>
<ul>
<li><code>String</code>: The username of the currentUser</li>
</ul>



## Implementation

```dart
String get userName => _currentUser.firstName! + _currentUser.lastName!;
```








