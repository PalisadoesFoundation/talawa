::::::: {#dartdoc-main-content .main-content above-sidebar="utils_queries/Queries-class-sidebar.html" below-sidebar=""}
<div>

# [loginUser]{.kind-method} method

</div>

::: {.section .multi-line-signature}
[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.returntype}
[loginUser]{.name}(

1.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-annotation}
    [email]{.parameter-name}, ]{#loginUser-param-email .parameter}
2.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-annotation}
    [password]{.parameter-name}]{#loginUser-param-password .parameter}

)
:::

::: {.section .desc .markdown}
mutation to login the user.

**params**:

-   `email`: user\'s data
-   `password`: user\'s data

**returns**:

-   `String`: mutation in string form, to be passed on to graphql
    client.
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
String loginUser(String email, String password) {
  return """
    query {
    signIn(input: { emailAddress: "$email", password: "$password" }) {
      authenticationToken,
      user {
        id,
        name,
        emailAddress,
        name,
        avatarURL,
      }
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
4.  loginUser method

##### Queries class

::: {#dartdoc-sidebar-left-content}
:::
:::::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
