<div id="overlay-under-drawer">

</div>

<div id="title">

<span id="sidenav-left-toggle" class="material-symbols-outlined"
role="button" tabindex="0">menu</span>

1.  [talawa](../../index.md)
2.  [services/graphql_config.dart](../../services_graphql_config/)
3.  [MockHttpClient](../../services_graphql_config/MockHttpClient-class.md)
4.  send method

<div class="self-name">

send

</div>

<span id="dark-theme-button" class="material-symbols-outlined"
aria-hidden="true"> dark_mode </span> <span id="light-theme-button"
class="material-symbols-outlined" aria-hidden="true"> light_mode </span>

</div>

<div role="main">

<div id="dartdoc-main-content" class="main-content"
above-sidebar="services_graphql_config/MockHttpClient-class-sidebar.html"
below-sidebar="">

<div>

# <span class="kind-method">send</span> method

</div>

<div class="section multi-line-signature">

<div>

1.  @[override](https://api.flutter.dev/flutter/dart-core/override-constant.html)

</div>

<span class="returntype">[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<span class="signature">\<<span class="type-parameter">[StreamedResponse](https://pub.dev/documentation/http/1.5.0/http/StreamedResponse-class.html)</span>\></span></span>
<span class="name">send</span>(

1.  <span id="send-param-request"
    class="parameter"><span class="type-annotation">[BaseRequest](https://pub.dev/documentation/http/1.5.0/http/BaseRequest-class.md)?</span>
    <span class="parameter-name">request</span></span>

)

<div class="features">

<span class="feature">override</span>

</div>

</div>

<div class="section desc markdown">

Sends an HTTP request and asynchronously returns the response.

</div>

<div id="source" class="section summary source-code">

## Implementation

``` language-dart
@override
Future<http.StreamedResponse> send(http.BaseRequest? request) =>
    // ignore: invalid_use_of_visible_for_testing_member
    super.noSuchMethod(
      Invocation.method(#send, [request]),
      returnValue: Future.value(
        http.StreamedResponse(
          Stream.fromIterable(const [<int>[]]),
          500,
        ),
      ),
    ) as Future<http.StreamedResponse>;
```

</div>

</div>

<div id="dartdoc-sidebar-left" class="sidebar sidebar-offcanvas-left">

<div id="header-search-sidebar" class="hidden-l">

</div>

1.  [talawa](../../index.md)
2.  [graphql_config](../../services_graphql_config/)
3.  [MockHttpClient](../../services_graphql_config/MockHttpClient-class.md)
4.  send method

##### MockHttpClient class

<div id="dartdoc-sidebar-left-content">

</div>

</div>

<div id="dartdoc-sidebar-right" class="sidebar sidebar-offcanvas-right">

</div>

</div>

<span class="no-break"> talawa 1.0.0+1 </span>
