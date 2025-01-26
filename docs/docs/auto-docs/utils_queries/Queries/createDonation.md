::: {#overlay-under-drawer}
:::

::: {#title}
[menu]{#sidenav-left-toggle .material-symbols-outlined role="button"
tabindex="0"}

1.  [talawa](../../index.html)
2.  [utils/queries.dart](../../utils_queries/)
3.  [Queries](../../utils_queries/Queries-class.html)
4.  createDonation method

::: self-name
createDonation
:::

::: {#theme-button .toggle title="Toggle brightness"}
[ dark_mode ]{#dark-theme-button .material-symbols-outlined} [
light_mode ]{#light-theme-button .material-symbols-outlined}
:::
:::

::: {role="main"}
::: {#dartdoc-main-content .main-content above-sidebar="utils_queries/Queries-class-sidebar.html" below-sidebar=""}
<div>

# [createDonation]{.kind-method} method

</div>

::: {.section .multi-line-signature}
[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.returntype}
[createDonation]{.name}(

1.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-annotation}
    [userId]{.parameter-name}, ]{#createDonation-param-userId
    .parameter}
2.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-annotation}
    [orgId]{.parameter-name}, ]{#createDonation-param-orgId .parameter}
3.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-annotation}
    [nameOfOrg]{.parameter-name}, ]{#createDonation-param-nameOfOrg
    .parameter}
4.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-annotation}
    [nameOfUser]{.parameter-name}, ]{#createDonation-param-nameOfUser
    .parameter}
5.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-annotation}
    [payPalId]{.parameter-name}, ]{#createDonation-param-payPalId
    .parameter}
6.  [[[double](https://api.flutter.dev/flutter/dart-core/double-class.html)]{.type-annotation}
    [amount]{.parameter-name}, ]{#createDonation-param-amount
    .parameter}

)
:::

::: {.section .desc .markdown}
`createDonation` creates a new donation transaction by taking the userId
,orgId ,nameOfOrg ,nameOfUser as parameters.

more_info_if_required

**params**:

-   `userId`: user identifier
-   `orgId`: org identifier
-   `nameOfOrg`: org data
-   `nameOfUser`: user data
-   `payPalId`: for payment
-   `amount`: amount

**returns**:

-   `String`: mutation in string form, to be passed on to graphql
    client.
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
String createDonation(
  String userId,
  String orgId,
  String nameOfOrg,
  String nameOfUser,
  String payPalId,
  double amount,
) {
  return '''
    mutation createDonationMutation { createDonation(
          userId :"$userId"
          orgId :"$orgId",
          nameOfOrg:"$nameOfOrg",
          nameOfUser:"$nameOfUser",
          payPalId:"$payPalId"
          amount :$amount
      ){
          _id
          payPalId
          userId
          orgId
          payPalId
          nameOfUser
      }
    }
    ''';
}
```
:::
:::

::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../../index.html)
2.  [queries](../../utils_queries/)
3.  [Queries](../../utils_queries/Queries-class.html)
4.  createDonation method

##### Queries class

::: {#dartdoc-sidebar-left-content}
:::
:::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
:::

[ talawa 1.0.0+1 ]{.no-break}
