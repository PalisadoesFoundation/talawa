::::::: {#dartdoc-main-content .main-content above-sidebar="utils_queries/Queries-class-sidebar.html" below-sidebar=""}
<div>

# [updateUserProfile]{.kind-method} method

</div>

::: {.section .multi-line-signature}
[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.returntype}
[updateUserProfile]{.name}()
:::

::: {.section .desc .markdown}
to update user profile.

**params**: None

**returns**:

-   `String`: return a mutation
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
String updateUserProfile() {
  return """
    mutation UpdateUserProfile(
      \$firstName: String
      \$lastName: String
      \$email: EmailAddress
      \$file: String
    ) {
    updateUserProfile(
      data: { firstName: \$firstName, lastName: \$lastName, email: \$email }
      file: \$file
    ) {
      _id
      }
    }
  """;
}
```
:::
:::::::

::::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../../index.html)
2.  [queries](../../utils_queries/)
3.  [Queries](../../utils_queries/Queries-class.html)
4.  updateUserProfile method

##### Queries class

::: {#dartdoc-sidebar-left-content}
:::
:::::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
