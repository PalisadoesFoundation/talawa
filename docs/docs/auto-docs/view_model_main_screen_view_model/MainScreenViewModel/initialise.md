
<div>

# initialise method

</div>


void initialise(

1.  [[[BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.md)]
    ctx, {]
2.  [required
    [[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]
    fromSignUp, ]
3.  [required
    [[int](https://api.flutter.dev/flutter/dart-core/int-class.html)]
    mainScreenIndex,
    ]
4.  [[[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]
    demoMode = false,
    ]
5.  [[[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]
    testMode = false,
    ]

})



Initalizing function.

**params**:

-   `ctx`: BuildContext, contain parent info
-   `fromSignUp`: Bool to find user entry
-   `mainScreenIndex`: Index to find tab on mainScreen
-   `demoMode`: Whether the app is in demo mode
-   `testMode`: Whether the app is in test mode

**returns**: None



## Implementation

``` language-dart
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
  final appTourDialogWidget = appTourDialog(ctx);
  print(ctx);
  print(context);
  pluginPrototypeData = {
    "Donation": {
      "icon": Icons.attach_money_outlined,
      "page": const ,
    },
  };

  ;
  if (!showAppTour) {
    tourComplete = true;
    tourSkipped = false;
  } else {
    Future.delayed(
      const Duration(seconds: 1),
      () => navigationService.pushDialog(
        appTourDialogWidget,
      ),
    );
  }
}
```







1.  [talawa](../../index.md)
2.  [main_screen_view_model](../../view_model_main_screen_view_model/)
3.  [MainScreenViewModel](../../view_model_main_screen_view_model/MainScreenViewModel-class.md)
4.  initialise method

##### MainScreenViewModel class







