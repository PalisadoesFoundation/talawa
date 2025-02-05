


# toJson method








[Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)&lt;[String](https://api.flutter.dev/flutter/dart-core/String-class.html), dynamic> toJson
()





<p>Convert dart object to json.</p>
<p><strong>params</strong>:
  None</p>
<p><strong>returns</strong>:</p>
<ul>
<li><code>Map&lt;String, dynamic&gt;</code>: json is returned.</li>
</ul>



## Implementation

```dart
Map<String, dynamic> toJson() {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['_id'] = this.sId;
  return data;
}
```







