::::::: {#dartdoc-main-content .main-content above-sidebar="services_user_action_handler/ActionHandlerService-class-sidebar.html" below-sidebar=""}
<div>

# [executeApiCall]{.kind-method} method

</div>

::: {.section .multi-line-signature}
[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)?]{.type-parameter}\>]{.signature}]{.returntype}
[executeApiCall]{.name}({

1.  [required
    [[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[QueryResult](https://pub.dev/documentation/graphql/5.2.0-beta.9/graphql/QueryResult-class.html)[\<[[Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)?]{.type-parameter}\>]{.signature}?]{.type-parameter}\>]{.signature}]{.type-annotation}
    [action]{.parameter-name}(), ]{#executeApiCall-param-action
    .parameter}
2.  [[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[void]{.type-parameter}\>]{.signature}]{.type-annotation}
    [onValidResult]{.parameter-name}(]{#executeApiCall-param-onValidResult
    .parameter}
    1.  [[[QueryResult](https://pub.dev/documentation/graphql/5.2.0-beta.9/graphql/QueryResult-class.html)[\<[[Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)?]{.type-parameter}\>]{.signature}]{.type-annotation}]{#param-
        .parameter}

    )?,
3.  [[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[void]{.type-parameter}\>]{.signature}]{.type-annotation}
    [onActionException]{.parameter-name}(]{#executeApiCall-param-onActionException
    .parameter}
    1.  [[[Exception](https://api.flutter.dev/flutter/dart-core/Exception-class.html)]{.type-annotation}
        [e]{.parameter-name}]{#param-e .parameter}

    )?,
4.  [[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[void]{.type-parameter}\>]{.signature}]{.type-annotation}
    [onActionFinally]{.parameter-name}()?,
    ]{#executeApiCall-param-onActionFinally .parameter}

})
:::

::: {.section .desc .markdown}
Method to execute an API action.

**params**:

-   `action`: A function that performs the API call and returns a
    `Future<QueryResult<Object?>?>`.
-   `onValidResult`: A function to handle the result when the API call
    is successful.
-   `onActionException`: A function to handle exceptions that occur
    during the API call.
-   `onActionFinally`: A function to execute regardless of the success
    or failure of the API call.

**returns**:

-   `Future<bool?>`: that indicates the success (`true`), failure
    (`false`), or null if the result is invalid.
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
Future<bool?> executeApiCall({
  required Future<QueryResult<Object?>?> Function() action,
  Future<void> Function(QueryResult<Object?>)? onValidResult,
  Future<void> Function(Exception e)? onActionException,
  Future<void> Function()? onActionFinally,
}) async {
  try {
    final result = await action();
    print(result);
    if (result == null || result.data == null) return null;

    if (result.isConcrete && result.source != QueryResultSource.cache) {
      await onValidResult!(result);
    }
    return true;
  } catch (e) {
    await onActionException?.call(e as Exception);
    return false;
  } finally {
    await onActionFinally?.call();
  }
}
```
:::
:::::::

::::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../../index.html)
2.  [user_action_handler](../../services_user_action_handler/)
3.  [ActionHandlerService](../../services_user_action_handler/ActionHandlerService-class.html)
4.  executeApiCall method

##### ActionHandlerService class

::: {#dartdoc-sidebar-left-content}
:::
:::::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
