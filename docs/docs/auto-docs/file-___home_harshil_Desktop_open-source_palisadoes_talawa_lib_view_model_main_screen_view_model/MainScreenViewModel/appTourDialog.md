




appTourDialog method - MainScreenViewModel class - main\_screen\_view\_model library - Dart API







menu

1. [talawa](../../index.html)
2. [view\_model/main\_screen\_view\_model.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_main_screen_view_model/)
3. [MainScreenViewModel](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_main_screen_view_model/MainScreenViewModel-class.html)
4. appTourDialog method

appTourDialog


dark\_mode

light\_mode




# appTourDialog method


dynamic
appTourDialog(

1. dynamic ctx

)

Builds and returns an AppTourDialog.

**params**:

* `ctx`: The build context to work with.

**returns**:

* `Widget`: The built `Dialog`

## Implementation

```
Widget appTourDialog(BuildContext ctx) {
  return CustomAlertDialog(
    dialogTitle: 'App Tour',
    dialogSubTitle: 'Start app tour to know talawa functioning',
    successText: 'Start',
    secondaryButtonText: 'Skip',
    success: () {
      navigationService.pop();
      print(MainScreenViewModel.scaffoldKey.currentState?.isDrawerOpen);
      if (MainScreenViewModel.scaffoldKey.currentState?.isDrawerOpen ??
          false) {
        MainScreenViewModel.scaffoldKey.currentState?.closeDrawer();
      }
      tourHomeTargets();
    },
    secondaryButtonTap: () {
      tourComplete = false;
      tourSkipped = true;
      navigationService.pop();
      notifyListeners();
    },
  );
}
```

 


1. [talawa](../../index.html)
2. [main\_screen\_view\_model](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_main_screen_view_model/)
3. [MainScreenViewModel](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_view_model_main_screen_view_model/MainScreenViewModel-class.html)
4. appTourDialog method

##### MainScreenViewModel class





talawa
1.0.0+1






