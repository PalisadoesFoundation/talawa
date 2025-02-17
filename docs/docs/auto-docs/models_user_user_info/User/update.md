::::::: {#dartdoc-main-content .main-content above-sidebar="models_user_user_info/User-class-sidebar.html" below-sidebar=""}
<div>

# [update]{.kind-method} method

</div>

::: {.section .multi-line-signature}
[void]{.returntype} [update]{.name}(

1.  [[[User](../../models_user_user_info/User-class.html)]{.type-annotation}
    [details]{.parameter-name}]{#update-param-details .parameter}

)
:::

::: {.section .desc .markdown}
Method to update the user details.

**params**:

-   `details`: updated user Info/details

**returns**: None
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
void update(User details) {
  this.firstName = details.firstName;
  this.lastName = details.lastName;
  this.email = details.email;
  this.image = details.image;
  this.authToken = details.authToken;
  // this.refreshToken = details.refreshToken;
  // this.joinedOrganizations = details.joinedOrganizations;
  // this.createdOrganizations = details.createdOrganizations;
  // this.membershipRequests = details.membershipRequests;
  // this.adminFor = details.adminFor;
}
```
:::
:::::::

::::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../../index.html)
2.  [user_info](../../models_user_user_info/)
3.  [User](../../models_user_user_info/User-class.html)
4.  update method

##### User class

::: {#dartdoc-sidebar-left-content}
:::
:::::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
