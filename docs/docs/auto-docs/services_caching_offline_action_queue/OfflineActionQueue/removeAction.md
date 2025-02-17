::::::: {#dartdoc-main-content .main-content above-sidebar="services_caching_offline_action_queue/OfflineActionQueue-class-sidebar.html" below-sidebar=""}
<div>

# [removeAction]{.kind-method} method

</div>

::: {.section .multi-line-signature}
[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]{.type-parameter}\>]{.signature}]{.returntype}
[removeAction]{.name}(

1.  [[dynamic]{.type-annotation}
    [key]{.parameter-name}]{#removeAction-param-key .parameter}

)
:::

::: {.section .desc .markdown}
Removes a specific action from the queue.

**params**:

-   `key`: the key of the action to be removed.

**returns**:

-   `Future<bool>`: returns true if the action was removed successfully,
    otherwise false.
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
Future<bool> removeAction(dynamic key) async {
  try {
    await _actionsBox.delete(key);
    return true;
  } catch (e) {
    // Handle or log the exception
    print('Failed to remove action: $e');
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
4.  removeAction method

##### OfflineActionQueue class

::: {#dartdoc-sidebar-left-content}
:::
:::::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
