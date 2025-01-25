




OrgInfo.fromJson constructor - OrgInfo - org\_info library - Dart API







menu

1. [talawa](../../index.html)
2. [models/organization/org\_info.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_models_organization_org_info/)
3. [OrgInfo](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_models_organization_org_info/OrgInfo-class.html)
4. OrgInfo.fromJson factory constructor

OrgInfo.fromJson


dark\_mode

light\_mode




# OrgInfo.fromJson constructor


OrgInfo.fromJson(

1. [Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)<[String](https://api.flutter.dev/flutter/dart-core/String-class.html), dynamic> json1, {
2. [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html) memberRequest = false,

})

## Implementation

```
factory OrgInfo.fromJson(
  Map<String, dynamic> json1, {
  bool memberRequest = false,
}) {
  Map<String, dynamic> json;
  if (memberRequest) {
    json = json1['organization'] as Map<String, dynamic>;
  } else {
    json = json1;
  }
  return OrgInfo(
    id: json['_id'] != null ? json['_id'] as String : null,
    image: json['image'] != null ? json['image'] as String? : null,
    name: json['name'] != null ? json['name'] as String? : null,
    description:
        json['description'] != null ? json['description'] as String? : null,
    userRegistrationRequired: json['userRegistrationRequired'] != null
        ? json['userRegistrationRequired'] as bool?
        : null,
    creatorInfo: json['creator'] != null
        ? User.fromJson(
            json['creator'] as Map<String, dynamic>,
            fromOrg: true,
          )
        : null,
    members: json['members'] != null
        ? (json['members'] as List<dynamic>?)
            ?.map(
              (e) => User.fromJson(e as Map<String, dynamic>, fromOrg: true),
            )
            .toList()
        : null,
    admins: json['admins'] != null
        ? (json['admins'] as List<dynamic>?)
            ?.map(
              (e) => User.fromJson(e as Map<String, dynamic>, fromOrg: true),
            )
            .toList()
        : null,
    address: json['address'] != null
        ? Address.fromJson(json['address'] as Map<String, dynamic>)
        : null,
  );
}
```

 


1. [talawa](../../index.html)
2. [org\_info](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_models_organization_org_info/)
3. [OrgInfo](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_models_organization_org_info/OrgInfo-class.html)
4. OrgInfo.fromJson factory constructor

##### OrgInfo class





talawa
1.0.0+1






