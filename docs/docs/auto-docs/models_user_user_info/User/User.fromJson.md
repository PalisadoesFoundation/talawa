
<div>

# User.fromJson constructor

</div>


User.fromJson(

1.  [[[Map](https://api.flutter.dev/flutter/dart-core/Map-class.md)[\<[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)],
    dynamic\>]]
    json, {]
2.  [[[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]
    fromOrg = false,
    ]

})



## Implementation

``` language-dart
factory User.fromJson(Map<String, dynamic> json, {bool fromOrg = false}) {
  final Map<String, dynamic> userData =
      json['user'] != null ? json['user'] as Map<String, dynamic> : {};
  final String? fullName = userData['name'] as String?;
  final List<String>? nameParts = fullName?.split(' ');
  final String? firstName =
      nameParts != null && nameParts.isNotEmpty ? nameParts[0] : null;
  final String? lastName = nameParts != null && nameParts.length > 1
      ? nameParts.sublist(1).join(' ')
      : null;

  return User(
    authToken: json['authenticationToken'] != null
        ? json['authenticationToken'] as String?
        : null,
    refreshToken: fromOrg ? ' ' : json['refreshToken'] as String?,
    id: userData['id'] as String?,
    firstName: firstName,
    lastName: lastName,
    email: userData['emailAddress'] != null
        ? userData['emailAddress'] as String?
        : null,
    image: userData['avatarURL'] != null
        ? userData['avatarURL'] as String?
        : null,
    joinedOrganizations: userData['joinedOrganizations'] != null
        ? (userData['joinedOrganizations'] as List<dynamic>)
            .map((e) => OrgInfo.fromJson(e as Map<String, dynamic>))
            .
        : [],
  );
}
```







1.  [talawa](../../index.md)
2.  [user_info](../../models_user_user_info/)
3.  [User](../../models_user_user_info/User-class.md)
4.  User.fromJson factory constructor

##### User class







