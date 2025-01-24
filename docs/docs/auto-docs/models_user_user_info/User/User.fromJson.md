




User.fromJson constructor - User - user\_info library - Dart API







menu

1. [talawa](../../index.html)
2. [models/user/user\_info.dart](../../models_user_user_info/models_user_user_info-library.html)
3. [User](../../models_user_user_info/User-class.html)
4. User.fromJson factory constructor

User.fromJson


dark\_mode

light\_mode




# User.fromJson constructor


User.fromJson(

1. Map<String, dynamic> json1, {
2. bool fromOrg = false,

})

## Implementation

```
factory User.fromJson(Map<String, dynamic> json1, {bool fromOrg = false}) {
  Map<String, dynamic> json;
  Map<String, dynamic>? appUserProfile;
  if (fromOrg) {
    json = json1;
    appUserProfile = json1;
  } else {
    json = json1['user'] as Map<String, dynamic>;
    appUserProfile = json1['appUserProfile'] as Map<String, dynamic>?;
  }

  return User(
    authToken: fromOrg ? ' ' : json1['accessToken'] as String?,
    refreshToken: fromOrg ? ' ' : json1['refreshToken'] as String?,
    id: json['_id'] as String?,
    firstName:
        json['firstName'] != null ? json['firstName'] as String? : null,
    lastName: json['lastName'] != null ? json['lastName'] as String? : null,
    email: json['email'] != null ? json['email'] as String? : null,
    image: json['image'] != null ? json['image'] as String? : null,
    adminFor: appUserProfile?['adminFor'] != null
        ? (appUserProfile!['adminFor'] as List<dynamic>)
            .map((e) => OrgInfo.fromJson(e as Map<String, dynamic>))
            .toList()
        : null,
    createdOrganizations: appUserProfile?['createdOrganizations'] != null
        ? (appUserProfile!['createdOrganizations'] as List<dynamic>)
            .map((e) => OrgInfo.fromJson(e as Map<String, dynamic>))
            .toList()
        : null,
    joinedOrganizations: json['joinedOrganizations'] != null
        ? (json['joinedOrganizations'] as List<dynamic>)
            .map((e) => OrgInfo.fromJson(e as Map<String, dynamic>))
            .toList()
        : null,
    membershipRequests: json['membershipRequests'] != null
        ? (json['membershipRequests'] as List<dynamic>)
            .map(
              (e) => OrgInfo.fromJson(
                e as Map<String, dynamic>,
                memberRequest: true,
              ),
            )
            .toList()
        : null,
  );
}
```

 


1. [talawa](../../index.html)
2. [user\_info](../../models_user_user_info/models_user_user_info-library.html)
3. [User](../../models_user_user_info/User-class.html)
4. User.fromJson factory constructor

##### User class





talawa
1.0.0+1






