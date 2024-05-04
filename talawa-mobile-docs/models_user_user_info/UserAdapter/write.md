


# write method







- @[override](https://api.flutter.dev/flutter/dart-core/override-constant.html)

void write
([BinaryWriter](https://pub.dev/documentation/hive/2.2.3/hive/BinaryWriter-class.html) writer, [User](../../models_user_user_info/User-class.md) obj)

_<span class="feature">override</span>_



<p>Is called when a value has to be encoded.</p>



## Implementation

```dart
@override
void write(BinaryWriter writer, User obj) {
  writer
    ..writeByte(11)
    ..writeByte(0)
    ..write(obj.authToken)
    ..writeByte(1)
    ..write(obj.refreshToken)
    ..writeByte(2)
    ..write(obj.id)
    ..writeByte(3)
    ..write(obj.firstName)
    ..writeByte(4)
    ..write(obj.lastName)
    ..writeByte(5)
    ..write(obj.email)
    ..writeByte(6)
    ..write(obj.image)
    ..writeByte(7)
    ..write(obj.joinedOrganizations)
    ..writeByte(8)
    ..write(obj.createdOrganizations)
    ..writeByte(9)
    ..write(obj.adminFor)
    ..writeByte(10)
    ..write(obj.membershipRequests);
}
```







