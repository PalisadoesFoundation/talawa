
<div>

# appTourDialog method

</div>


[[Widget](https://api.flutter.dev/flutter/widgets/Widget-class.html)]
appTourDialog(

1.  [[[BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.md)]
    ctx]

)



Builds and returns an AppTourDialog.

**params**:

-   `ctx`: The build context to work with.

**returns**:

-   `Widget`: The built
    [Dialog](https://api.flutter.dev/flutter/material/Dialog-class.html)



## Implementation

``` language-dart
Widget appTourDialog(BuildContext ctx) {
  return CustomAlertDialog(
    dialogTitle: 'App Tour',
    dialogSubTitle: 'Start app tour to know talawa functioning',
    successText: 'Start',
    secondaryButtonText: 'Skip',
    success: () {
      navigationService.;
      print(MainScreenViewModel.scaffoldKey.currentState?.isDrawerOpen);
      if (MainScreenViewModel.scaffoldKey.currentState?.isDrawerOpen ??
          false) {
        MainScreenViewModel.scaffoldKey.currentState?.;
      }
      ;
    },
    secondaryButtonTap: () {
      tourComplete = false;
      tourSkipped = true;
      navigationService.;
      ;
    },
  );
}
```







1.  [talawa](../../index.md)
2.  [main_screen_view_model](../../view_model_main_screen_view_model/)
3.  [MainScreenViewModel](../../view_model_main_screen_view_model/MainScreenViewModel-class.md)
4.  appTourDialog method

##### MainScreenViewModel class







