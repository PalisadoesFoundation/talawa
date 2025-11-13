<div id="overlay-under-drawer">

</div>

<div id="title">

<span id="sidenav-left-toggle" class="material-symbols-outlined"
role="button" tabindex="0">menu</span>

1.  [talawa](../../index.md)
2.  [services/fund_service.dart](../../services_fund_service/services_fund_service-library.md)
3.  [FundService](../../services_fund_service/FundService-class.md)
4.  getPledgesByCampaign method

<div class="self-name">

getPledgesByCampaign

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

# <span class="kind-method">getPledgesByCampaign</span> method

</div>

<div class="section multi-line-signature">

<span class="returntype">[Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)<span class="signature">\<<span class="type-parameter">[List](https://api.flutter.dev/flutter/dart-core/List-class.html)<span class="signature">\<<span class="type-parameter">[Pledge](../../models_funds_fund_pledges/Pledge-class.md)</span>\></span></span>\></span></span>
<span class="name">getPledgesByCampaign</span>(

1.  <span id="getPledgesByCampaign-param-campaignId"
    class="parameter"><span class="type-annotation">[String](https://api.flutter.dev/flutter/dart-core/String-class.md)</span>
    <span class="parameter-name">campaignId</span></span>

)

</div>

<div class="section desc markdown">

This function is used to fetch pledges by campaign ID.

**params**:

- `campaignId`: ID of the campaign to fetch pledges for.

**returns**:

- `Future<List<Pledge>>`: List of pledges.

</div>

<div id="source" class="section summary source-code">

## Implementation

``` language-dart
Future<List<Pledge>> getPledgesByCampaign(String campaignId) async 
```

</div>

</div>

<div id="dartdoc-sidebar-left" class="sidebar sidebar-offcanvas-left">

<div id="header-search-sidebar" class="hidden-l">

</div>

1.  [talawa](../../index.md)
2.  [fund_service](../../services_fund_service/services_fund_service-library.md)
3.  [FundService](../../services_fund_service/FundService-class.md)
4.  getPledgesByCampaign method

##### FundService class

<div id="dartdoc-sidebar-left-content">

</div>

</div>

<div id="dartdoc-sidebar-right" class="sidebar sidebar-offcanvas-right">

</div>

</div>

<span class="no-break"> talawa 1.0.0+1 </span>
