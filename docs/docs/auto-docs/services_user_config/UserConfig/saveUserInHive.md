::::::: {#dartdoc-main-content .main-content above-sidebar="services_user_config/UserConfig-class-sidebar.html" below-sidebar=""}
<div>

# [saveUserInHive]{.kind-method} method

</div>

::: {.section .multi-line-signature}
[void]{.returntype} [saveUserInHive]{.name}()
:::

::: {.section .desc .markdown}
save user in hive.

**params**: None

**returns**: None
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
void saveUserInHive() {
  final box = Hive.box<User>('currentUser');
  if (box.get('user') == null) {
    box.put('user', _currentUser!);
  } else {
    box.put('user', _currentUser!);
  }
}
```
:::
:::::::

::::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../../index.html)
2.  [user_config](../../services_user_config/)
3.  [UserConfig](../../services_user_config/UserConfig-class.html)
4.  saveUserInHive method

##### UserConfig class

::: {#dartdoc-sidebar-left-content}
:::
:::::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
