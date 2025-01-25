




write method - OrgInfoAdapter class - org\_info library - Dart API







menu

1. [talawa](../../index.html)
2. [models/organization/org\_info.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_models_organization_org_info/)
3. [OrgInfoAdapter](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_models_organization_org_info/OrgInfoAdapter-class.html)
4. write method

write


dark\_mode

light\_mode




# write method


1. @[override](https://api.flutter.dev/flutter/dart-core/override-constant.html)

void
write(

1. dynamic writer,
2. [OrgInfo](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_models_organization_org_info/OrgInfo-class.html) obj

)

## Implementation

```
@override
void write(BinaryWriter writer, OrgInfo obj) {
  writer
    ..writeByte(9)
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
    ..write(obj.userRegistrationRequired)
    ..writeByte(7)
    ..write(obj.creatorInfo)
    ..writeByte(8)
    ..write(obj.address);
}
```

 


1. [talawa](../../index.html)
2. [org\_info](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_models_organization_org_info/)
3. [OrgInfoAdapter](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_models_organization_org_info/OrgInfoAdapter-class.html)
4. write method

##### OrgInfoAdapter class





talawa
1.0.0+1






