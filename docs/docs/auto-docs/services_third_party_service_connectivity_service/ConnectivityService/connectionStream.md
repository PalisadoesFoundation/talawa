<div id="overlay-under-drawer">

</div>

<div id="title">

<span id="sidenav-left-toggle" class="material-symbols-outlined"
role="button" tabindex="0">menu</span>

1.  [talawa](../../index.md)
2.  [services/third_party_service/connectivity_service.dart](../../services_third_party_service_connectivity_service/services_third_party_service_connectivity_service-library.md)
3.  [ConnectivityService](../../services_third_party_service_connectivity_service/ConnectivityService-class.md)
4.  connectionStream property

<div class="self-name">

connectionStream

</div>

<div id="theme-button" class="toggle" title="Toggle brightness">

<span id="dark-theme-button" class="material-symbols-outlined">
dark_mode </span> <span id="light-theme-button"
class="material-symbols-outlined"> light_mode </span>

</div>

</div>

<div role="main">

<div id="dartdoc-main-content" class="main-content"
above-sidebar="services_third_party_service_connectivity_service/ConnectivityService-class-sidebar.html"
below-sidebar="">

<div>

# <span class="kind-property">connectionStream</span> property

</div>

<div id="getter" class="section">

<div class="section multi-line-signature">

<span class="returntype">[Stream](https://api.flutter.dev/flutter/dart-async/Stream-class.html)<span class="signature">\<<span class="type-parameter">[List](https://api.flutter.dev/flutter/dart-core/List-class.html)<span class="signature">\<<span class="type-parameter">[ConnectivityResult](https://pub.dev/documentation/connectivity_plus_platform_interface/2.0.1/connectivity_plus_platform_interface/ConnectivityResult.html)</span>\></span></span>\></span></span>
<span class="name">connectionStream</span>

</div>

<div class="section desc markdown">

Getter for the stream of connection status changes.

</div>

<div id="source" class="section summary source-code">

## Implementation

``` language-dart
Stream<List<ConnectivityResult>> get connectionStream =>
    connectionStatusController.stream;
```

</div>

</div>

</div>

<div id="dartdoc-sidebar-left" class="sidebar sidebar-offcanvas-left">

<div id="header-search-sidebar" class="hidden-l">

</div>

1.  [talawa](../../index.md)
2.  [connectivity_service](../../services_third_party_service_connectivity_service/services_third_party_service_connectivity_service-library.md)
3.  [ConnectivityService](../../services_third_party_service_connectivity_service/ConnectivityService-class.md)
4.  connectionStream property

##### ConnectivityService class

<div id="dartdoc-sidebar-left-content">

</div>

</div>

<div id="dartdoc-sidebar-right" class="sidebar sidebar-offcanvas-right">

</div>

</div>

<span class="no-break"> talawa 1.0.0+1 </span>
