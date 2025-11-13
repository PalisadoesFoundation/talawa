<div id="overlay-under-drawer">

</div>

<div id="title">

<span id="sidenav-left-toggle" class="material-symbols-outlined"
role="button" tabindex="0">menu</span>

1.  [talawa](../../index.md)
2.  [services/fund_service.dart](../../services_fund_service/services_fund_service-library.md)
3.  [FundService](../../services_fund_service/FundService-class.md)
4.  getCampaigns method

<div class="self-name">

getCampaigns

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

# <span class="kind-method">getCampaigns</span> method

</div>

<div class="section multi-line-signature">

<span class="returntype">[Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)<span class="signature">\<<span class="type-parameter">[Pair](../../utils_pair/Pair-class.md)<span class="signature">\<<span class="type-parameter">[List](https://api.flutter.dev/flutter/dart-core/List-class.html)<span class="signature">\<<span class="type-parameter">[Campaign](../../models_funds_fund_campaign/Campaign-class.md)</span>\></span></span>,
<span class="type-parameter">[PageInfo](../../models_page_info_page_info/PageInfo-class.md)</span>\></span></span>\></span></span>
<span class="name">getCampaigns</span>(

1.  <span id="getCampaigns-param-fundId"
    class="parameter"><span class="type-annotation">[String](https://api.flutter.dev/flutter/dart-core/String-class.md)</span>
    <span class="parameter-name">fundId</span>, )

</div>

<div class="section desc markdown">

This function is used to fetch all campaigns of a fund.

**params**:

- `fundId`: id of a fund.
- `first`: Number of campaigns to fetch from the beginning (pagination).
- `last`: Number of campaigns to fetch from the end (pagination).
- `after`: Cursor for pagination (fetch records after this cursor).
- `before`: Cursor for pagination (fetch records before this cursor).

**returns**:

- `Future<Pair<List<Campaign>, PageInfo>>`: A pair containing the list
  of campaigns and pagination info.

</div>

<div id="source" class="section summary source-code">

## Implementation

``` language-dart
Future<Pair<List<Campaign>, PageInfo>> getCampaigns(
  String fundId, ) async 
```

</div>

</div>

<div id="dartdoc-sidebar-left" class="sidebar sidebar-offcanvas-left">

<div id="header-search-sidebar" class="hidden-l">

</div>

1.  [talawa](../../index.md)
2.  [fund_service](../../services_fund_service/services_fund_service-library.md)
3.  [FundService](../../services_fund_service/FundService-class.md)
4.  getCampaigns method

##### FundService class

<div id="dartdoc-sidebar-left-content">

</div>

</div>

<div id="dartdoc-sidebar-right" class="sidebar sidebar-offcanvas-right">

</div>

</div>

<span class="no-break"> talawa 1.0.0+1 </span>
