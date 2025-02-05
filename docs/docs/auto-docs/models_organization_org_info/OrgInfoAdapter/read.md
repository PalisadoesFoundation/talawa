


# read method







- @[override](https://api.flutter.dev/flutter/dart-core/override-constant.html)

[OrgInfo](../../models_organization_org_info/OrgInfo-class.md) read
([BinaryReader](https://pub.dev/documentation/hive/2.2.3/hive/BinaryReader-class.html) reader)

_<span class="feature">override</span>_



<p>Is called when a value has to be decoded.</p>



## Implementation

```dart
@override
OrgInfo read(BinaryReader reader) {
  final numOfFields = reader.readByte();
  final fields = <int, dynamic>{
    for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
  };
  return OrgInfo(
    admins: (fields[3] as List?)?.cast<User>(),
    members: (fields[4] as List?)?.cast<User>(),
    creatorInfo: fields[7] as User?,
    description: fields[5] as String?,
    id: fields[1] as String?,
    image: fields[0] as String?,
    isPublic: fields[6] as bool?,
    name: fields[2] as String?,
  );
}
```







