::::::: {#dartdoc-main-content .main-content above-sidebar="services_caching_offline_action_queue/OfflineActionQueue-class-sidebar.html" below-sidebar=""}
<div>

# [clearActions]{.kind-method} method

</div>

::: {.section .multi-line-signature}
[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]{.type-parameter}\>]{.signature}]{.returntype}
[clearActions]{.name}()
:::

::: {.section .desc .markdown}
Clears all actions from the queue.

**params**: None

**returns**:

-   `Future<bool>`: returns true if all actions were cleared
    successfully, otherwise false.
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
Future<bool> clearActions() async {
  try {
    await _actionsBox.clear();
    return true;
  } catch (e) {
    // Handle or log the exception
    print('Failed to clear actions: $e');
    return false;
  }
}
```
:::
:::::::

::::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../../index.html)
2.  [offline_action_queue](../../services_caching_offline_action_queue/)
3.  [OfflineActionQueue](../../services_caching_offline_action_queue/OfflineActionQueue-class.html)
4.  clearActions method

##### OfflineActionQueue class

::: {#dartdoc-sidebar-left-content}
:::
:::::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
