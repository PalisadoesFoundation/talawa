<div id="overlay-under-drawer">

</div>

<div id="title">

<span id="sidenav-left-toggle" class="material-symbols-outlined"
role="button" tabindex="0">menu</span>

1.  [talawa](../../index.md)
2.  [services/user_profile_service.dart](../../services_user_profile_service/services_user_profile_service-library.md)
3.  [UserProfileService](../../services_user_profile_service/UserProfileService-class.md)
4.  getUserProfileInfo method

<div class="self-name">

getUserProfileInfo

</div>

<div id="theme-button" class="toggle" title="Toggle brightness">

<span id="dark-theme-button" class="material-symbols-outlined">
dark_mode </span> <span id="light-theme-button"
class="material-symbols-outlined"> light_mode </span>

</div>

</div>

<div role="main">

<div id="dartdoc-main-content" class="main-content"
above-sidebar="services_user_profile_service/UserProfileService-class-sidebar.html"
below-sidebar="">

<div>

# <span class="kind-method">getUserProfileInfo</span> method

</div>

<div class="section multi-line-signature">

<span class="returntype">[Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)<span class="signature">\<<span class="type-parameter">[QueryResult](https://pub.dev/documentation/graphql/5.2.1/graphql/QueryResult-class.html)<span class="signature">\<<span class="type-parameter">[Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)?</span>\></span></span>\></span></span>
<span class="name">getUserProfileInfo</span>(

1.  <span id="getUserProfileInfo-param-user"
    class="parameter"><span class="type-annotation">[User](../../models_user_user_info/User-class.md)</span>
    <span class="parameter-name">user</span></span>

)

</div>

<div class="section desc markdown">

Retrieves user profile information using a GraphQL query.

**params**:

- `user`: An instance of `User` representing the user whose profile
  information is to be fetched. The user's ID is used as a variable for
  the GraphQL query.

**returns**:

- `Future<QueryResult<Object?>>`: which contains the result of the
  GraphQL query.

</div>

<div id="source" class="section summary source-code">

## Implementation

``` language-dart
Future<QueryResult<Object?>> getUserProfileInfo(User user) async 
```

</div>

</div>

<div id="dartdoc-sidebar-left" class="sidebar sidebar-offcanvas-left">

<div id="header-search-sidebar" class="hidden-l">

</div>

1.  [talawa](../../index.md)
2.  [user_profile_service](../../services_user_profile_service/services_user_profile_service-library.md)
3.  [UserProfileService](../../services_user_profile_service/UserProfileService-class.md)
4.  getUserProfileInfo method

##### UserProfileService class

<div id="dartdoc-sidebar-left-content">

</div>

</div>

<div id="dartdoc-sidebar-right" class="sidebar sidebar-offcanvas-right">

</div>

</div>

<span class="no-break"> talawa 1.0.0+1 </span>
