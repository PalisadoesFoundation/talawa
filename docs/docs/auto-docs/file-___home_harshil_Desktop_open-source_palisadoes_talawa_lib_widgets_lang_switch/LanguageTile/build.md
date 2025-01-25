




build method - LanguageTile class - lang\_switch library - Dart API







menu

1. [talawa](../../index.html)
2. [widgets/lang\_switch.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_widgets_lang_switch/)
3. [LanguageTile](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_widgets_lang_switch/LanguageTile-class.html)
4. build method

build


dark\_mode

light\_mode




# build method


1. @[override](https://api.flutter.dev/flutter/dart-core/override-constant.html)

dynamic
build(

1. dynamic context

)

## Implementation

```
@override
Widget build(BuildContext context) {
  //AppLanguage enables to set up localized values for each locale that our app supports.
  //A locale is an identifier used to select a user's language and formatting preferences.
  //This represents a Unicode Language Identifier (i.e. without Locale extensions),
  //except variants are not supported.
  return Consumer<AppLanguage>(
    builder: (context, appLang, _) {
      final Language userLanguage = languages.firstWhere(
        (element) => element.langCode == appLang.appLocal.languageCode,
      );
      return ListTile(
        key: const Key('LanguageTile'),
        contentPadding: EdgeInsets.symmetric(
          horizontal: SizeConfig.blockSizeHorizontal!,
        ),
        title:
            Text(AppLocalizations.of(context)!.strictTranslate("Language")),
        trailing: TextButton(
          key: const Key('LanguageSelector'),
          onPressed: () {
            navigationService.pushReplacementScreen(
              '/selectLang',
              arguments: '0',
            );
          },
          child: Text(userLanguage.langName),
        ),
      );
    },
  );
}
```

 


1. [talawa](../../index.html)
2. [lang\_switch](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_widgets_lang_switch/)
3. [LanguageTile](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_widgets_lang_switch/LanguageTile-class.html)
4. build method

##### LanguageTile class





talawa
1.0.0+1






