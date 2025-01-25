




initialize method - LoginViewModel class - login\_view\_model library - Dart API







menu

1. [talawa](../../index.html)
2. [view\_model/pre\_auth\_view\_models/login\_view\_model.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_pre_auth_view_models_login_view_model/)
3. [LoginViewModel](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_pre_auth_view_models_login_view_model/LoginViewModel-class.html)
4. initialize method

initialize


dark\_mode

light\_mode




# initialize method


void
initialize()

Initializes the greeting message.

**params**:
None

**returns**:
None


## Implementation

```
void initialize() {
  greeting = [
    {
      'text': "We're ",
      'textStyle': Theme.of(navigationService.navigatorKey.currentContext!)
          .textTheme
          .headlineSmall,
    },
    {
      'text': 'Glad ',
      'textStyle': Theme.of(navigationService.navigatorKey.currentContext!)
          .textTheme
          .titleLarge!
          .copyWith(fontSize: 24),
    },
    {
      'text': "you're ",
      'textStyle': Theme.of(navigationService.navigatorKey.currentContext!)
          .textTheme
          .headlineSmall,
    },
    {
      'text': 'Back ',
      'textStyle': Theme.of(navigationService.navigatorKey.currentContext!)
          .textTheme
          .titleLarge!
          .copyWith(fontSize: 24),
    },
  ];
}
```

 


1. [talawa](../../index.html)
2. [login\_view\_model](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_pre_auth_view_models_login_view_model/)
3. [LoginViewModel](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_pre_auth_view_models_login_view_model/LoginViewModel-class.html)
4. initialize method

##### LoginViewModel class





talawa
1.0.0+1






