::: {#overlay-under-drawer}
:::

::: {#title}
[menu]{#sidenav-left-toggle .material-symbols-outlined role="button"
tabindex="0"}

1.  [talawa](../../index.html)
2.  [services/caching/offline_action_queue.dart](../../services_caching_offline_action_queue/)
3.  [OfflineActionQueue](../../services_caching_offline_action_queue/OfflineActionQueue-class.html)
4.  getActions method

::: self-name
getActions
:::

::: {#theme-button .toggle title="Toggle brightness"}
[ dark_mode ]{#dark-theme-button .material-symbols-outlined} [
light_mode ]{#light-theme-button .material-symbols-outlined}
:::
:::

::: {role="main"}
::: {#dartdoc-main-content .main-content above-sidebar="services_caching_offline_action_queue/OfflineActionQueue-class-sidebar.html" below-sidebar=""}
<div>

# [getActions]{.kind-method} method

</div>

::: {.section .multi-line-signature}
[[List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[CachedUserAction](../../models_caching_cached_user_action/CachedUserAction-class.html)]{.type-parameter}\>]{.signature}]{.returntype}
[getActions]{.name}()
:::

::: {.section .desc .markdown}
Retrieves all valid actions from the queue.

**params**: None

**returns**:

-   `List<CachedUserAction>`: a list of valid actions.
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
List<CachedUserAction> getActions() {
  try {
    final now = DateTime.now();
    final validActions = _actionsBox.values
        .where((action) => action.expiry.isAfter(now))
        .toList();
    removeExpiredActions();
    return validActions;
  } catch (e) {
    // Handle or log the exception
    print('Failed to get actions: $e');
    return [];
  }
}
```
:::
:::

::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../../index.html)
2.  [offline_action_queue](../../services_caching_offline_action_queue/)
3.  [OfflineActionQueue](../../services_caching_offline_action_queue/OfflineActionQueue-class.html)
4.  getActions method

##### OfflineActionQueue class

::: {#dartdoc-sidebar-left-content}
:::
:::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
:::

[ talawa 1.0.0+1 ]{.no-break}
