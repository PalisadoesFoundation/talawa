::::::: {#dartdoc-main-content .main-content above-sidebar="services_user_profile_service/UserProfileService-class-sidebar.html" below-sidebar=""}
<div>

# [updateUserProfile]{.kind-method} method

</div>

::: {.section .multi-line-signature}
[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[QueryResult](https://pub.dev/documentation/graphql/5.2.0-beta.9/graphql/QueryResult-class.html)[\<[[Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)?]{.type-parameter}\>]{.signature}]{.type-parameter}\>]{.signature}]{.returntype}
[updateUserProfile]{.name}(

1.  [[[Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)[\<[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-parameter},
    [dynamic]{.type-parameter}\>]{.signature}?]{.type-annotation}
    [variables]{.parameter-name}]{#updateUserProfile-param-variables
    .parameter}

)
:::

::: {.section .desc .markdown}
Updates the user profile using a GraphQL mutation.

**params**:

-   `variables`: A map of key-value pairs representing the variables
    required for the GraphQL mutation. If `null`, the mutation is
    performed without additional variables.

**returns**:

-   `Future<QueryResult<Object?>>`: which contains the result of the
    GraphQL mutation.
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
Future<QueryResult<Object?>> updateUserProfile(
  Map<String, dynamic>? variables,
) {
  return databaseFunctions.gqlAuthMutation(
    queries.updateUserProfile(),
    variables: variables,
  );
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
4.  updateUserProfile method

##### UserProfileService class

::: {#dartdoc-sidebar-left-content}
:::
:::::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
