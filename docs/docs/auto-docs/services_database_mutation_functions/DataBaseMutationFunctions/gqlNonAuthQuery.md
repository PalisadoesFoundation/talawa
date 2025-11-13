<div id="overlay-under-drawer">

</div>

<div id="title">

<span id="sidenav-left-toggle" class="material-symbols-outlined"
role="button" tabindex="0">menu</span>

1.  [talawa](../../index.md)
2.  [services/database_mutation_functions.dart](../../services_database_mutation_functions/services_database_mutation_functions-library.md)
3.  [DataBaseMutationFunctions](../../services_database_mutation_functions/DataBaseMutationFunctions-class.md)
4.  gqlNonAuthQuery method

<div class="self-name">

gqlNonAuthQuery

</div>

<div id="theme-button" class="toggle" title="Toggle brightness">

<span id="dark-theme-button" class="material-symbols-outlined">
dark_mode </span> <span id="light-theme-button"
class="material-symbols-outlined"> light_mode </span>

</div>

</div>

<div role="main">

<div id="dartdoc-main-content" class="main-content"
above-sidebar="services_database_mutation_functions/DataBaseMutationFunctions-class-sidebar.html"
below-sidebar="">

<div>

# <span class="kind-method">gqlNonAuthQuery</span> method

</div>

<div class="section multi-line-signature">

<span class="returntype">[Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)<span class="signature">\<<span class="type-parameter">[QueryResult](https://pub.dev/documentation/graphql/5.2.1/graphql/QueryResult-class.html)<span class="signature">\<<span class="type-parameter">[Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)?</span>\></span></span>\></span></span>
<span class="name">gqlNonAuthQuery</span>(

1.  <span id="gqlNonAuthQuery-param-query"
    class="parameter"><span class="type-annotation">[String](https://api.flutter.dev/flutter/dart-core/String-class.md)</span>
    <span class="parameter-name">query</span>, )

</div>

<div class="section desc markdown">

This function is used to run the graph-ql query for the non signed-in
user.

**params**:

- `query`: query is used to fetch data in graphql, for more info read
  graphql docs
- `variables`: variables to be passed with query

**returns**:

- `Future<QueryResult<Object?>>`: it returns Future of QueryResult,
  contains all data

</div>

<div id="source" class="section summary source-code">

## Implementation

``` language-dart
Future<QueryResult<Object?>> gqlNonAuthQuery(
  String query, ) async 
```

</div>

</div>

<div id="dartdoc-sidebar-left" class="sidebar sidebar-offcanvas-left">

<div id="header-search-sidebar" class="hidden-l">

</div>

1.  [talawa](../../index.md)
2.  [database_mutation_functions](../../services_database_mutation_functions/services_database_mutation_functions-library.md)
3.  [DataBaseMutationFunctions](../../services_database_mutation_functions/DataBaseMutationFunctions-class.md)
4.  gqlNonAuthQuery method

##### DataBaseMutationFunctions class

<div id="dartdoc-sidebar-left-content">

</div>

</div>

<div id="dartdoc-sidebar-right" class="sidebar sidebar-offcanvas-right">

</div>

</div>

<span class="no-break"> talawa 1.0.0+1 </span>
