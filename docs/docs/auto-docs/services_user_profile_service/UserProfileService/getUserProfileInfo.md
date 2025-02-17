::::::: {#dartdoc-main-content .main-content above-sidebar="services_user_profile_service/UserProfileService-class-sidebar.html" below-sidebar=""}
<div>

# [getUserProfileInfo]{.kind-method} method

</div>

::: {.section .multi-line-signature}
[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[QueryResult](https://pub.dev/documentation/graphql/5.2.0-beta.9/graphql/QueryResult-class.html)[\<[[Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)?]{.type-parameter}\>]{.signature}]{.type-parameter}\>]{.signature}]{.returntype}
[getUserProfileInfo]{.name}(

1.  [[[User](../../models_user_user_info/User-class.html)]{.type-annotation}
    [user]{.parameter-name}]{#getUserProfileInfo-param-user .parameter}

)
:::

::: {.section .desc .markdown}
Retrieves user profile information using a GraphQL query.

**params**:

-   `user`: An instance of `User` representing the user whose profile
    information is to be fetched. The user\'s ID is used as a variable
    for the GraphQL query.

**returns**:

-   `Future<QueryResult<Object?>>`: which contains the result of the
    GraphQL query.
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
Future<QueryResult<Object?>> getUserProfileInfo(User user) async {
  final QueryResult result = await databaseFunctions.gqlAuthQuery(
    queries.fetchUserInfo,
    variables: {'id': user.id},
  );
  return result;
}
```
:::
:::::::

::::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../../index.html)
2.  [user_profile_service](../../services_user_profile_service/)
3.  [UserProfileService](../../services_user_profile_service/UserProfileService-class.html)
4.  getUserProfileInfo method

##### UserProfileService class

::: {#dartdoc-sidebar-left-content}
:::
:::::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
