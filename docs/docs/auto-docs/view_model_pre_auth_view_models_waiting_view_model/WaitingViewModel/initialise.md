:::::: {#dartdoc-main-content .main-content above-sidebar="view_model_pre_auth_view_models_waiting_view_model/WaitingViewModel-class-sidebar.html" below-sidebar=""}
<div>

# [initialise]{.kind-method} method

</div>

::: {.section .multi-line-signature}
[void]{.returntype} [initialise]{.name}(

1.  [[[BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.html)]{.type-annotation}
    [context]{.parameter-name}]{#initialise-param-context .parameter}

)
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
void initialise(BuildContext context) {
  currentUser = userConfig.currentUser;
  pendingRequestOrg = currentUser.membershipRequests!;
  // greetings
  greeting = [
    {
      'text': "Please wait",
      'textStyle': Theme.of(context).textTheme.headlineSmall,
    },
    {
      'text': " ${currentUser.firstName} ",
      'textStyle':
          Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 24),
    },
    {
      'text': "for organisation(s) to accept your invitation.",
      'textStyle': Theme.of(context).textTheme.headlineSmall,
    },
  ];
}
```
:::
::::::

::::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../../index.html)
2.  [waiting_view_model](../../view_model_pre_auth_view_models_waiting_view_model/)
3.  [WaitingViewModel](../../view_model_pre_auth_view_models_waiting_view_model/WaitingViewModel-class.html)
4.  initialise method

##### WaitingViewModel class

::: {#dartdoc-sidebar-left-content}
:::
:::::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
