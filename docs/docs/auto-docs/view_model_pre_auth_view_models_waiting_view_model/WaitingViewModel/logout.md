
<div>

# logout method

</div>


void 



This function ends the session for the user or logout the user from the
application.



## Implementation

``` language-dart
void  {
  final user = Hive.box<User>('currentUser');
  final url = Hive.box('url');
  user.;
  url.;
  navigationService.removeAllAndPush(
    Routes.languageSelectionRoute,
    Routes.splashScreen,
    arguments: '0',
  );
}
```







1.  [talawa](../../index.md)
2.  [waiting_view_model](../../view_model_pre_auth_view_models_waiting_view_model/)
3.  [WaitingViewModel](../../view_model_pre_auth_view_models_waiting_view_model/WaitingViewModel-class.md)
4.  logout method

##### WaitingViewModel class







