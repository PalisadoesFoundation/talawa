


# Comments.fromJson constructor







Comments.fromJson([Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)&lt;[String](https://api.flutter.dev/flutter/dart-core/String-class.html), dynamic> json)


<p>Convert json to dart object.</p>
<p>params:
None
returns:</p>
<ul>
<li><code>Map&lt;String, dynamic&gt;</code>: Dart object is returned.</li>
</ul>



## Implementation

```dart
Comments.fromJson(Map<String, dynamic> json) {
  sId = json['_id'] as String?;
}
```







