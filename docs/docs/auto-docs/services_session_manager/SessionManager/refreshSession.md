::: {#overlay-under-drawer}
:::

::: {#title}
[menu]{#sidenav-left-toggle .material-symbols-outlined role="button"
tabindex="0"}

1.  [talawa](../../index.html)
2.  [services/session_manager.dart](../../services_session_manager/)
3.  [SessionManager](../../services_session_manager/SessionManager-class.html)
4.  refreshSession method

::: self-name
refreshSession
:::

::: {#theme-button .toggle title="Toggle brightness"}
[ dark_mode ]{#dark-theme-button .material-symbols-outlined} [
light_mode ]{#light-theme-button .material-symbols-outlined}
:::
:::

::: {role="main"}
::: {#dartdoc-main-content .main-content above-sidebar="services_session_manager/SessionManager-class-sidebar.html" below-sidebar=""}
<div>

# [refreshSession]{.kind-method} method

</div>

::: {.section .multi-line-signature}
[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]{.type-parameter}\>]{.signature}]{.returntype}
[refreshSession]{.name}()
:::

::: {.section .desc .markdown}
Asynchronously refreshes the user session.

**params**: None

**returns**:

-   `Future<bool>`: indicates if session refresh was successful.
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
Future<bool> refreshSession() async {
  if (userConfig.loggedIn && userConfig.currentUser.refreshToken != null) {
    final refreshed = await databaseFunctions
        .refreshAccessToken(userConfig.currentUser.refreshToken!);
    return refreshed;
  }
  return false;
}
```
:::
:::

::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../../index.html)
2.  [session_manager](../../services_session_manager/)
3.  [SessionManager](../../services_session_manager/SessionManager-class.html)
4.  refreshSession method

##### SessionManager class

::: {#dartdoc-sidebar-left-content}
:::
:::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
:::

[ talawa 1.0.0+1 ]{.no-break}
