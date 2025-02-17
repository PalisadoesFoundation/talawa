
<div>

# checkURLandNavigate method

</div>


[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)\<[void\>]]
checkURLandNavigate(

1.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.md)]
    navigateTo,
    ]
2.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]
    argument]

)



This function check the URL and navigate to the respective URL.

**params**:

-   `navigateTo`: url
-   `argument`: message

**returns**: None



## Implementation

``` language-dart
Future<void> checkURLandNavigate(String navigateTo, String argument) async {
  urlFocus.;
  validate = AutovalidateMode.always;

  /// if the url is valid.
  if (formKey.currentState!.) {
    await actionHandlerService.performAction(
      actionType: ActionType.critical,
      criticalActionFailureMessage: navigateTo == '/login'
          ? TalawaErrors.youAreOfflineUnableToLogin
          : TalawaErrors.youAreOfflineUnableToSignUp,
      action: () async {
        navigationService.pushDialog(
          const CustomProgressDialog(
            key: Key('UrlCheckProgress'),
          ),
        );
        validate = AutovalidateMode.disabled;
        final String uri = url.text.;
        final bool? urlPresent =
            await locator<Validator>().validateUrlExistence(uri);
        if (urlPresent! == true) {
          final box = Hive.box('url');
          box.put(urlKey, uri);
          box.put(imageUrlKey, "$uri/talawa/");
          navigationService.;
          graphqlConfig.;
          navigationService.pushScreen(navigateTo, arguments: argument);
        } else {
          navigationService.;
          navigationService.showTalawaErrorSnackBar(
            "URL doesn't exist/no connection please check",
            MessageType.error,
          );
        }
        return null;
      },
    );
  }
}
```







1.  [talawa](../../index.md)
2.  [set_url_view_model](../../view_model_pre_auth_view_models_set_url_view_model/)
3.  [SetUrlViewModel](../../view_model_pre_auth_view_models_set_url_view_model/SetUrlViewModel-class.md)
4.  checkURLandNavigate method

##### SetUrlViewModel class







