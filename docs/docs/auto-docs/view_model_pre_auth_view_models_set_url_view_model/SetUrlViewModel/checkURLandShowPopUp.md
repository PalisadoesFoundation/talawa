


# checkURLandShowPopUp method








[Future](https://api.flutter.dev/flutter/dart-async/Future-class.html)&lt;void> checkURLandShowPopUp
([String](https://api.flutter.dev/flutter/dart-core/String-class.html) argument)





<p>This function check the URL and navigate to the respective URL.</p>
<p><strong>params</strong>:</p>
<ul>
<li><code>argument</code>: message</li>
</ul>
<p><strong>returns</strong>:</p>
<ul>
<li><code>Future&lt;void&gt;</code>: sdf</li>
</ul>



## Implementation

```dart
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







