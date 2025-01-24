




selectLanguagePress method - AppLanguage class - lang\_view\_model library - Dart API







menu

1. [talawa](../../index.html)
2. [view\_model/lang\_view\_model.dart](../../view_model_lang_view_model/view_model_lang_view_model-library.html)
3. [AppLanguage](../../view_model_lang_view_model/AppLanguage-class.html)
4. selectLanguagePress method

selectLanguagePress


dark\_mode

light\_mode




# selectLanguagePress method


Future<void>
selectLanguagePress()

Navigates the user after choosing lthe anguage.

This function navigate user to `/appSettingsPage` route if the user
is authenticated else navigate to `demoMode - /MainScreenPage` route.

**params**:
None

**returns**:
None


## Implementation

```
Future<void> selectLanguagePress() async {
  if (userConfig.currentUser.id != 'null') {
    dbLanguageUpdate();
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

 


1. [talawa](../../index.html)
2. [lang\_view\_model](../../view_model_lang_view_model/view_model_lang_view_model-library.html)
3. [AppLanguage](../../view_model_lang_view_model/AppLanguage-class.html)
4. selectLanguagePress method

##### AppLanguage class





talawa
1.0.0+1






