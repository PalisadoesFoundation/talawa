




write method - OrgInfoAdapter class - org\_info library - Dart API







menu

1. [talawa](../../index.html)
2. [models/organization/org\_info.dart](../../models_organization_org_info/models_organization_org_info-library.html)
3. [OrgInfoAdapter](../../models_organization_org_info/OrgInfoAdapter-class.html)
4. write method

write


dark\_mode

light\_mode




# write method


1. @override

void
write(

1. [BinaryWriter](https://pub.dev/documentation/hive/2.2.3/hive/BinaryWriter-class.html) writer,
2. [OrgInfo](../../models_organization_org_info/OrgInfo-class.html) obj

)
override

Is called when a value has to be encoded.


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
2. [org\_info](../../models_organization_org_info/models_organization_org_info-library.html)
3. [OrgInfoAdapter](../../models_organization_org_info/OrgInfoAdapter-class.html)
4. write method

##### OrgInfoAdapter class





talawa
1.0.0+1






