<div id="overlay-under-drawer">

</div>

<div id="title">

<span id="sidenav-left-toggle" class="material-symbols-outlined"
role="button" tabindex="0">menu</span>

1.  [talawa](../../index.md)
2.  [services/org_service.dart](../../services_org_service/)
3.  [OrganizationService](../../services_org_service/OrganizationService-class.md)
4.  getOrgMembersList method

<div class="self-name">

getOrgMembersList

</div>

<span id="dark-theme-button" class="material-symbols-outlined"
aria-hidden="true"> dark_mode </span> <span id="light-theme-button"
class="material-symbols-outlined" aria-hidden="true"> light_mode </span>

</div>

<div role="main">

<div id="dartdoc-main-content" class="main-content"
above-sidebar="services_org_service/OrganizationService-class-sidebar.html"
below-sidebar="">

<div>

# <span class="kind-method">getOrgMembersList</span> method

</div>

<div class="section multi-line-signature">

<span class="returntype">[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<span class="signature">\<<span class="type-parameter">[List](https://api.flutter.dev/flutter/dart-core/List-class.html)<span class="signature">\<<span class="type-parameter">[User](../../models_user_user_info/User-class.md)</span>\></span></span>\></span></span>
<span class="name">getOrgMembersList</span>(

1.  <span id="getOrgMembersList-param-orgId"
    class="parameter"><span class="type-annotation">[String](https://api.flutter.dev/flutter/dart-core/String-class.md)</span>
    <span class="parameter-name">orgId</span></span>

)

</div>

<div class="section desc markdown">

Retrieves a list of organization members.

**params**:

- `orgId`: The ID of the organization to fetch members from.

**returns**:

- `Future<List<User>>`: A promise that will be fulfilled with the list
  of organization members.

</div>

<div id="source" class="section summary source-code">

## Implementation

``` language-dart
Future<List<User>> getOrgMembersList(String orgId) async 
```

</div>

</div>

<div id="dartdoc-sidebar-left" class="sidebar sidebar-offcanvas-left">

<div id="header-search-sidebar" class="hidden-l">

</div>

1.  [talawa](../../index.md)
2.  [org_service](../../services_org_service/)
3.  [OrganizationService](../../services_org_service/OrganizationService-class.md)
4.  getOrgMembersList method

##### OrganizationService class

<div id="dartdoc-sidebar-left-content">

</div>

</div>

<div id="dartdoc-sidebar-right" class="sidebar sidebar-offcanvas-right">

</div>

</div>

<span class="no-break"> talawa 1.0.0+1 </span>
