::::::: {#dartdoc-main-content .main-content above-sidebar="services_caching_offline_action_queue/OfflineActionQueue-class-sidebar.html" below-sidebar=""}
<div>

# [removeExpiredActions]{.kind-method} method

</div>

::: {.section .multi-line-signature}
[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]{.type-parameter}\>]{.signature}]{.returntype}
[removeExpiredActions]{.name}()
:::

::: {.section .desc .markdown}
Removes expired actions from the queue.

**params**: None

**returns**:

-   `Future<bool>`: returns true if expired actions were removed
    successfully, otherwise false.
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
Future<bool> removeExpiredActions() async {
  try {
    final now = DateTime.now();
    final expiredKeys = _actionsBox.keys.where((key) {
      final CachedUserAction action = _actionsBox.get(key)!;
      return action.expiry.isBefore(now);
    }).toList();
    for (final key in expiredKeys) {
      await _actionsBox.delete(key);
    }
    return true;
  } catch (e) {
    // Handle or log the exception
    print('Failed to remove expired actions: $e');
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
4.  removeExpiredActions method

##### OfflineActionQueue class

::: {#dartdoc-sidebar-left-content}
:::
:::::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
