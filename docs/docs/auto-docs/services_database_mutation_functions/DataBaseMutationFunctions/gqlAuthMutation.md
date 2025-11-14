<div id="overlay-under-drawer">

</div>

<div id="title">

<span id="sidenav-left-toggle" class="material-symbols-outlined"
role="button" tabindex="0">menu</span>

1.  [talawa](../../index.md)
2.  [database_mutation_functions](../../services_database_mutation_functions/services_database_mutation_functions-library.md)
3.  [DataBaseMutationFunctions](../../services_database_mutation_functions/DataBaseMutationFunctions-class.md)
4.  gqlAuthMutation method

<div class="self-name">

gqlAuthMutation

</div>

<div id="theme-button" class="toggle">

<span id="dark-theme-button" class="material-symbols-outlined">
brightness_4 </span> <span id="light-theme-button"
class="material-symbols-outlined"> brightness_5 </span>

</div>

</div>

<div role="main">

<div id="dartdoc-main-content" class="main-content"
above-sidebar="services_database_mutation_functions/DataBaseMutationFunctions-class-sidebar.html"
below-sidebar="">

<div>

# <span class="kind-method">gqlAuthMutation</span> method

</div>

<div class="section multi-line-signature">

<span class="returntype">[Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)<span class="signature">\<<span class="type-parameter">[QueryResult](https://pub.dev/documentation/graphql/5.2.1/graphql/QueryResult-class.html)<span class="signature">\<<span class="type-parameter">[Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)?</span>\></span></span>\></span></span>
<span class="name">gqlAuthMutation</span>(

1.  <span id="gqlAuthMutation-param-mutation"
    class="parameter"><span class="type-annotation">[String](https://api.flutter.dev/flutter/dart-core/String-class.md)</span>
    <span class="parameter-name">mutation</span>, </span>
2.  <span id="gqlAuthMutation-param-variables"
    class="parameter"></span>

)

</div>

<div class="section desc markdown">

This function is used to run the graph-ql mutation for authenticated
user.

**params**:

- `mutation`: mutation is used to change/add/delete data in graphql, for
  more info read graphql docs
- `variables`: variables to be passed with mutation

**returns**:

- `Future<QueryResult<Object?>>`: it returns Future of dynamic

</div>

<div id="source" class="section summary source-code">

## Implementation

``` language-dart
Future<QueryResult<Object?>> gqlAuthMutation(
  String mutation, ) async 
```

</div>

</div>

<div id="dartdoc-sidebar-left" class="sidebar sidebar-offcanvas-left">

<div id="header-search-sidebar" class="hidden-l">

</div>

1.  [talawa](../../index.md)
2.  [database_mutation_functions](../../services_database_mutation_functions/services_database_mutation_functions-library.md)
3.  [DataBaseMutationFunctions](../../services_database_mutation_functions/DataBaseMutationFunctions-class.md)
4.  gqlAuthMutation method

##### DataBaseMutationFunctions class

</div>

<div id="dartdoc-sidebar-right" class="sidebar sidebar-offcanvas-right">

</div>

</div>

<span class="no-break"> talawa 1.0.0+1 </span>
