::::::: {#dartdoc-main-content .main-content above-sidebar="view_model_pre_auth_view_models_login_view_model/LoginViewModel-class-sidebar.html" below-sidebar=""}
<div>

# [initialize]{.kind-method} method

</div>

::: {.section .multi-line-signature}
[void]{.returntype} [initialize]{.name}()
:::

::: {.section .desc .markdown}
Initializes the greeting message.

**params**: None

**returns**: None
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
void initialize() {
  greeting = [
    {
      'text': "We're ",
      'textStyle': Theme.of(navigationService.navigatorKey.currentContext!)
          .textTheme
          .headlineSmall,
    },
    {
      'text': 'Glad ',
      'textStyle': Theme.of(navigationService.navigatorKey.currentContext!)
          .textTheme
          .titleLarge!
          .copyWith(fontSize: 24),
    },
    {
      'text': "you're ",
      'textStyle': Theme.of(navigationService.navigatorKey.currentContext!)
          .textTheme
          .headlineSmall,
    },
    {
      'text': 'Back ',
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
2.  [login_view_model](../../view_model_pre_auth_view_models_login_view_model/)
3.  [LoginViewModel](../../view_model_pre_auth_view_models_login_view_model/LoginViewModel-class.html)
4.  initialize method

##### LoginViewModel class

::: {#dartdoc-sidebar-left-content}
:::
:::::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
