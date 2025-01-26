::: {#overlay-under-drawer}
:::

::: {#title}
[menu]{#sidenav-left-toggle .material-symbols-outlined role="button"
tabindex="0"}

1.  [talawa](../../index.html)
2.  [utils/queries.dart](../../utils_queries/)
3.  [Queries](../../utils_queries/Queries-class.html)
4.  registerUser method

::: self-name
registerUser
:::

::: {#theme-button .toggle title="Toggle brightness"}
[ dark_mode ]{#dark-theme-button .material-symbols-outlined} [
light_mode ]{#light-theme-button .material-symbols-outlined}
:::
:::

::: {role="main"}
::: {#dartdoc-main-content .main-content above-sidebar="utils_queries/Queries-class-sidebar.html" below-sidebar=""}
<div>

# [registerUser]{.kind-method} method

</div>

::: {.section .multi-line-signature}
[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.returntype}
[registerUser]{.name}(

1.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-annotation}
    [firstName]{.parameter-name}, ]{#registerUser-param-firstName
    .parameter}
2.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-annotation}
    [lastName]{.parameter-name}, ]{#registerUser-param-lastName
    .parameter}
3.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-annotation}
    [email]{.parameter-name}, ]{#registerUser-param-email .parameter}
4.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-annotation}
    [password]{.parameter-name}, ]{#registerUser-param-password
    .parameter}
5.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)?]{.type-annotation}
    [selectedOrganization]{.parameter-name},
    ]{#registerUser-param-selectedOrganization .parameter}

)
:::

::: {.section .desc .markdown}
Mutation to register a user.

**params**:

-   `firstName`: user\'s data.
-   `lastName`: user\'s data.
-   `email`: user\'s data.
-   `password`: user\'s data.
-   `selectedOrganization`: ID of the selected organization.

**returns**:

-   `String`: Return the mutation in string type to be passed to graphql
    client.
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
String registerUser(
  String firstName,
  String lastName,
  String email,
  String password,
  String? selectedOrganization,
) {
  return """
      mutation{
        signUp(data: {firstName: "$firstName", lastName: "$lastName", email: "$email", password: "$password", selectedOrganization: "$selectedOrganization"})
        {
          appUserProfile{
            adminFor{
              _id
              name
            }
            createdOrganizations{
              _id
              name
              image
              description
              userRegistrationRequired
              creator{
                _id
                firstName
                lastName
                image
              }
            }
          }
          user{
              _id
              firstName
              lastName
              email
              image
              joinedOrganizations{
                _id
                name
                image
                description
                userRegistrationRequired
                creator{
                  _id
                  firstName
                  lastName
                  image
                }
              }
              membershipRequests{
                organization{
                  _id
                  name
                  image
                  description
                  userRegistrationRequired
                  creator{
                    _id
                    firstName
                    lastName
                    image
                  }
                }
              }
            }
            refreshToken
            accessToken
          }
      }
  """;
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
4.  registerUser method

##### Queries class

::: {#dartdoc-sidebar-left-content}
:::
:::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
:::

[ talawa 1.0.0+1 ]{.no-break}
