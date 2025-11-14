<div id="overlay-under-drawer">

</div>

<div id="title">

<span id="sidenav-left-toggle" class="material-symbols-outlined"
role="button" tabindex="0">menu</span>

1.  [talawa](../../index.md)
2.  [queries](../../utils_queries/utils_queries-library.md)
3.  [Queries](../../utils_queries/Queries-class.md)
4.  registerUser method

<div class="self-name">

registerUser

</div>

<div id="theme-button" class="toggle">

<span id="dark-theme-button" class="material-symbols-outlined">
brightness_4 </span> <span id="light-theme-button"
class="material-symbols-outlined"> brightness_5 </span>

</div>

</div>

<div role="main">

<div id="dartdoc-main-content" class="main-content"
above-sidebar="utils_queries/Queries-class-sidebar.html"
below-sidebar="">

<div>

# <span class="kind-method">registerUser</span> method

</div>

<div class="section multi-line-signature">

<span class="returntype">[String](https://api.flutter.dev/flutter/dart-core/String-class.html)</span>
<span class="name">registerUser</span>(

1.  <span id="registerUser-param-firstName"
    class="parameter"><span class="type-annotation">[String](https://api.flutter.dev/flutter/dart-core/String-class.md)</span>
    <span class="parameter-name">firstName</span>, </span>
2.  <span id="registerUser-param-lastName"
    class="parameter"><span class="type-annotation">[String](https://api.flutter.dev/flutter/dart-core/String-class.html)</span>
    <span class="parameter-name">lastName</span>, </span>
3.  <span id="registerUser-param-email"
    class="parameter"><span class="type-annotation">[String](https://api.flutter.dev/flutter/dart-core/String-class.html)</span>
    <span class="parameter-name">email</span>, </span>
4.  <span id="registerUser-param-password"
    class="parameter"><span class="type-annotation">[String](https://api.flutter.dev/flutter/dart-core/String-class.html)</span>
    <span class="parameter-name">password</span>, </span>
5.  <span id="registerUser-param-selectedOrganization"
    class="parameter"><span class="type-annotation">[String](https://api.flutter.dev/flutter/dart-core/String-class.html)?</span>
    <span class="parameter-name">selectedOrganization</span></span>

)

</div>

<div class="section desc markdown">

Mutation to register a user.

**params**:

- `firstName`: user's data.
- `lastName`: user's data.
- `email`: user's data.
- `password`: user's data.
- `selectedOrganization`: ID of the selected organization.

**returns**:

- `String`: Return the mutation in string type to be passed to graphql
  client.

</div>

<div id="source" class="section summary source-code">

## Implementation

``` language-dart
String registerUser(
  String firstName,
  String lastName,
  String email,
  String password,
  String? selectedOrganization,
) 
```

</div>

</div>

<div id="dartdoc-sidebar-left" class="sidebar sidebar-offcanvas-left">

<div id="header-search-sidebar" class="hidden-l">

</div>

1.  [talawa](../../index.md)
2.  [queries](../../utils_queries/utils_queries-library.md)
3.  [Queries](../../utils_queries/Queries-class.md)
4.  registerUser method

##### Queries class

</div>

<div id="dartdoc-sidebar-right" class="sidebar sidebar-offcanvas-right">

</div>

</div>

<span class="no-break"> talawa 1.0.0+1 </span>
