::: {#overlay-under-drawer}
:::

::: {#title}
[menu]{#sidenav-left-toggle .material-symbols-outlined role="button"
tabindex="0"}

1.  [talawa](../index.html)
2.  [exceptions/critical_action_exception.dart](../exceptions_critical_action_exception/)
3.  CriticalActionException class

::: self-name
CriticalActionException
:::

::: {#theme-button .toggle title="Toggle brightness"}
[ dark_mode ]{#dark-theme-button .material-symbols-outlined} [
light_mode ]{#light-theme-button .material-symbols-outlined}
:::
:::

::: {role="main"}
::: {#dartdoc-main-content .main-content above-sidebar="exceptions_critical_action_exception/exceptions_critical_action_exception-library-sidebar.html" below-sidebar="exceptions_critical_action_exception/CriticalActionException-class-sidebar.html"}
<div>

# [CriticalActionException]{.kind-class} class

</div>

::: {.section .desc .markdown}
Exception thrown for critical actions that require special handling.

Extends
[OperationException](https://pub.dev/documentation/graphql/5.2.0-beta.9/graphql/OperationException-class.html)
to integrate with GraphQL error handling.
:::

::: section

Inheritance

:   -   [Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)
    -   [OperationException](https://pub.dev/documentation/graphql/5.2.0-beta.9/graphql/OperationException-class.html)
    -   CriticalActionException
:::

::: {#constructors .section .summary .offset-anchor}
## Constructors

[[CriticalActionException](../exceptions_critical_action_exception/CriticalActionException/CriticalActionException.html)]{.name}[([[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-annotation} [actionError]{.parameter-name}]{#-param-actionError .parameter})]{.signature}
:   Constructor for
    [CriticalActionException](../exceptions_critical_action_exception/CriticalActionException-class.html).
:::

::: {#instance-properties .section .summary .offset-anchor}
## Properties

[[actionError](../exceptions_critical_action_exception/CriticalActionException/actionError.html)]{.name} [↔ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.signature}
:   The error message associated with this critical action.
    ::: features
    [getter/setter pair]{.feature}
    :::

[[graphqlErrors](https://pub.dev/documentation/graphql/5.2.0-beta.9/graphql/OperationException/graphqlErrors.html)]{.name} [↔ [List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[GraphQLError](https://pub.dev/documentation/gql_exec/1.1.1-alpha+1699813812660/graphql_flutter/GraphQLError-class.html)]{.type-parameter}\>]{.signature}]{.signature}
:   Any graphql errors returned from the operation
    ::: features
    [getter/setter pair]{.feature}[inherited]{.feature}
    :::

[[hashCode](https://api.flutter.dev/flutter/dart-core/Object/hashCode.html)]{.name} [→ [int](https://api.flutter.dev/flutter/dart-core/int-class.html)]{.signature}
:   The hash code for this object.
    ::: features
    [no setter]{.feature}[inherited]{.feature}
    :::

[[linkException](https://pub.dev/documentation/graphql/5.2.0-beta.9/graphql/OperationException/linkException.html)]{.name} [↔ [LinkException](https://pub.dev/documentation/gql_link/1.0.1-alpha+1705114622987/graphql_flutter/LinkException-class.html)?]{.signature}
:   Errors encountered during execution such as network or cache errors
    ::: features
    [getter/setter pair]{.feature}[inherited]{.feature}
    :::

[[originalStackTrace](https://pub.dev/documentation/graphql/5.2.0-beta.9/graphql/OperationException/originalStackTrace.html)]{.name} [↔ [StackTrace](https://api.flutter.dev/flutter/dart-core/StackTrace-class.html)?]{.signature}

:   ::: features
    [getter/setter pair]{.feature}[inherited]{.feature}
    :::

[[raw](https://pub.dev/documentation/graphql/5.2.0-beta.9/graphql/OperationException/raw.html)]{.name} [↔ [List](https://api.flutter.dev/flutter/dart-core/List-class.html)?]{.signature}

:   ::: features
    [getter/setter pair]{.feature}[inherited]{.feature}
    :::

[[runtimeType](https://api.flutter.dev/flutter/dart-core/Object/runtimeType.html)]{.name} [→ [Type](https://api.flutter.dev/flutter/dart-core/Type-class.html)]{.signature}
:   A representation of the runtime type of the object.
    ::: features
    [no setter]{.feature}[inherited]{.feature}
    :::
:::

::: {#instance-methods .section .summary .offset-anchor}
## Methods

[[addError](https://pub.dev/documentation/graphql/5.2.0-beta.9/graphql/OperationException/addError.html)]{.name}[([[[GraphQLError](https://pub.dev/documentation/gql_exec/1.1.1-alpha+1699813812660/graphql_flutter/GraphQLError-class.html)]{.type-annotation} [error]{.parameter-name}]{#addError-param-error .parameter}) [→ void]{.returntype .parameter} ]{.signature}

:   ::: features
    [inherited]{.feature}
    :::

[[noSuchMethod](https://api.flutter.dev/flutter/dart-core/Object/noSuchMethod.html)]{.name}[([[[Invocation](https://api.flutter.dev/flutter/dart-core/Invocation-class.html)]{.type-annotation} [invocation]{.parameter-name}]{#noSuchMethod-param-invocation .parameter}) [→ dynamic]{.returntype .parameter} ]{.signature}
:   Invoked when a nonexistent method or property is accessed.
    ::: features
    [inherited]{.feature}
    :::

[[toString](../exceptions_critical_action_exception/CriticalActionException/toString.html)]{.name}[() [→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.returntype .parameter} ]{.signature}
:   A string representation of this object.
    ::: features
    [override]{.feature}
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
2.  [critical_action_exception](../exceptions_critical_action_exception/)
3.  CriticalActionException class

##### critical_action_exception library

::: {#dartdoc-sidebar-left-content}
:::
:::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
:::

[ talawa 1.0.0+1 ]{.no-break}
