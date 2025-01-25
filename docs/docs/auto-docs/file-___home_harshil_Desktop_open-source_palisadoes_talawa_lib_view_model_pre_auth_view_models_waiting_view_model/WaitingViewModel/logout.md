




logout method - WaitingViewModel class - waiting\_view\_model library - Dart API







menu

1. [talawa](../../index.html)
2. [view\_model/pre\_auth\_view\_models/waiting\_view\_model.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_pre_auth_view_models_waiting_view_model/)
3. [WaitingViewModel](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_pre_auth_view_models_waiting_view_model/WaitingViewModel-class.html)
4. logout method

logout


dark\_mode

light\_mode




# logout method


void
logout()

This function ends the session for the user or logout the user from the application.


## Implementation

```
void logout() {
  final user = Hive.box<User>('currentUser');
  final url = Hive.box('url');
  user.clear();
  url.clear();
  navigationService.removeAllAndPush(
    Routes.languageSelectionRoute,
    Routes.splashScreen,
    arguments: '0',
  );
}
```

 


1. [talawa](../../index.html)
2. [waiting\_view\_model](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_pre_auth_view_models_waiting_view_model/)
3. [WaitingViewModel](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_pre_auth_view_models_waiting_view_model/WaitingViewModel-class.html)
4. logout method

##### WaitingViewModel class





talawa
1.0.0+1






