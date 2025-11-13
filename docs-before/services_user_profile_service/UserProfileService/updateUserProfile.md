<div id="overlay-under-drawer">

</div>

<div id="title">

<span id="sidenav-left-toggle" class="material-symbols-outlined"
role="button" tabindex="0">menu</span>

1.  [talawa](../../index.md)
2.  [services/user_profile_service.dart](../../services_user_profile_service/)
3.  [UserProfileService](../../services_user_profile_service/UserProfileService-class.md)
4.  updateUserProfile method

<div class="self-name">

updateUserProfile

</div>

<span id="dark-theme-button" class="material-symbols-outlined"
aria-hidden="true"> dark_mode </span> <span id="light-theme-button"
class="material-symbols-outlined" aria-hidden="true"> light_mode </span>

</div>

<div role="main">

<div id="dartdoc-main-content" class="main-content"
above-sidebar="services_user_profile_service/UserProfileService-class-sidebar.html"
below-sidebar="">

<div>

# <span class="kind-method">updateUserProfile</span> method

</div>

<div class="section multi-line-signature">

<span class="returntype">[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<span class="signature">\<<span class="type-parameter">[QueryResult](https://pub.dev/documentation/graphql/5.2.1/graphql/QueryResult-class.html)<span class="signature">\<<span class="type-parameter">[Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)?</span>\></span></span>\></span></span>
<span class="name">updateUserProfile</span>(

1.  <span id="updateUserProfile-param-variables"
    class="parameter"><span class="type-annotation">[Map](https://api.flutter.dev/flutter/dart-core/Map-class.md)<span class="signature">\<<span class="type-parameter">[String](https://api.flutter.dev/flutter/dart-core/String-class.html)</span>,
    <span class="type-parameter">dynamic</span>\></span>?</span>
    <span class="parameter-name">variables</span></span>

)

</div>

<div class="section desc markdown">

Updates the user profile using a GraphQL mutation.

**params**:

- `variables`: A map of key-value pairs representing the variables
  required for the GraphQL mutation. If `null`, the mutation is
  performed without additional variables.

**returns**:

- `Future<QueryResult<Object?>>`: which contains the result of the
  GraphQL mutation.

</div>

<div id="source" class="section summary source-code">

## Implementation

``` language-dart
Future<QueryResult<Object?>> updateUserProfile(
  Map<String, dynamic>? variables,
) 
```

</div>

</div>

<div id="dartdoc-sidebar-left" class="sidebar sidebar-offcanvas-left">

<div id="header-search-sidebar" class="hidden-l">

</div>

1.  [talawa](../../index.md)
2.  [user_profile_service](../../services_user_profile_service/)
3.  [UserProfileService](../../services_user_profile_service/UserProfileService-class.md)
4.  updateUserProfile method

##### UserProfileService class

<div id="dartdoc-sidebar-left-content">

</div>

</div>

<div id="dartdoc-sidebar-right" class="sidebar sidebar-offcanvas-right">

</div>

</div>

<span class="no-break"> talawa 1.0.0+1 </span>
