
<div>

# OrgInfo.fromJson constructor

</div>


OrgInfo.fromJson(

1.  [[[Map](https://api.flutter.dev/flutter/dart-core/Map-class.md)[\<[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)],
    dynamic\>]]
    json1, {]
2.  [[[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]
    memberRequest = false,
    ]

})



## Implementation

``` language-dart
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
            .
        : null,
    admins: json['admins'] != null
        ? (json['admins'] as List<dynamic>?)
            ?.map(
              (e) => User.fromJson(e as Map<String, dynamic>, fromOrg: true),
            )
            .
        : null,
    address: json['address'] != null
        ? Address.fromJson(json['address'] as Map<String, dynamic>)
        : null,
  );
}
```







1.  [talawa](../../index.md)
2.  [org_info](../../models_organization_org_info/)
3.  [OrgInfo](../../models_organization_org_info/OrgInfo-class.md)
4.  OrgInfo.fromJson factory constructor

##### OrgInfo class







