::::::: {#dartdoc-main-content .main-content above-sidebar="view_model_pre_auth_view_models_signup_details_view_model/SignupDetailsViewModel-class-sidebar.html" below-sidebar=""}
<div>

# [initialise]{.kind-method} method

</div>

::: {.section .multi-line-signature}
[void]{.returntype} [initialise]{.name}(

1.  [[[OrgInfo](../../models_organization_org_info/OrgInfo-class.html)?]{.type-annotation}
    [org]{.parameter-name}]{#initialise-param-org .parameter}

)
:::

::: {.section .desc .markdown}
Initializes the greeting message for a selected organization.

**params**:

-   `org`: OrgInfo - the organization information to set as selected.

**returns**: None
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
void initialise(OrgInfo? org) {
  selectedOrganization = org;
  // greeting message
  greeting = [
    {
      'text': "Let's ",
      'textStyle': Theme.of(navigationService.navigatorKey.currentContext!)
          .textTheme
          .headlineSmall,
    },
    {
      'text': 'get ',
      'textStyle': Theme.of(navigationService.navigatorKey.currentContext!)
          .textTheme
          .headlineSmall,
    },
    {
      'text': "you ",
      'textStyle': Theme.of(navigationService.navigatorKey.currentContext!)
          .textTheme
          .headlineSmall,
    },
    {
      'text': 'SignUp ',
      'textStyle': Theme.of(navigationService.navigatorKey.currentContext!)
          .textTheme
          .titleLarge!
          .copyWith(fontSize: 24),
    },
  ];
}
```
:::
:::::::

::::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../../index.html)
2.  [signup_details_view_model](../../view_model_pre_auth_view_models_signup_details_view_model/)
3.  [SignupDetailsViewModel](../../view_model_pre_auth_view_models_signup_details_view_model/SignupDetailsViewModel-class.html)
4.  initialise method

##### SignupDetailsViewModel class

::: {#dartdoc-sidebar-left-content}
:::
:::::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
