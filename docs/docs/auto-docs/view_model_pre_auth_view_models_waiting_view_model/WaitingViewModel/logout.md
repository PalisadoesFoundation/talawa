::: {#overlay-under-drawer}
:::

::: {#title}
[menu]{#sidenav-left-toggle .material-symbols-outlined role="button"
tabindex="0"}

1.  [talawa](../../index.html)
2.  [view_model/pre_auth_view_models/waiting_view_model.dart](../../view_model_pre_auth_view_models_waiting_view_model/)
3.  [WaitingViewModel](../../view_model_pre_auth_view_models_waiting_view_model/WaitingViewModel-class.html)
4.  logout method

::: self-name
logout
:::

::: {#theme-button .toggle title="Toggle brightness"}
[ dark_mode ]{#dark-theme-button .material-symbols-outlined} [
light_mode ]{#light-theme-button .material-symbols-outlined}
:::
:::

::: {role="main"}
::: {#dartdoc-main-content .main-content above-sidebar="view_model_pre_auth_view_models_waiting_view_model/WaitingViewModel-class-sidebar.html" below-sidebar=""}
<div>

# [logout]{.kind-method} method

</div>

::: {.section .multi-line-signature}
[void]{.returntype} [logout]{.name}()
:::

::: {.section .desc .markdown}
This function ends the session for the user or logout the user from the
application.
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
void logout() {
  final user = Hive.box<User>('currentUser');
  final url = Hive.box('url');
  user.clear();
  url.clear();
  navigationService.removeAllAndPush(
    Routes.languageSelectionRoute,
    Routes.splashScreen,
    arguments: '0',
  );
}
```
:::
:::

::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../../index.html)
2.  [waiting_view_model](../../view_model_pre_auth_view_models_waiting_view_model/)
3.  [WaitingViewModel](../../view_model_pre_auth_view_models_waiting_view_model/WaitingViewModel-class.html)
4.  logout method

##### WaitingViewModel class

::: {#dartdoc-sidebar-left-content}
:::
:::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
:::

[ talawa 1.0.0+1 ]{.no-break}
