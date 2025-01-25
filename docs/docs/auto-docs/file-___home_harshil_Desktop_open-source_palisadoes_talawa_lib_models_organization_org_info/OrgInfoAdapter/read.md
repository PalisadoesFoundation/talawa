




read method - OrgInfoAdapter class - org\_info library - Dart API







menu

1. [talawa](../../index.html)
2. [models/organization/org\_info.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_models_organization_org_info/)
3. [OrgInfoAdapter](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_models_organization_org_info/OrgInfoAdapter-class.html)
4. read method

read


dark\_mode

light\_mode




# read method


1. @[override](https://api.flutter.dev/flutter/dart-core/override-constant.html)

[OrgInfo](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_models_organization_org_info/OrgInfo-class.html)
read(

1. dynamic reader

)

## Implementation

```
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
    userRegistrationRequired: fields[6] as bool?,
    name: fields[2] as String?,
    address: fields[8] as Address?,
  );
}
```

 


1. [talawa](../../index.html)
2. [org\_info](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_models_organization_org_info/)
3. [OrgInfoAdapter](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_models_organization_org_info/OrgInfoAdapter-class.html)
4. read method

##### OrgInfoAdapter class





talawa
1.0.0+1






