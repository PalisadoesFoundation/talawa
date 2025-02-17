:::::: {#dartdoc-main-content .main-content above-sidebar="models_user_user_info/User-class-sidebar.html" below-sidebar=""}
<div>

# [User.fromJson]{.kind-constructor} constructor

</div>

::: {.section .multi-line-signature}
[User.fromJson]{.name}(

1.  [[[Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)[\<[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-parameter},
    [dynamic]{.type-parameter}\>]{.signature}]{.type-annotation}
    [json]{.parameter-name}, {]{#fromJson-param-json .parameter}
2.  [[[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]{.type-annotation}
    [fromOrg]{.parameter-name} = [false]{.default-value},
    ]{#fromJson-param-fromOrg .parameter}

})
:::

::: {#source .section .summary .source-code}
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
            .toList()
        : [],
  );
}
```
:::
::::::

::::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../../index.html)
2.  [user_info](../../models_user_user_info/)
3.  [User](../../models_user_user_info/User-class.html)
4.  User.fromJson factory constructor

##### User class

::: {#dartdoc-sidebar-left-content}
:::
:::::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
