




write method - UserAdapter class - user\_info library - Dart API







menu

1. [talawa](../../index.html)
2. [models/user/user\_info.dart](../../models_user_user_info/models_user_user_info-library.html)
3. [UserAdapter](../../models_user_user_info/UserAdapter-class.html)
4. write method

write


dark\_mode

light\_mode




# write method


1. @override

void
write(

1. [BinaryWriter](https://pub.dev/documentation/hive/2.2.3/hive/BinaryWriter-class.html) writer,
2. [User](../../models_user_user_info/User-class.html) obj

)
override

Is called when a value has to be encoded.


## Implementation

```
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

 


1. [talawa](../../index.html)
2. [user\_info](../../models_user_user_info/models_user_user_info-library.html)
3. [UserAdapter](../../models_user_user_info/UserAdapter-class.html)
4. write method

##### UserAdapter class





talawa
1.0.0+1






