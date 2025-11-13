<div id="overlay-under-drawer">

</div>

<div id="title">

<span id="sidenav-left-toggle" class="material-symbols-outlined"
role="button" tabindex="0">menu</span>

1.  [talawa](../../index.md)
2.  [utils/queries.dart](../../utils_queries/utils_queries-library.md)
3.  [Queries](../../utils_queries/Queries-class.md)
4.  loginUser method

<div class="self-name">

loginUser

</div>

<div id="theme-button" class="toggle" title="Toggle brightness">

<span id="dark-theme-button" class="material-symbols-outlined">
dark_mode </span> <span id="light-theme-button"
class="material-symbols-outlined"> light_mode </span>

</div>

</div>

<div role="main">

<div id="dartdoc-main-content" class="main-content"
above-sidebar="utils_queries/Queries-class-sidebar.html"
below-sidebar="">

<div>

# <span class="kind-method">loginUser</span> method

</div>

<div class="section multi-line-signature">

<span class="returntype">[String](https://api.flutter.dev/flutter/dart-core/String-class.html)</span>
<span class="name">loginUser</span>(

1.  <span id="loginUser-param-email"
    class="parameter"><span class="type-annotation">[String](https://api.flutter.dev/flutter/dart-core/String-class.md)</span>
    <span class="parameter-name">email</span>, </span>
2.  <span id="loginUser-param-password"
    class="parameter"><span class="type-annotation">[String](https://api.flutter.dev/flutter/dart-core/String-class.html)</span>
    <span class="parameter-name">password</span></span>

)

</div>

<div class="section desc markdown">

mutation to login the user.

**params**:

- `email`: user's data
- `password`: user's data

**returns**:

- `String`: mutation in string form, to be passed on to graphql client.

</div>

<div id="source" class="section summary source-code">

## Implementation

``` language-dart
String loginUser(String email, String password) 
```

</div>

</div>

<div id="dartdoc-sidebar-left" class="sidebar sidebar-offcanvas-left">

<div id="header-search-sidebar" class="hidden-l">

</div>

1.  [talawa](../../index.md)
2.  [queries](../../utils_queries/utils_queries-library.md)
3.  [Queries](../../utils_queries/Queries-class.md)
4.  loginUser method

##### Queries class

<div id="dartdoc-sidebar-left-content">

</div>

</div>

<div id="dartdoc-sidebar-right" class="sidebar sidebar-offcanvas-right">

</div>

</div>

<span class="no-break"> talawa 1.0.0+1 </span>
