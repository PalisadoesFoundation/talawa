::: {#overlay-under-drawer}
:::

::: {#title}
[menu]{#sidenav-left-toggle .material-symbols-outlined role="button"
tabindex="0"}

1.  [talawa](../../index.html)
2.  [models/user/user_info.dart](../../models_user_user_info/)
3.  [User](../../models_user_user_info/User-class.html)
4.  print method

::: self-name
print
:::

::: {#theme-button .toggle title="Toggle brightness"}
[ dark_mode ]{#dark-theme-button .material-symbols-outlined} [
light_mode ]{#light-theme-button .material-symbols-outlined}
:::
:::

::: {role="main"}
::: {#dartdoc-main-content .main-content above-sidebar="models_user_user_info/User-class-sidebar.html" below-sidebar=""}
<div>

# [print]{.kind-method} method

</div>

::: {.section .multi-line-signature}
[void]{.returntype} [print]{.name}()
:::

::: {.section .desc .markdown}
Method to print the User details.

**params**: None

**returns**: None
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
void print() {
  debugPrint('authToken: ${this.authToken}');
  debugPrint('refreshToken: ${this.refreshToken}');
  debugPrint('_id: ${this.id}');
  debugPrint('firstName: ${this.firstName}');
  debugPrint('lastName: ${this.lastName}');
  debugPrint('image: ${this.image}');
  debugPrint('email: ${this.email}');
  debugPrint('joinedOrganizations: ${this.joinedOrganizations}');
  debugPrint('adminFor: ${this.adminFor}');
  debugPrint('createdOrganizations: ${this.createdOrganizations}');
  debugPrint('membershipRequests: ${this.membershipRequests}');
}
```
:::
:::

::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../../index.html)
2.  [user_info](../../models_user_user_info/)
3.  [User](../../models_user_user_info/User-class.html)
4.  print method

##### User class

::: {#dartdoc-sidebar-left-content}
:::
:::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
:::

[ talawa 1.0.0+1 ]{.no-break}
