


# OrgInfo.fromJson constructor







OrgInfo.fromJson([Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)&lt;[String](https://api.flutter.dev/flutter/dart-core/String-class.html), dynamic> json1, {[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html) memberRequest = false})





## Implementation

```dart
factory OrgInfo.fromJson(
  Map<String, dynamic> json1, {
  bool memberRequest = false,
}) {
  Map<String, dynamic> json;
  if (memberRequest) {
    json = json1['organization'] as Map<String, dynamic>;
  } else {
    json = json1;
  }
  return OrgInfo(
    id: json['_id'] != null ? json['_id'] as String : null,
    image: json['image'] != null ? json['image'] as String? : null,
    name: json['name'] != null ? json['name'] as String? : null,
    description:
        json['description'] != null ? json['description'] as String? : null,
    isPublic: json['isPublic'] != null ? json['isPublic'] as bool? : null,
    creatorInfo: json['creator'] != null
        ? User.fromJson(
            json['creator'] as Map<String, dynamic>,
            fromOrg: true,
          )
        : null,
    members: json['members'] != null
        ? (json['members'] as List<dynamic>?)
            ?.map(
              (e) => User.fromJson(e as Map<String, dynamic>, fromOrg: true),
            )
            .toList()
        : null,
    admins: json['admins'] != null
        ? (json['admins'] as List<dynamic>?)
            ?.map(
              (e) => User.fromJson(e as Map<String, dynamic>, fromOrg: true),
            )
            .toList()
        : null,
  );
}
```







