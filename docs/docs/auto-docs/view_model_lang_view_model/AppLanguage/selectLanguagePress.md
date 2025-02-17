
<div>

# selectLanguagePress method

</div>


[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)\<[void\>]]




Navigates the user after choosing lthe anguage.

This function navigate user to `/appSettingsPage` route if the user is
authenticated else navigate to `demoMode - /MainScreenPage` route.

**params**: None

**returns**: None



## Implementation

``` language-dart
Future<void>  async {
  if (userConfig.currentUser.id != 'null') {
    ;
    navigationService.popAndPushScreen('/appSettingsPage', arguments: '');
  } else {
    navigationService.pushScreen(
      Routes.mainScreen,
      arguments: MainScreenArgs(
        mainScreenIndex: 0,
        fromSignUp: false,
        toggleDemoMode: true,
      ),
    );
  }
}
```







1.  [talawa](../../index.html)
2.  [lang_view_model](../../view_model_lang_view_model/)
3.  [AppLanguage](../../view_model_lang_view_model/AppLanguage-class.html)
4.  selectLanguagePress method

##### AppLanguage class







