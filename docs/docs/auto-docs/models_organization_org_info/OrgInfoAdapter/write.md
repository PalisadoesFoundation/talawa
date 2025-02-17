
<div>

# write method

</div>


<div>

1.  @[override](https://api.flutter.dev/flutter/dart-core/override-constant.html)

</div>

void write(

1.  [[[BinaryWriter](https://pub.dev/documentation/hive/2.2.3/hive/BinaryWriter-class.md)]
    writer, ]
2.  [[[OrgInfo](../../models_organization_org_info/OrgInfo-class.md)]
    obj]

)


override




Is called when a value has to be encoded.



## Implementation

``` language-dart
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







1.  [talawa](../../index.md)
2.  [org_info](../../models_organization_org_info/)
3.  [OrgInfoAdapter](../../models_organization_org_info/OrgInfoAdapter-class.md)
4.  write method

##### OrgInfoAdapter class







