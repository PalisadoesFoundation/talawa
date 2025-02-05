


# read method







- @[override](https://api.flutter.dev/flutter/dart-core/override-constant.html)

[User](../../models_user_user_info/User-class.md) read
([BinaryReader](https://pub.dev/documentation/hive/2.2.3/hive/BinaryReader-class.html) reader)

_<span class="feature">override</span>_



<p>Is called when a value has to be decoded.</p>



## Implementation

```dart
@override
User read(BinaryReader reader) {
  final numOfFields = reader.readByte();
  final fields = <int, dynamic>{
    for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
  };
  return User(
    adminFor: (fields[9] as List?)?.cast<OrgInfo>(),
    createdOrganizations: (fields[8] as List?)?.cast<OrgInfo>(),
    email: fields[5] as String?,
    firstName: fields[3] as String?,
    id: fields[2] as String?,
    image: fields[6] as String?,
    joinedOrganizations: (fields[7] as List?)?.cast<OrgInfo>(),
    lastName: fields[4] as String?,
    authToken: fields[0] as String?,
    refreshToken: fields[1] as String?,
    membershipRequests: (fields[10] as List?)?.cast<OrgInfo>(),
  );
}
```







