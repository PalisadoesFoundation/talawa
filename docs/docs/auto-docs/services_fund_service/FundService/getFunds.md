<div id="overlay-under-drawer">

</div>

<div id="title">

<span id="sidenav-left-toggle" class="material-symbols-outlined"
role="button" tabindex="0">menu</span>

1.  [talawa](../../index.md)
2.  [services/fund_service.dart](../../services_fund_service/services_fund_service-library.md)
3.  [FundService](../../services_fund_service/FundService-class.md)
4.  getFunds method

<div class="self-name">

getFunds

</div>

<div id="theme-button" class="toggle" title="Toggle brightness">

<span id="dark-theme-button" class="material-symbols-outlined">
dark_mode </span> <span id="light-theme-button"
class="material-symbols-outlined"> light_mode </span>

</div>

</div>

<div role="main">

<div id="dartdoc-main-content" class="main-content"
above-sidebar="services_fund_service/FundService-class-sidebar.html"
below-sidebar="">

<div>

# <span class="kind-method">getFunds</span> method

</div>

<div class="section multi-line-signature">

<span class="returntype">[Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)<span class="signature">\<<span class="type-parameter">[Pair](../../utils_pair/Pair-class.md)<span class="signature">\<<span class="type-parameter">[List](https://api.flutter.dev/flutter/dart-core/List-class.html)<span class="signature">\<<span class="type-parameter">[Fund](../../models_funds_fund/Fund-class.md)</span>\></span></span>,
<span class="type-parameter">[PageInfo](../../models_page_info_page_info/PageInfo-class.md)</span>\></span></span>\></span></span>
<span class="name">getFunds</span>

</div>

<div class="section desc markdown">

This function is used to fetch all funds of the organization.

**params**:

- `first`: Number of funds to fetch from the beginning (pagination).
- `last`: Number of funds to fetch from the end (pagination).
- `after`: Cursor for pagination (fetch records after this cursor).
- `before`: Cursor for pagination (fetch records before this cursor).

**returns**:

- `Future<Pair<List<Fund>, PageInfo>>`: A pair containing the list of
  funds and pagination info.

</div>

<div id="source" class="section summary source-code">

## Implementation

``` language-dart
Future<Pair<List<Fund>, PageInfo>>  async 
```

</div>

</div>

<div id="dartdoc-sidebar-left" class="sidebar sidebar-offcanvas-left">

<div id="header-search-sidebar" class="hidden-l">

</div>

1.  [talawa](../../index.md)
2.  [fund_service](../../services_fund_service/services_fund_service-library.md)
3.  [FundService](../../services_fund_service/FundService-class.md)
4.  getFunds method

##### FundService class

<div id="dartdoc-sidebar-left-content">

</div>

</div>

<div id="dartdoc-sidebar-right" class="sidebar sidebar-offcanvas-right">

</div>

</div>

<span class="no-break"> talawa 1.0.0+1 </span>
