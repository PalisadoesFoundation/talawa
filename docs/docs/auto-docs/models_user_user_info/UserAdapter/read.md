




read method - UserAdapter class - user\_info library - Dart API







menu

1. [talawa](../../index.html)
2. [models/user/user\_info.dart](../../models_user_user_info/models_user_user_info-library.html)
3. [UserAdapter](../../models_user_user_info/UserAdapter-class.html)
4. read method

read


dark\_mode

light\_mode




# read method


1. @override

[User](../../models_user_user_info/User-class.html)
read(

1. [BinaryReader](https://pub.dev/documentation/hive/2.2.3/hive/BinaryReader-class.html) reader

)
override

Is called when a value has to be decoded.


## Implementation

```
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

 


1. [talawa](../../index.html)
2. [user\_info](../../models_user_user_info/models_user_user_info-library.html)
3. [UserAdapter](../../models_user_user_info/UserAdapter-class.html)
4. read method

##### UserAdapter class





talawa
1.0.0+1






