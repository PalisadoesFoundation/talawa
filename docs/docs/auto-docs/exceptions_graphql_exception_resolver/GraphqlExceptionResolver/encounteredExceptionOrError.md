<div id="overlay-under-drawer">

</div>

<div id="title">

<span id="sidenav-left-toggle" class="material-symbols-outlined"
role="button" tabindex="0">menu</span>

1.  [talawa](../../index.md)
2.  [exceptions/graphql_exception_resolver.dart](../../exceptions_graphql_exception_resolver/exceptions_graphql_exception_resolver-library.md)
3.  [GraphqlExceptionResolver](../../exceptions_graphql_exception_resolver/GraphqlExceptionResolver-class.md)
4.  encounteredExceptionOrError static method

<div class="self-name">

encounteredExceptionOrError

</div>

<div id="theme-button" class="toggle" title="Toggle brightness">

<span id="dark-theme-button" class="material-symbols-outlined">
dark_mode </span> <span id="light-theme-button"
class="material-symbols-outlined"> light_mode </span>

</div>

</div>

<div role="main">

<div id="dartdoc-main-content" class="main-content"
above-sidebar="exceptions_graphql_exception_resolver/GraphqlExceptionResolver-class-sidebar.html"
below-sidebar="">

<div>

# <span class="kind-method">encounteredExceptionOrError</span> static method

</div>

<div class="section multi-line-signature">

<span class="returntype">[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)?</span>
<span class="name">encounteredExceptionOrError</span>(

1.  <span id="encounteredExceptionOrError-param-exception"
    class="parameter"><span class="type-annotation">[OperationException](https://pub.dev/documentation/graphql/5.2.1/graphql/OperationException-class.md)</span>
    <span class="parameter-name">exception</span>, )

</div>

<div class="section desc markdown">

This function is used to check if any exceptions or error encountered.
The return type is `boolean`.

**params**:

- `exception`: OperationException which occur when calling for graphql
  post request
- `showSnackBar`: Tell if the the place where this function is called
  wants a SnackBar on error

**returns**:

- `bool?`: returns a bool whether or not their is error, can be null

</div>

<div id="source" class="section summary source-code">

## Implementation

``` language-dart
static bool? encounteredExceptionOrError(
  OperationException exception, ) 
```

</div>

</div>

<div id="dartdoc-sidebar-left" class="sidebar sidebar-offcanvas-left">

<div id="header-search-sidebar" class="hidden-l">

</div>

1.  [talawa](../../index.md)
2.  [graphql_exception_resolver](../../exceptions_graphql_exception_resolver/exceptions_graphql_exception_resolver-library.md)
3.  [GraphqlExceptionResolver](../../exceptions_graphql_exception_resolver/GraphqlExceptionResolver-class.md)
4.  encounteredExceptionOrError static method

##### GraphqlExceptionResolver class

<div id="dartdoc-sidebar-left-content">

</div>

</div>

<div id="dartdoc-sidebar-right" class="sidebar sidebar-offcanvas-right">

</div>

</div>

<span class="no-break"> talawa 1.0.0+1 </span>
