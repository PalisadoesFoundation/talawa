::: {#overlay-under-drawer}
:::

::: {#title}
[menu]{#sidenav-left-toggle .material-symbols-outlined role="button"
tabindex="0"}

1.  [talawa](../../index.html)
2.  [models/user/user_info.dart](../../models_user_user_info/)
3.  [User](../../models_user_user_info/User-class.html)
4.  User.fromJson factory constructor

::: self-name
User.fromJson
:::

::: {#theme-button .toggle title="Toggle brightness"}
[ dark_mode ]{#dark-theme-button .material-symbols-outlined} [
light_mode ]{#light-theme-button .material-symbols-outlined}
:::
:::

::: {role="main"}
::: {#dartdoc-main-content .main-content above-sidebar="models_user_user_info/User-class-sidebar.html" below-sidebar=""}
<div>

# [User.fromJson]{.kind-constructor} constructor

</div>

::: {.section .multi-line-signature}
[User.fromJson]{.name}(

1.  [[[Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)[\<[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-parameter},
    [dynamic]{.type-parameter}\>]{.signature}]{.type-annotation}
    [json1]{.parameter-name}, {]{#fromJson-param-json1 .parameter}
2.  [[[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]{.type-annotation}
    [fromOrg]{.parameter-name} = [false]{.default-value},
    ]{#fromJson-param-fromOrg .parameter}

})
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
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
:::
:::

::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../../index.html)
2.  [user_info](../../models_user_user_info/)
3.  [User](../../models_user_user_info/User-class.html)
4.  User.fromJson factory constructor

##### User class

::: {#dartdoc-sidebar-left-content}
:::
:::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
:::

[ talawa 1.0.0+1 ]{.no-break}
