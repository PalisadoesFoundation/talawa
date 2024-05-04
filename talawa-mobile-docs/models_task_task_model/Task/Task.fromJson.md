


# Task.fromJson constructor







Task.fromJson([Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)&lt;[String](https://api.flutter.dev/flutter/dart-core/String-class.html), dynamic> json)


<p>/Creating a new Task instance from a map structure.</p>



## Implementation

```dart
factory Task.fromJson(
  Map<String, dynamic> json,
) {
  return Task(
    id: json['_id'] as String,
    title: json['title'] as String,
    creator: User.fromJson(
      json['creator'] as Map<String, dynamic>,
      fromOrg: true,
    ),
    event: Event.fromJson(
      json['event'] as Map<String, dynamic>,
    ),
    createdAt: json['createdAt'] as String,
    description: json['description'] as String?,
    deadline: json['deadline'] as String?,
  );
}
```







