::::::: {#dartdoc-main-content .main-content above-sidebar="services_event_service/EventService-class-sidebar.html" below-sidebar=""}
<div>

# [setOrgStreamSubscription]{.kind-method} method

</div>

::: {.section .multi-line-signature}
[void]{.returntype} [setOrgStreamSubscription]{.name}()
:::

::: {.section .desc .markdown}
This function is used to set stream subscription for an organization.

**params**: None

**returns**: None
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
void setOrgStreamSubscription() {
  _currentOrganizationStreamSubscription =
      _userConfig.currentOrgInfoStream.listen((updatedOrganization) {
    _currentOrg = updatedOrganization;
  });
}
```
:::
:::::::

::::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../../index.html)
2.  [event_service](../../services_event_service/)
3.  [EventService](../../services_event_service/EventService-class.html)
4.  setOrgStreamSubscription method

##### EventService class

::: {#dartdoc-sidebar-left-content}
:::
:::::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
