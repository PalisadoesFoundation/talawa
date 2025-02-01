::: {#overlay-under-drawer}
:::

::: {#title}
[menu]{#sidenav-left-toggle .material-symbols-outlined role="button"
tabindex="0"}

1.  [talawa](../../index.html)
2.  [services/caching/base_feed_manager.dart](../../services_caching_base_feed_manager/)
3.  [BaseFeedManager[\<[T]{.type-parameter}\>]{.signature}](../../services_caching_base_feed_manager/BaseFeedManager-class.html)
4.  saveDataToCache method

::: self-name
saveDataToCache
:::

::: {#theme-button .toggle title="Toggle brightness"}
[ dark_mode ]{#dark-theme-button .material-symbols-outlined} [
light_mode ]{#light-theme-button .material-symbols-outlined}
:::
:::

::: {role="main"}
::: {#dartdoc-main-content .main-content above-sidebar="services_caching_base_feed_manager/BaseFeedManager-class-sidebar.html" below-sidebar=""}
<div>

# [saveDataToCache]{.kind-method} method

</div>

::: {.section .multi-line-signature}
[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[void]{.type-parameter}\>]{.signature}]{.returntype}
[saveDataToCache]{.name}(

1.  [[[List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[T]{.type-parameter}\>]{.signature}]{.type-annotation}
    [data]{.parameter-name}]{#saveDataToCache-param-data .parameter}

)
:::

::: {.section .desc .markdown}
Saves a list of data to the cache, replacing any existing data.

**params**:

-   `data`: The list of data to be saved to the cache.

**returns**: None
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
Future<void> saveDataToCache(List<T> data) async {
  debugPrint('saveToCache1');
  await _box.clear();
  debugPrint(_box.values.length.toString());
  debugPrint('saveToCache2');
  await _box.addAll(data);
  debugPrint('saveToCache');
  debugPrint(_box.values.length.toString());
  debugPrint(_box.values.length.toString());
}
```
:::
:::

::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../../index.html)
2.  [base_feed_manager](../../services_caching_base_feed_manager/)
3.  [BaseFeedManager[\<[T]{.type-parameter}\>]{.signature}](../../services_caching_base_feed_manager/BaseFeedManager-class.html)
4.  saveDataToCache method

##### BaseFeedManager class

::: {#dartdoc-sidebar-left-content}
:::
:::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
:::

[ talawa 1.0.0+1 ]{.no-break}
