




initialise method - SetUrlViewModel class - set\_url\_view\_model library - Dart API







menu

1. [talawa](../../index.html)
2. [view\_model/pre\_auth\_view\_models/set\_url\_view\_model.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_pre_auth_view_models_set_url_view_model/)
3. [SetUrlViewModel](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_pre_auth_view_models_set_url_view_model/SetUrlViewModel-class.html)
4. initialise method

initialise


dark\_mode

light\_mode




# initialise method


void
initialise({

1. [String](https://api.flutter.dev/flutter/dart-core/String-class.html) inviteUrl = '',

})

This function initialises the variables.

**params**:

* `inviteUrl`: url

**returns**:
None


## Implementation

```
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

 


1. [talawa](../../index.html)
2. [set\_url\_view\_model](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_pre_auth_view_models_set_url_view_model/)
3. [SetUrlViewModel](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_pre_auth_view_models_set_url_view_model/SetUrlViewModel-class.html)
4. initialise method

##### SetUrlViewModel class





talawa
1.0.0+1






