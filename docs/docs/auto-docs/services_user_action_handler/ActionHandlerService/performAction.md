::: {#overlay-under-drawer}
:::

::: {#title}
[menu]{#sidenav-left-toggle .material-symbols-outlined role="button"
tabindex="0"}

1.  [talawa](../../index.html)
2.  [services/user_action_handler.dart](../../services_user_action_handler/)
3.  [ActionHandlerService](../../services_user_action_handler/ActionHandlerService-class.html)
4.  performAction method

::: self-name
performAction
:::

::: {#theme-button .toggle title="Toggle brightness"}
[ dark_mode ]{#dark-theme-button .material-symbols-outlined} [
light_mode ]{#light-theme-button .material-symbols-outlined}
:::
:::

::: {role="main"}
::: {#dartdoc-main-content .main-content above-sidebar="services_user_action_handler/ActionHandlerService-class-sidebar.html" below-sidebar=""}
<div>

# [performAction]{.kind-method} method

</div>

::: {.section .multi-line-signature}
[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[void]{.type-parameter}\>]{.signature}]{.returntype}
[performAction]{.name}({

1.  [required
    [[ActionType](../../enums_enums/ActionType.html)]{.type-annotation}
    [actionType]{.parameter-name}, ]{#performAction-param-actionType
    .parameter}
2.  [required
    [[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[QueryResult](https://pub.dev/documentation/graphql/5.2.0-beta.9/graphql/QueryResult-class.html)[\<[[Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)?]{.type-parameter}\>]{.signature}?]{.type-parameter}\>]{.signature}]{.type-annotation}
    [action]{.parameter-name}(), ]{#performAction-param-action
    .parameter}
3.  [[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[void]{.type-parameter}\>]{.signature}]{.type-annotation}
    [onValidResult]{.parameter-name}(]{#performAction-param-onValidResult
    .parameter}
    1.  [[[QueryResult](https://pub.dev/documentation/graphql/5.2.0-beta.9/graphql/QueryResult-class.html)[\<[[Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)?]{.type-parameter}\>]{.signature}]{.type-annotation}
        [result]{.parameter-name}]{#param-result .parameter}

    )?,
4.  [[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[void]{.type-parameter}\>]{.signature}]{.type-annotation}
    [onActionException]{.parameter-name}(]{#performAction-param-onActionException
    .parameter}
    1.  [[[Exception](https://api.flutter.dev/flutter/dart-core/Exception-class.html)]{.type-annotation}
        [e]{.parameter-name}]{#param-e .parameter}

    )?,
5.  [[void]{.type-annotation} [updateUI]{.parameter-name}()?,
    ]{#performAction-param-updateUI .parameter}
6.  [[void]{.type-annotation}
    [apiCallSuccessUpdateUI]{.parameter-name}()?,
    ]{#performAction-param-apiCallSuccessUpdateUI .parameter}
7.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)?]{.type-annotation}
    [criticalActionFailureMessage]{.parameter-name} =
    [TalawaErrors.userActionNotSaved]{.default-value},
    ]{#performAction-param-criticalActionFailureMessage .parameter}
8.  [[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[void]{.type-parameter}\>]{.signature}]{.type-annotation}
    [onActionFinally]{.parameter-name}()?,
    ]{#performAction-param-onActionFinally .parameter}

})
:::

::: {.section .desc .markdown}
Processes a user action based on its type, with error handling and UI
update.

**params**:

-   `actionType`: Specifies whether the action is optimistic or
    critical.
-   `action`: The action to perform, which returns a
    `Future<QueryResult<Object?>?>`.
-   `onValidResult`: A function to handle the result when the action is
    successful.
-   `onActionException`: A function to handle exceptions that occur
    during the action.
-   `updateUI`: A function to update the UI immediately for optimistic
    actions or after API call for critical actions.
-   `apiCallSuccessUpdateUI`: A function to update the UI upon
    successful API call.
-   `criticalActionFailureMessage`: The error message to use when a
    critical action fails.
-   `onActionFinally`: A function to execute regardless of the success
    or failure of the action.

**returns**: None
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
Future<void> performAction({
  required ActionType actionType,
  required Future<QueryResult<Object?>?> Function() action,
  Future<void> Function(QueryResult<Object?> result)? onValidResult,
  Future<void> Function(Exception e)? onActionException,
  void Function()? updateUI,
  void Function()? apiCallSuccessUpdateUI,
  String? criticalActionFailureMessage = TalawaErrors.userActionNotSaved,
  Future<void> Function()? onActionFinally,
}) async {
  bool? success;
  // optimistic
  if (actionType == ActionType.optimistic) {
    // Update UI immediately for optimistic actions
    updateUI?.call();
    success = await executeApiCall(
      action: action,
      onValidResult: onValidResult,
      onActionException: onActionException,
      onActionFinally: onActionFinally,
    );
  } else {
    if (AppConnectivity.isOnline) {
      // Perform critical action with UI update after API call
      success = await executeApiCall(
        action: action,
        onValidResult: onValidResult,
        onActionException: onActionException,
        onActionFinally: onActionFinally,
      );
      updateUI?.call();
      if (success ?? false) {
        apiCallSuccessUpdateUI?.call();
      }
    } else {
      updateUI?.call();
      GraphqlExceptionResolver.encounteredExceptionOrError(
        CriticalActionException(criticalActionFailureMessage!),
      );
    }
  }
}
```
:::
:::

::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../../index.html)
2.  [user_action_handler](../../services_user_action_handler/)
3.  [ActionHandlerService](../../services_user_action_handler/ActionHandlerService-class.html)
4.  performAction method

##### ActionHandlerService class

::: {#dartdoc-sidebar-left-content}
:::
:::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
:::

[ talawa 1.0.0+1 ]{.no-break}
