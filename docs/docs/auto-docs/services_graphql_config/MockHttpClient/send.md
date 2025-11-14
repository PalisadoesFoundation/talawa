<div id="overlay-under-drawer">

</div>

<div id="title">

<span id="sidenav-left-toggle" class="material-symbols-outlined"
role="button" tabindex="0">menu</span>

1.  [talawa](../../index.md)
2.  [graphql_config](../../services_graphql_config/services_graphql_config-library.md)
3.  [MockHttpClient](../../services_graphql_config/MockHttpClient-class.md)
4.  send method

<div class="self-name">

send

</div>

<div id="theme-button" class="toggle">

<span id="dark-theme-button" class="material-symbols-outlined">
brightness_4 </span> <span id="light-theme-button"
class="material-symbols-outlined"> brightness_5 </span>

</div>

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

<span class="returntype">[Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)<span class="signature">\<<span class="type-parameter">[StreamedResponse](https://pub.dev/documentation/http/1.5.0/http/StreamedResponse-class.html)</span>\></span></span>
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
2.  [graphql_config](../../services_graphql_config/services_graphql_config-library.md)
3.  [MockHttpClient](../../services_graphql_config/MockHttpClient-class.md)
4.  send method

##### MockHttpClient class

</div>

<div id="dartdoc-sidebar-right" class="sidebar sidebar-offcanvas-right">

</div>

</div>

<span class="no-break"> talawa 1.0.0+1 </span>
