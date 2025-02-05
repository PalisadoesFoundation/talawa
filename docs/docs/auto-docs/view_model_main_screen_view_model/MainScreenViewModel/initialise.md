


# initialise method








void initialise
([BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.html) ctx, {required [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html) fromSignUp, required [int](https://api.flutter.dev/flutter/dart-core/int-class.html) mainScreenIndex})





<p>Initalizing function.</p>
<p><strong>params</strong>:</p>
<ul>
<li><code>ctx</code>: BuildContext, contain parent info</li>
<li><code>fromSignUp</code>: Bool to find user entry</li>
<li><code>mainScreenIndex</code>: Index to find tab on mainScreen</li>
</ul>
<p><strong>returns</strong>:
  None</p>



## Implementation

```dart
void initialise(
  BuildContext ctx, {
  required bool fromSignUp,
  required int mainScreenIndex,
}) {
  currentPageIndex = mainScreenIndex;
  showAppTour = fromSignUp;

  pluginPrototypeData = {
    "Donation": {
      "icon": Icons.attach_money_outlined,
      "page": const ChangeThemeTile(),
    }
  };

  notifyListeners();
  if (!showAppTour) {
    tourComplete = true;
    tourSkipped = false;
  } else {
    Future.delayed(
      const Duration(seconds: 1),
      () => navigationService.pushDialog(
        CustomAlertDialog(
          dialogTitle: 'App Tour',
          dialogSubTitle: 'Start app tour to know talawa functioning',
          successText: 'Start',
          secondaryButtonText: 'Skip',
          success: () {
            context = ctx;
            navigationService.pop();
            tourHomeTargets();
          },
          secondaryButtonTap: () {
            tourComplete = false;
            tourSkipped = true;
            notifyListeners();
          },
        ),
      ),
    );
  }
}
```







