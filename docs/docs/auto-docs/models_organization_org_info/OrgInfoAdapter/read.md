
<div>

# read method

</div>


<div>

1.  @[override](https://api.flutter.dev/flutter/dart-core/override-constant.html)

</div>

[[OrgInfo](../../models_organization_org_info/OrgInfo-class.html)]
read(

1.  [[[BinaryReader](https://pub.dev/documentation/hive/2.2.3/hive/BinaryReader-class.html)]
    reader]

)


override




Is called when a value has to be decoded.



## Implementation

``` language-dart
@override
OrgInfo read(BinaryReader reader) {
  final numOfFields = reader.;
  final fields = <int, dynamic>{
    for (int i = 0; i < numOfFields; i++) reader.: reader.,
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







1.  [talawa](../../index.html)
2.  [org_info](../../models_organization_org_info/)
3.  [OrgInfoAdapter](../../models_organization_org_info/OrgInfoAdapter-class.html)
4.  read method

##### OrgInfoAdapter class







