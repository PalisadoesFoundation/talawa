::::::: {#dartdoc-main-content .main-content above-sidebar="services_session_manager/SessionManager-class-sidebar.html" below-sidebar=""}
<div>

# [initializeSessionRefresher]{.kind-method} method

</div>

::: {.section .multi-line-signature}
[[Timer](https://api.flutter.dev/flutter/dart-async/Timer-class.html)]{.returntype}
[initializeSessionRefresher]{.name}()
:::

::: {.section .desc .markdown}
Initializes as session refresher.

Invokes
[refreshSession](../../services_session_manager/SessionManager/refreshSession.html)
periodically at regular refresh intervals.

**params**: None

**returns**:

-   `Timer`: refresh timer.
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
Timer initializeSessionRefresher() {
  return Timer.periodic(
    const Duration(seconds: _refreshInterval),
    (Timer timer) async {
      refreshSession();
    },
  );
}
```
:::
:::::::

::::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../../index.html)
2.  [session_manager](../../services_session_manager/)
3.  [SessionManager](../../services_session_manager/SessionManager-class.html)
4.  initializeSessionRefresher method

##### SessionManager class

::: {#dartdoc-sidebar-left-content}
:::
:::::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
