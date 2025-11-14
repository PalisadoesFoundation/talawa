<div id="overlay-under-drawer">

</div>

<div id="title">

<span id="sidenav-left-toggle" class="material-symbols-outlined"
role="button" tabindex="0">menu</span>

1.  [talawa](../../index.md)
2.  [fund_service](../../services_fund_service/services_fund_service-library.md)
3.  [FundService](../../services_fund_service/FundService-class.md)
4.  createPledge method

<div class="self-name">

createPledge

</div>

<div id="theme-button" class="toggle">

<span id="dark-theme-button" class="material-symbols-outlined">
brightness_4 </span> <span id="light-theme-button"
class="material-symbols-outlined"> brightness_5 </span>

</div>

</div>

<div role="main">

<div id="dartdoc-main-content" class="main-content"
above-sidebar="services_fund_service/FundService-class-sidebar.html"
below-sidebar="">

<div>

# <span class="kind-method">createPledge</span> method

</div>

<div class="section multi-line-signature">

<span class="returntype">[Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)<span class="signature">\<<span class="type-parameter">[QueryResult](https://pub.dev/documentation/graphql/5.2.1/graphql/QueryResult-class.html)<span class="signature">\<<span class="type-parameter">[Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)?</span>\></span></span>\></span></span>
<span class="name">createPledge</span>(

1.  <span id="createPledge-param-variables"
    class="parameter"><span class="type-annotation">[Map](https://api.flutter.dev/flutter/dart-core/Map-class.md)<span class="signature">\<<span class="type-parameter">[String](https://api.flutter.dev/flutter/dart-core/String-class.html)</span>,
    <span class="type-parameter">dynamic</span>\></span></span>
    <span class="parameter-name">variables</span></span>

)

</div>

<div class="section desc markdown">

This function is used to create a new pledge.

**params**:

- `variables`: A map of key-value pairs representing the variables
  required for the GraphQL mutation.

**returns**:

- `Future<QueryResult<Object?>>`: which contains the result of the
  GraphQL mutation.

</div>

<div id="source" class="section summary source-code">

## Implementation

``` language-dart
Future<QueryResult<Object?>> createPledge(
  Map<String, dynamic> variables,
) async 
```

</div>

</div>

<div id="dartdoc-sidebar-left" class="sidebar sidebar-offcanvas-left">

<div id="header-search-sidebar" class="hidden-l">

</div>

1.  [talawa](../../index.md)
2.  [fund_service](../../services_fund_service/services_fund_service-library.md)
3.  [FundService](../../services_fund_service/FundService-class.md)
4.  createPledge method

##### FundService class

</div>

<div id="dartdoc-sidebar-right" class="sidebar sidebar-offcanvas-right">

</div>

</div>

<span class="no-break"> talawa 1.0.0+1 </span>
