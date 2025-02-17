::::::: {#dartdoc-main-content .main-content above-sidebar="view_model_pre_auth_view_models_set_url_view_model/SetUrlViewModel-class-sidebar.html" below-sidebar=""}
<div>

# [checkURLandShowPopUp]{.kind-method} method

</div>

::: {.section .multi-line-signature}
[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[void]{.type-parameter}\>]{.signature}]{.returntype}
[checkURLandShowPopUp]{.name}(

1.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-annotation}
    [argument]{.parameter-name}]{#checkURLandShowPopUp-param-argument
    .parameter}

)
:::

::: {.section .desc .markdown}
This function check the URL and navigate to the respective URL.

**params**:

-   `argument`: message

**returns**: None
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
Future<void> checkURLandShowPopUp(String argument) async {
  urlFocus.unfocus();
  validate = AutovalidateMode.always;

  // if the url is valid.
  if (formKey.currentState!.validate()) {
    navigationService.pushDialog(
      const CustomProgressDialog(
        key: Key('UrlCheckProgress'),
      ),
    );
    validate = AutovalidateMode.disabled;
    final String uri = url.text.trim();
    final bool? urlPresent =
        await locator<Validator>().validateUrlExistence(uri);
    if (urlPresent! == true) {
      final box = Hive.box('url');
      box.put(urlKey, uri);
      box.put(imageUrlKey, "$uri/talawa/");
      navigationService.pop();
      graphqlConfig.getOrgUrl();
      navigationService.showSnackBar("Url is valid");
    } else {
      navigationService.pop();
      navigationService.showTalawaErrorDialog(
        "URL doesn't exist/no connection please check",
        MessageType.info,
      );
    }
  }
}
```
:::
:::::::

::::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../../index.html)
2.  [set_url_view_model](../../view_model_pre_auth_view_models_set_url_view_model/)
3.  [SetUrlViewModel](../../view_model_pre_auth_view_models_set_url_view_model/SetUrlViewModel-class.html)
4.  checkURLandShowPopUp method

##### SetUrlViewModel class

::: {#dartdoc-sidebar-left-content}
:::
:::::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
