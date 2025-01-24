




appTourDialog method - MainScreenViewModel class - main\_screen\_view\_model library - Dart API







menu

1. [talawa](../../index.html)
2. [view\_model/main\_screen\_view\_model.dart](../../view_model_main_screen_view_model/view_model_main_screen_view_model-library.html)
3. [MainScreenViewModel](../../view_model_main_screen_view_model/MainScreenViewModel-class.html)
4. appTourDialog method

appTourDialog


dark\_mode

light\_mode




# appTourDialog method


[Widget](https://api.flutter.dev/flutter/widgets/Widget-class.html)
appTourDialog(

1. [BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.html) ctx

)

Builds and returns an AppTourDialog.

**params**:

* `ctx`: The build context to work with.

**returns**:

* `Widget`: The built [Dialog](https://api.flutter.dev/flutter/material/Dialog-class.html)

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
2. [main\_screen\_view\_model](../../view_model_main_screen_view_model/view_model_main_screen_view_model-library.html)
3. [MainScreenViewModel](../../view_model_main_screen_view_model/MainScreenViewModel-class.html)
4. appTourDialog method

##### MainScreenViewModel class





talawa
1.0.0+1






