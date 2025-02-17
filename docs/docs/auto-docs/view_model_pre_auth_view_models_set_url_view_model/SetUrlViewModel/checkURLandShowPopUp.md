
<div>

# checkURLandShowPopUp method

</div>


[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)\<[void\>]]
checkURLandShowPopUp(

1.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]
    argument]

)



This function check the URL and navigate to the respective URL.

**params**:

-   `argument`: message

**returns**: None



## Implementation

``` language-dart
Future<void> checkURLandShowPopUp(String argument) async {
  urlFocus.;
  validate = AutovalidateMode.always;

  // if the url is valid.
  if (formKey.currentState!.) {
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
      navigationService.showSnackBar("Url is valid");
    } else {
      navigationService.;
      navigationService.showTalawaErrorDialog(
        "URL doesn't exist/no connection please check",
        MessageType.info,
      );
    }
  }
}
```







1.  [talawa](../../index.html)
2.  [set_url_view_model](../../view_model_pre_auth_view_models_set_url_view_model/)
3.  [SetUrlViewModel](../../view_model_pre_auth_view_models_set_url_view_model/SetUrlViewModel-class.html)
4.  checkURLandShowPopUp method

##### SetUrlViewModel class







