::::::::: {#dartdoc-main-content .main-content above-sidebar="models_caching_cached_user_action/CachedUserAction-class-sidebar.html" below-sidebar=""}
<div>

# [toString]{.kind-method} method

</div>

::::: {.section .multi-line-signature}
<div>

1.  @[override](https://api.flutter.dev/flutter/dart-core/override-constant.html)

</div>

[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.returntype}
[toString]{.name}()

::: features
[override]{.feature}
:::
:::::

::: {.section .desc .markdown}
A string representation of this object.

Some classes have a default textual representation, often paired with a
static `parse` function (like
[int.parse](https://api.flutter.dev/flutter/dart-core/int/parse.html)).
These classes will provide the textual representation as their string
representation.

Other classes have no meaningful textual representation that a program
will care about. Such classes will typically override `toString` to
provide useful information when inspecting the object, mainly for
debugging or logging.
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
@override
String toString() {
  return '''
    CachedUserAction(
      id: $id,
      operation: $operation,
      variables: $variables,
      timeStamp: $timeStamp,
      expiry: $expiry,
      status: $status,
      metaData: $metaData,
      operationType: $operationType,
    )
  ''';
}
```
:::
:::::::::

::::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../../index.html)
2.  [cached_user_action](../../models_caching_cached_user_action/)
3.  [CachedUserAction](../../models_caching_cached_user_action/CachedUserAction-class.html)
4.  toString method

##### CachedUserAction class

::: {#dartdoc-sidebar-left-content}
:::
:::::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
