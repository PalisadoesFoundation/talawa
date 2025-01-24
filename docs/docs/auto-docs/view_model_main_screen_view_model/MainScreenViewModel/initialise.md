




initialise method - MainScreenViewModel class - main\_screen\_view\_model library - Dart API







menu

1. [talawa](../../index.html)
2. [view\_model/main\_screen\_view\_model.dart](../../view_model_main_screen_view_model/view_model_main_screen_view_model-library.html)
3. [MainScreenViewModel](../../view_model_main_screen_view_model/MainScreenViewModel-class.html)
4. initialise method

initialise


dark\_mode

light\_mode




# initialise method


void
initialise(

1. [BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.html) ctx, {
2. required bool fromSignUp,
3. required int mainScreenIndex,
4. bool demoMode = false,
5. bool testMode = false,

})

Initalizing function.

**params**:

* `ctx`: BuildContext, contain parent info
* `fromSignUp`: Bool to find user entry
* `mainScreenIndex`: Index to find tab on mainScreen
* `demoMode`: Whether the app is in demo mode
* `testMode`: Whether the app is in test mode

**returns**:
None


## Implementation

```
void initialise(
  BuildContext ctx, {
  required bool fromSignUp,
  required int mainScreenIndex,
  bool demoMode = false,
  bool testMode = false,
}) {
  this.testMode = testMode;
  MainScreenViewModel.demoMode = demoMode;
  currentPageIndex = mainScreenIndex;
  showAppTour = fromSignUp || demoMode;
  context = ctx;

  print(ctx);
  print(context);
  pluginPrototypeData = {
    "Donation": {
      "icon": Icons.attach_money_outlined,
      "page": const ChangeThemeTile(),
    },
  };

  notifyListeners();
  if (!showAppTour) {
    tourComplete = true;
    tourSkipped = false;
  } else {
    Future.delayed(
      const Duration(seconds: 1),
      () => navigationService.pushDialog(
        appTourDialog(ctx),
      ),
    );
  }
}
```

 


1. [talawa](../../index.html)
2. [main\_screen\_view\_model](../../view_model_main_screen_view_model/view_model_main_screen_view_model-library.html)
3. [MainScreenViewModel](../../view_model_main_screen_view_model/MainScreenViewModel-class.html)
4. initialise method

##### MainScreenViewModel class





talawa
1.0.0+1






