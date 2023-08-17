


# CustomListTile constructor






const
CustomListTile({required [Key](https://api.flutter.dev/flutter/foundation/Key-class.html) key, required [int](https://api.flutter.dev/flutter/dart-core/int-class.html) index, required [TileType](../../enums_enums/TileType.md) type, [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html) showIcon = false, [OrgInfo](../../models_organization_org_info/OrgInfo-class.md)? orgInfo, dynamic onTapOrgInfo([OrgInfo](../../models_organization_org_info/OrgInfo-class.md))?, [User](../../models_user_user_info/User-class.md)? userInfo, dynamic onTapUserInfo()?, [Function](https://api.flutter.dev/flutter/dart-core/Function-class.html)? onTapOption, [Options](../../models_options_options/Options-class.md)? option})





## Implementation

```dart
const CustomListTile({
  required Key key,
  required this.index,
  required this.type,
  this.showIcon = false,
  this.orgInfo,
  this.onTapOrgInfo,
  this.userInfo,
  this.onTapUserInfo,
  this.onTapOption,
  this.option,
}) : super(key: key);
```







