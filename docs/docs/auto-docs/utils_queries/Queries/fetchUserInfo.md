::: {#overlay-under-drawer}
:::

::: {#title}
[menu]{#sidenav-left-toggle .material-symbols-outlined role="button"
tabindex="0"}

1.  [talawa](../../index.html)
2.  [utils/queries.dart](../../utils_queries/)
3.  [Queries](../../utils_queries/Queries-class.html)
4.  fetchUserInfo property

::: self-name
fetchUserInfo
:::

::: {#theme-button .toggle title="Toggle brightness"}
[ dark_mode ]{#dark-theme-button .material-symbols-outlined} [
light_mode ]{#light-theme-button .material-symbols-outlined}
:::
:::

::: {role="main"}
::: {#dartdoc-main-content .main-content above-sidebar="utils_queries/Queries-class-sidebar.html" below-sidebar=""}
<div>

# [fetchUserInfo]{.kind-property} property

</div>

::: {.section .multi-line-signature}
[String](https://api.flutter.dev/flutter/dart-core/String-class.html)
[fetchUserInfo]{.name}

::: features
[getter/setter pair]{.feature}
:::
:::

::: {.section .desc .markdown}
mutation in string form, to be passed on to graphql client..
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
String fetchUserInfo = '''
     query Users(\$id: ID!){
        users(where: { id: \$id }) {
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
        }
      }
  ''';
```
:::
:::

::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../../index.html)
2.  [queries](../../utils_queries/)
3.  [Queries](../../utils_queries/Queries-class.html)
4.  fetchUserInfo property

##### Queries class

::: {#dartdoc-sidebar-left-content}
:::
:::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
:::

[ talawa 1.0.0+1 ]{.no-break}
