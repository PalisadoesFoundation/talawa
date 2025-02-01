::: {#overlay-under-drawer}
:::

::: {#title}
[menu]{#sidenav-left-toggle .material-symbols-outlined role="button"
tabindex="0"}

1.  [talawa](../../index.html)
2.  [services/third_party_service/connectivity_service.dart](../../services_third_party_service_connectivity_service/)
3.  [ConnectivityService](../../services_third_party_service_connectivity_service/ConnectivityService-class.html)
4.  isReachable method

::: self-name
isReachable
:::

::: {#theme-button .toggle title="Toggle brightness"}
[ dark_mode ]{#dark-theme-button .material-symbols-outlined} [
light_mode ]{#light-theme-button .material-symbols-outlined}
:::
:::

::: {role="main"}
::: {#dartdoc-main-content .main-content above-sidebar="services_third_party_service_connectivity_service/ConnectivityService-class-sidebar.html" below-sidebar=""}
<div>

# [isReachable]{.kind-method} method

</div>

::: {.section .multi-line-signature}
[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]{.type-parameter}\>]{.signature}]{.returntype}
[isReachable]{.name}({

1.  [[[Client](https://pub.dev/documentation/http/1.2.2/http/Client-class.html)?]{.type-annotation}
    [client]{.parameter-name}, ]{#isReachable-param-client .parameter}
2.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)?]{.type-annotation}
    [uriString]{.parameter-name}, ]{#isReachable-param-uriString
    .parameter}

})
:::

::: {.section .desc .markdown}
This function checks if a given URI is reachable within a specified
timeout period.

Specifically designed to

**params**:

-   `client`: An instance of `http.Client` to make the HTTP request.
-   `uriString`: An optional `String` specifying the URI to check.
    Defaults to \'org link\' if not provided.

**returns**:

-   `Future<bool>`: indicates if the url is reachable.
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
Future<bool> isReachable({
  http.Client? client,
  String? uriString,
}) async {
  try {
    client ??= _client;
    await client
        .get(Uri.parse(uriString ?? graphqlConfig.httpLink.uri.toString()))
        .timeout(const Duration(seconds: 30));
    return true;
  } catch (e) {
    print('Timeout while checking reachability: $e');
    return false;
  }
}
```
:::
:::

::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../../index.html)
2.  [connectivity_service](../../services_third_party_service_connectivity_service/)
3.  [ConnectivityService](../../services_third_party_service_connectivity_service/ConnectivityService-class.html)
4.  isReachable method

##### ConnectivityService class

::: {#dartdoc-sidebar-left-content}
:::
:::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
:::

[ talawa 1.0.0+1 ]{.no-break}
