::: {#overlay-under-drawer}
:::

::: {#title}
[menu]{#sidenav-left-toggle .material-symbols-outlined role="button"
tabindex="0"}

1.  [talawa](../index.html)
2.  [services/database_mutation_functions.dart](../services_database_mutation_functions/)
3.  DataBaseMutationFunctions class

::: self-name
DataBaseMutationFunctions
:::

::: {#theme-button .toggle title="Toggle brightness"}
[ dark_mode ]{#dark-theme-button .material-symbols-outlined} [
light_mode ]{#light-theme-button .material-symbols-outlined}
:::
:::

::: {role="main"}
::: {#dartdoc-main-content .main-content above-sidebar="services_database_mutation_functions/services_database_mutation_functions-library-sidebar.html" below-sidebar="services_database_mutation_functions/DataBaseMutationFunctions-class-sidebar.html"}
<div>

# [DataBaseMutationFunctions]{.kind-class} class

</div>

::: {.section .desc .markdown}
DataBaseMutationFunctions class provides different services that are
under the context of graphQL mutations and queries.

Services include:

-   `encounteredExceptionOrError`
-   `gqlAuthQuery`
-   `gqlAuthMutation`
-   `gqlNonAuthMutation`
-   `gqlNonAuthQuery`
-   `refreshAccessToken`
-   `fetchOrgById`
:::

::: {#constructors .section .summary .offset-anchor}
## Constructors

[[DataBaseMutationFunctions](../services_database_mutation_functions/DataBaseMutationFunctions/DataBaseMutationFunctions.html)]{.name}[()]{.signature}

:   
:::

::: {#instance-properties .section .summary .offset-anchor}
## Properties

[[clientAuth](../services_database_mutation_functions/DataBaseMutationFunctions/clientAuth.html)]{.name} [↔ [GraphQLClient](https://pub.dev/documentation/graphql/5.2.0-beta.9/graphql/GraphQLClient-class.html)]{.signature}
:   Client Auth for handling authenticated request.
    ::: features
    [getter/setter pair]{.feature}
    :::

[[clientNonAuth](../services_database_mutation_functions/DataBaseMutationFunctions/clientNonAuth.html)]{.name} [↔ [GraphQLClient](https://pub.dev/documentation/graphql/5.2.0-beta.9/graphql/GraphQLClient-class.html)]{.signature}
:   Client Auth for handling non-authenticated request.
    ::: features
    [getter/setter pair]{.feature}
    :::

[[hashCode](https://api.flutter.dev/flutter/dart-core/Object/hashCode.html)]{.name} [→ [int](https://api.flutter.dev/flutter/dart-core/int-class.html)]{.signature}
:   The hash code for this object.
    ::: features
    [no setter]{.feature}[inherited]{.feature}
    :::

[[noData](../services_database_mutation_functions/DataBaseMutationFunctions/noData.html)]{.name} [↔ [QueryResult](https://pub.dev/documentation/graphql/5.2.0-beta.9/graphql/QueryResult-class.html)[\<[[Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)?]{.type-parameter}\>]{.signature}]{.signature}
:   when result has no data and null.
    ::: features
    [getter/setter pair]{.feature}
    :::

[[runtimeType](https://api.flutter.dev/flutter/dart-core/Object/runtimeType.html)]{.name} [→ [Type](https://api.flutter.dev/flutter/dart-core/Type-class.html)]{.signature}
:   A representation of the runtime type of the object.
    ::: features
    [no setter]{.feature}[inherited]{.feature}
    :::
:::

::: {#instance-methods .section .summary .offset-anchor}
## Methods

[[fetchOrgById](../services_database_mutation_functions/DataBaseMutationFunctions/fetchOrgById.html)]{.name}[([[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-annotation} [id]{.parameter-name}]{#fetchOrgById-param-id .parameter}) [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)]{.returntype .parameter} ]{.signature}
:   This function fetch the organization using the `id` passed.

[[gqlAuthMutation](../services_database_mutation_functions/DataBaseMutationFunctions/gqlAuthMutation.html)]{.name}[([[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-annotation} [mutation]{.parameter-name}, {]{#gqlAuthMutation-param-mutation .parameter}[[[Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)[\<[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-parameter}, [dynamic]{.type-parameter}\>]{.signature}?]{.type-annotation} [variables]{.parameter-name}]{#gqlAuthMutation-param-variables .parameter}}) [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[QueryResult](https://pub.dev/documentation/graphql/5.2.0-beta.9/graphql/QueryResult-class.html)[\<[[Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)?]{.type-parameter}\>]{.signature}]{.type-parameter}\>]{.signature}]{.returntype .parameter} ]{.signature}
:   This function is used to run the graph-ql mutation for authenticated
    user.

[[gqlAuthQuery](../services_database_mutation_functions/DataBaseMutationFunctions/gqlAuthQuery.html)]{.name}[([[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-annotation} [query]{.parameter-name}, {]{#gqlAuthQuery-param-query .parameter}[[[Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)[\<[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-parameter}, [dynamic]{.type-parameter}\>]{.signature}?]{.type-annotation} [variables]{.parameter-name}]{#gqlAuthQuery-param-variables .parameter}}) [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[QueryResult](https://pub.dev/documentation/graphql/5.2.0-beta.9/graphql/QueryResult-class.html)[\<[[Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)?]{.type-parameter}\>]{.signature}]{.type-parameter}\>]{.signature}]{.returntype .parameter} ]{.signature}
:   This function is used to run the graph-ql query for authentication.

[[gqlNonAuthMutation](../services_database_mutation_functions/DataBaseMutationFunctions/gqlNonAuthMutation.html)]{.name}[([[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-annotation} [mutation]{.parameter-name}, {]{#gqlNonAuthMutation-param-mutation .parameter}[[[Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)[\<[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-parameter}, [dynamic]{.type-parameter}\>]{.signature}?]{.type-annotation} [variables]{.parameter-name}, ]{#gqlNonAuthMutation-param-variables .parameter}[[[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]{.type-annotation} [reCall]{.parameter-name} = [true]{.default-value}]{#gqlNonAuthMutation-param-reCall .parameter}}) [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[QueryResult](https://pub.dev/documentation/graphql/5.2.0-beta.9/graphql/QueryResult-class.html)[\<[[Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)?]{.type-parameter}\>]{.signature}]{.type-parameter}\>]{.signature}]{.returntype .parameter} ]{.signature}
:   This function is used to run the graph-ql mutation to authenticate
    the non signed-in user.

[[gqlNonAuthQuery](../services_database_mutation_functions/DataBaseMutationFunctions/gqlNonAuthQuery.html)]{.name}[([[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-annotation} [query]{.parameter-name}, {]{#gqlNonAuthQuery-param-query .parameter}[[[Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)[\<[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-parameter}, [dynamic]{.type-parameter}\>]{.signature}?]{.type-annotation} [variables]{.parameter-name}]{#gqlNonAuthQuery-param-variables .parameter}}) [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[QueryResult](https://pub.dev/documentation/graphql/5.2.0-beta.9/graphql/QueryResult-class.html)[\<[[Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)?]{.type-parameter}\>]{.signature}]{.type-parameter}\>]{.signature}]{.returntype .parameter} ]{.signature}
:   This function is used to run the graph-ql query for the non
    signed-in user.

[[init](../services_database_mutation_functions/DataBaseMutationFunctions/init.html)]{.name}[() [→ void]{.returntype .parameter} ]{.signature}
:   Initialization function.

[[initClientNonAuth](../services_database_mutation_functions/DataBaseMutationFunctions/initClientNonAuth.html)]{.name}[() [→ void]{.returntype .parameter} ]{.signature}
:   Initializes
    [clientNonAuth](../services_database_mutation_functions/DataBaseMutationFunctions/clientNonAuth.html)
    function.

[[noSuchMethod](https://api.flutter.dev/flutter/dart-core/Object/noSuchMethod.html)]{.name}[([[[Invocation](https://api.flutter.dev/flutter/dart-core/Invocation-class.html)]{.type-annotation} [invocation]{.parameter-name}]{#noSuchMethod-param-invocation .parameter}) [→ dynamic]{.returntype .parameter} ]{.signature}
:   Invoked when a nonexistent method or property is accessed.
    ::: features
    [inherited]{.feature}
    :::

[[refreshAccessToken](../services_database_mutation_functions/DataBaseMutationFunctions/refreshAccessToken.html)]{.name}[([[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-annotation} [refreshToken]{.parameter-name}]{#refreshAccessToken-param-refreshToken .parameter}) [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]{.type-parameter}\>]{.signature}]{.returntype .parameter} ]{.signature}
:   This function is used to refresh the Authenication token to access
    the application.

[[toString](https://api.flutter.dev/flutter/dart-core/Object/toString.html)]{.name}[() [→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.returntype .parameter} ]{.signature}
:   A string representation of this object.
    ::: features
    [inherited]{.feature}
    :::
:::

::: {#operators .section .summary .offset-anchor .inherited}
## Operators

[[operator ==](https://api.flutter.dev/flutter/dart-core/Object/operator_equals.html)]{.name}[([[[Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)]{.type-annotation} [other]{.parameter-name}]{#==-param-other .parameter}) [→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]{.returntype .parameter} ]{.signature}
:   The equality operator.
    ::: features
    [inherited]{.feature}
    :::
:::
:::

::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../index.html)
2.  [database_mutation_functions](../services_database_mutation_functions/)
3.  DataBaseMutationFunctions class

##### database_mutation_functions library

::: {#dartdoc-sidebar-left-content}
:::
:::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
:::

[ talawa 1.0.0+1 ]{.no-break}
