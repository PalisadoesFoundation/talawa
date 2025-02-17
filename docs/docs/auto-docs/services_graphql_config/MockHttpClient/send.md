::::::::: {#dartdoc-main-content .main-content above-sidebar="services_graphql_config/MockHttpClient-class-sidebar.html" below-sidebar=""}
<div>

# [send]{.kind-method} method

</div>

::::: {.section .multi-line-signature}
<div>

1.  @[override](https://api.flutter.dev/flutter/dart-core/override-constant.html)

</div>

[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[StreamedResponse](https://pub.dev/documentation/http/1.2.2/http/StreamedResponse-class.html)]{.type-parameter}\>]{.signature}]{.returntype}
[send]{.name}(

1.  [[[BaseRequest](https://pub.dev/documentation/http/1.2.2/http/BaseRequest-class.html)?]{.type-annotation}
    [request]{.parameter-name}]{#send-param-request .parameter}

)

::: features
[override]{.feature}
:::
:::::

::: {.section .desc .markdown}
Sends an HTTP request and asynchronously returns the response.
:::

::: {#source .section .summary .source-code}
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
:::
:::::::::

::::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../../index.html)
2.  [graphql_config](../../services_graphql_config/)
3.  [MockHttpClient](../../services_graphql_config/MockHttpClient-class.html)
4.  send method

##### MockHttpClient class

::: {#dartdoc-sidebar-left-content}
:::
:::::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
