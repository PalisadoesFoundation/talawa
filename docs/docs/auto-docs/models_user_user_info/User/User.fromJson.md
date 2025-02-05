


# User.fromJson constructor







User.fromJson([Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)&lt;[String](https://api.flutter.dev/flutter/dart-core/String-class.html), dynamic> json1, {[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html) fromOrg = false})





## Implementation

```dart
factory User.fromJson(Map<String, dynamic> json1, {bool fromOrg = false}) {
  Map<String, dynamic> json;
  if (fromOrg) {
    json = json1;
  } else {
    json = json1['user'] as Map<String, dynamic>;
  }
  return User(
    authToken: fromOrg ? ' ' : json1['accessToken'] as String?,
    refreshToken: fromOrg ? ' ' : json1['refreshToken'] as String?,
    id: json['_id'] as String?,
    firstName:
        json['firstName'] != null ? json['firstName'] as String? : null,
    lastName: json['lastName'] != null ? json['lastName'] as String? : null,
    email: json['email'] != null ? json['email'] as String? : null,
    image: json['image'] != null ? json['image'] as String? : null,
    adminFor: json['adminFor'] != null
        ? (json['adminFor'] as List<dynamic>?)
            ?.map((e) => OrgInfo.fromJson(e as Map<String, dynamic>))
            .toList()
        : null,
    createdOrganizations: json['createdOrganizations'] != null
        ? (json['createdOrganizations'] as List<dynamic>?)
            ?.map((e) => OrgInfo.fromJson(e as Map<String, dynamic>))
            .toList()
        : null,
    joinedOrganizations: json['joinedOrganizations'] != null
        ? (json['joinedOrganizations'] as List<dynamic>?)
            ?.map((e) => OrgInfo.fromJson(e as Map<String, dynamic>))
            .toList()
        : null,
    membershipRequests: json['membershipRequests'] != null
        ? (json['membershipRequests'] as List<dynamic>?)
            ?.map(
              (e) => OrgInfo.fromJson(
                e as Map<String, dynamic>,
                memberRequest: true,
              ),
            )
            .toList()
        : null,
  );
}
```







