


# write method







- @[override](https://api.flutter.dev/flutter/dart-core/override-constant.html)

void write
([BinaryWriter](https://pub.dev/documentation/hive/2.2.3/hive/BinaryWriter-class.html) writer, [OrgInfo](../../models_organization_org_info/OrgInfo-class.md) obj)

_<span class="feature">override</span>_



<p>Is called when a value has to be encoded.</p>



## Implementation

```dart
@override
void write(BinaryWriter writer, OrgInfo obj) {
  writer
    ..writeByte(8)
    ..writeByte(0)
    ..write(obj.image)
    ..writeByte(1)
    ..write(obj.id)
    ..writeByte(2)
    ..write(obj.name)
    ..writeByte(3)
    ..write(obj.admins)
    ..writeByte(4)
    ..write(obj.members)
    ..writeByte(5)
    ..write(obj.description)
    ..writeByte(6)
    ..write(obj.isPublic)
    ..writeByte(7)
    ..write(obj.creatorInfo);
}
```







