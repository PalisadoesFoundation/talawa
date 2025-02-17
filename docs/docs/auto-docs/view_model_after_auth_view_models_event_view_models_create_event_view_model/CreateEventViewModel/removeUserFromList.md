::::::: {#dartdoc-main-content .main-content above-sidebar="view_model_after_auth_view_models_event_view_models_create_event_view_model/CreateEventViewModel-class-sidebar.html" below-sidebar=""}
<div>

# [removeUserFromList]{.kind-method} method

</div>

::: {.section .multi-line-signature}
[void]{.returntype} [removeUserFromList]{.name}({

1.  [required
    [[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-annotation}
    [userId]{.parameter-name}, ]{#removeUserFromList-param-userId
    .parameter}

})
:::

::: {.section .desc .markdown}
This function is used to remove a user from user\'s list.

**params**:

-   `userId`: id of the user that need to be removed.

**returns**: None
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
void removeUserFromList({required String userId}) {
  _selectedMembers.removeWhere((user) => user.id == userId);
  _memberCheckedMap[userId] = false;

  notifyListeners();
}
```
:::
:::::::

::::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../../index.html)
2.  [create_event_view_model](../../view_model_after_auth_view_models_event_view_models_create_event_view_model/)
3.  [CreateEventViewModel](../../view_model_after_auth_view_models_event_view_models_create_event_view_model/CreateEventViewModel-class.html)
4.  removeUserFromList method

##### CreateEventViewModel class

::: {#dartdoc-sidebar-left-content}
:::
:::::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
