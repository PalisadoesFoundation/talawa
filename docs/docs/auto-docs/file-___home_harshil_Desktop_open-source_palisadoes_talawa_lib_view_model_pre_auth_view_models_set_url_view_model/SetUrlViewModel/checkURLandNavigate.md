




checkURLandNavigate method - SetUrlViewModel class - set\_url\_view\_model library - Dart API







menu

1. [talawa](../../index.html)
2. [view\_model/pre\_auth\_view\_models/set\_url\_view\_model.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_pre_auth_view_models_set_url_view_model/)
3. [SetUrlViewModel](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_pre_auth_view_models_set_url_view_model/SetUrlViewModel-class.html)
4. checkURLandNavigate method

checkURLandNavigate


dark\_mode

light\_mode




# checkURLandNavigate method


[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)<void>
checkURLandNavigate(

1. [String](https://api.flutter.dev/flutter/dart-core/String-class.html) navigateTo,
2. [String](https://api.flutter.dev/flutter/dart-core/String-class.html) argument

)

This function check the URL and navigate to the respective URL.

**params**:

* `navigateTo`: url
* `argument`: message

**returns**:
None


## Implementation

```
Future<void> checkURLandNavigate(String navigateTo, String argument) async {
  urlFocus.unfocus();
  validate = AutovalidateMode.always;

  /// if the url is valid.
  if (formKey.currentState!.validate()) {
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
        final String uri = url.text.trim();
        final bool? urlPresent =
            await locator<Validator>().validateUrlExistence(uri);
        if (urlPresent! == true) {
          final box = Hive.box('url');
          box.put(urlKey, uri);
          box.put(imageUrlKey, "$uri/talawa/");
          navigationService.pop();
          graphqlConfig.getOrgUrl();
          navigationService.pushScreen(navigateTo, arguments: argument);
        } else {
          navigationService.pop();
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

 


1. [talawa](../../index.html)
2. [set\_url\_view\_model](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_pre_auth_view_models_set_url_view_model/)
3. [SetUrlViewModel](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_pre_auth_view_models_set_url_view_model/SetUrlViewModel-class.html)
4. checkURLandNavigate method

##### SetUrlViewModel class





talawa
1.0.0+1






