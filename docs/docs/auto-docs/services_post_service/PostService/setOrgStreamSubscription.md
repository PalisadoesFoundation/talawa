::::::: {#dartdoc-main-content .main-content above-sidebar="services_post_service/PostService-class-sidebar.html" below-sidebar=""}
<div>

# [setOrgStreamSubscription]{.kind-method} method

</div>

::: {.section .multi-line-signature}
[void]{.returntype} [setOrgStreamSubscription]{.name}()
:::

::: {.section .desc .markdown}
This method sets up a stream that constantly listens to change in
current org.

**params**: None

**returns**: None
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
void setOrgStreamSubscription() {
  _userConfig.currentOrgInfoStream.listen((updatedOrganization) {
    if (updatedOrganization != _currentOrg) {
      _renderedPostID.clear();
      _currentOrg = updatedOrganization;
      getPosts();
    }
  });
}
```
:::
:::::::

::::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../../index.html)
2.  [post_service](../../services_post_service/)
3.  [PostService](../../services_post_service/PostService-class.html)
4.  setOrgStreamSubscription method

##### PostService class

::: {#dartdoc-sidebar-left-content}
:::
:::::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
