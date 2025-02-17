:::::: {#dartdoc-main-content .main-content above-sidebar="services_post_service/PostService-class-sidebar.html" below-sidebar=""}
<div>

# [PostService]{.kind-constructor} constructor

</div>

::: {.section .multi-line-signature}
[PostService]{.name}()
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
PostService() : super(HiveKeys.postFeedKey) {
  _postStream = _postStreamController.stream.asBroadcastStream();
  _updatedPostStream =
      _updatedPostStreamController.stream.asBroadcastStream();
  _currentOrg = _userConfig.currentOrg;
  setOrgStreamSubscription();
}
```
:::
::::::

::::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../../index.html)
2.  [post_service](../../services_post_service/)
3.  [PostService](../../services_post_service/PostService-class.html)
4.  PostService constructor

##### PostService class

::: {#dartdoc-sidebar-left-content}
:::
:::::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
