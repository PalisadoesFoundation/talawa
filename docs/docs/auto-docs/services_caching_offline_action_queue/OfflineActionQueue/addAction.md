::::::: {#dartdoc-main-content .main-content above-sidebar="services_caching_offline_action_queue/OfflineActionQueue-class-sidebar.html" below-sidebar=""}
<div>

# [addAction]{.kind-method} method

</div>

::: {.section .multi-line-signature}
[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]{.type-parameter}\>]{.signature}]{.returntype}
[addAction]{.name}(

1.  [[[CachedUserAction](../../models_caching_cached_user_action/CachedUserAction-class.html)]{.type-annotation}
    [action]{.parameter-name}]{#addAction-param-action .parameter}

)
:::

::: {.section .desc .markdown}
Adds an action to the queue with a TTL.

**params**:

-   `action`: the action to be added.

**returns**:

-   `Future<bool>`: returns true if the action was added successfully,
    otherwise false.
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
Future<bool> addAction(CachedUserAction action) async {
  try {
    await _actionsBox.put(action.id, action);
    return true;
  } catch (e) {
    // Handle or log the exception
    print('Failed to add action: $e');
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
4.  addAction method

##### OfflineActionQueue class

::: {#dartdoc-sidebar-left-content}
:::
:::::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
