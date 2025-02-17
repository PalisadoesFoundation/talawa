::::::: {#dartdoc-main-content .main-content above-sidebar="services_caching_offline_action_queue/OfflineActionQueue-class-sidebar.html" below-sidebar=""}
<div>

# [openQueue]{.kind-method} method

</div>

::: {.section .multi-line-signature}
[void]{.returntype} [openQueue]{.name}()
:::

::: {.section .desc .markdown}
Opens the Hive box for the offline action queue.

**params**: None

**returns**: None
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
void openQueue() {
  _actionsBox = Hive.box<CachedUserAction>(boxName);
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
4.  openQueue method

##### OfflineActionQueue class

::: {#dartdoc-sidebar-left-content}
:::
:::::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
