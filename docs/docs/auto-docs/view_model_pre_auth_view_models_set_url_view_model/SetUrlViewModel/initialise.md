::::::: {#dartdoc-main-content .main-content above-sidebar="view_model_pre_auth_view_models_set_url_view_model/SetUrlViewModel-class-sidebar.html" below-sidebar=""}
<div>

# [initialise]{.kind-method} method

</div>

::: {.section .multi-line-signature}
[void]{.returntype} [initialise]{.name}({

1.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-annotation}
    [inviteUrl]{.parameter-name} = [\'\']{.default-value},
    ]{#initialise-param-inviteUrl .parameter}

})
:::

::: {.section .desc .markdown}
This function initialises the variables.

**params**:

-   `inviteUrl`: url

**returns**: None
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
void initialise({String inviteUrl = ''}) {
  final uri = inviteUrl;
  if (uri.isNotEmpty) {
    /// assigning the invite server url to the url text controller.
    url.text = uri;
    final box = Hive.box('url');
    box.put(urlKey, uri);
    box.put(imageUrlKey, "$uri/talawa/");
    graphqlConfig.getOrgUrl();
  }

  /// greeting message.
  greeting = [
    {
      'text': 'Join ',
      'textStyle': Theme.of(navigationService.navigatorKey.currentContext!)
          .textTheme
          .titleLarge!
          .copyWith(fontSize: 24, fontWeight: FontWeight.w700),
    },
    {
      'text': 'and ',
      'textStyle': Theme.of(navigationService.navigatorKey.currentContext!)
          .textTheme
          .headlineSmall,
    },
    {
      'text': 'Collaborate ',
      'textStyle': Theme.of(navigationService.navigatorKey.currentContext!)
          .textTheme
          .titleLarge!
          .copyWith(fontSize: 24, fontWeight: FontWeight.w700),
    },
    {
      'text': 'with your ',
      'textStyle': Theme.of(navigationService.navigatorKey.currentContext!)
          .textTheme
          .headlineSmall,
    },
    {
      'text': 'Organizations',
      'textStyle': Theme.of(navigationService.navigatorKey.currentContext!)
          .textTheme
          .headlineSmall!
          .copyWith(fontSize: 24, color: const Color(0xFF4285F4)),
    },
  ];
  notifyListeners();
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
4.  initialise method

##### SetUrlViewModel class

::: {#dartdoc-sidebar-left-content}
:::
:::::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
