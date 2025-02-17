::::::: {#dartdoc-main-content .main-content above-sidebar="services_caching_base_feed_manager/BaseFeedManager-class-sidebar.html" below-sidebar=""}
<div>

# [getNewFeedAndRefreshCache]{.kind-method} method

</div>

::: {.section .multi-line-signature}
[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[T]{.type-parameter}\>]{.signature}]{.type-parameter}\>]{.signature}]{.returntype}
[getNewFeedAndRefreshCache]{.name}()
:::

::: {.section .desc .markdown}
Fetches new data from the API if online, updates the cache, and returns
the data.

If offline, loads and returns cached data.

**params**: None

**returns**:

-   `Future<List<T>>`: A Future containing a list of the latest data.
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
Future<List<T>> getNewFeedAndRefreshCache() async {
  if (AppConnectivity.isOnline) {
    try {
      final data = await fetchDataFromApi();
      await saveDataToCache(data);
      return data;
    } catch (e) {
      debugPrint(e.toString());
      return loadCachedData();
    }
  } else {
    return loadCachedData();
  }
}
```
:::
:::::::

::::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../../index.html)
2.  [base_feed_manager](../../services_caching_base_feed_manager/)
3.  [BaseFeedManager[\<[T]{.type-parameter}\>]{.signature}](../../services_caching_base_feed_manager/BaseFeedManager-class.html)
4.  getNewFeedAndRefreshCache method

##### BaseFeedManager class

::: {#dartdoc-sidebar-left-content}
:::
:::::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
