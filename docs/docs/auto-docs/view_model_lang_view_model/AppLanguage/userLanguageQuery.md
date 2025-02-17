::::::: {#dartdoc-main-content .main-content above-sidebar="view_model_lang_view_model/AppLanguage-class-sidebar.html" below-sidebar=""}
<div>

# [userLanguageQuery]{.kind-method} method

</div>

::: {.section .multi-line-signature}
[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[void]{.type-parameter}\>]{.signature}]{.returntype}
[userLanguageQuery]{.name}(

1.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-annotation}
    [userId]{.parameter-name}]{#userLanguageQuery-param-userId
    .parameter}

)
:::

::: {.section .desc .markdown}
This function perform graphQL query to check the user\'s language in the
database.

The function uses `gqlAuthQuery` method provided by Database Functions
Services.

**params**:

-   `userId`: user for which language need to be fetch.

**returns**: None
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
Future<void> userLanguageQuery(String userId) async {
  try {
    await databaseFunctions.gqlAuthQuery(queries.newUserLanguage(userId));
  } catch (e) {
    print(e);
  }
}
```
:::
:::::::

::::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../../index.html)
2.  [lang_view_model](../../view_model_lang_view_model/)
3.  [AppLanguage](../../view_model_lang_view_model/AppLanguage-class.html)
4.  userLanguageQuery method

##### AppLanguage class

::: {#dartdoc-sidebar-left-content}
:::
:::::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
