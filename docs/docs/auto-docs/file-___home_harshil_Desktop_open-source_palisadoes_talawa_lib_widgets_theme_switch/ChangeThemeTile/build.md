




build method - ChangeThemeTile class - theme\_switch library - Dart API







menu

1. [talawa](../../index.html)
2. [widgets/theme\_switch.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_widgets_theme_switch/)
3. [ChangeThemeTile](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_widgets_theme_switch/ChangeThemeTile-class.html)
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
  final themeProvider = Provider.of<AppTheme>(context);
  return ListTile(
    key: const Key('ThemeSwitch'),
    contentPadding: EdgeInsets.symmetric(
      horizontal: SizeConfig.blockSizeHorizontal!,
    ),
    title: Text(AppLocalizations.of(context)!.strictTranslate("Dark Theme")),
    trailing: Switch(
      key: const Key('ToggleTheme'),
      autofocus: true,
      activeColor: Theme.of(context).colorScheme.primary,
      value: themeProvider.isdarkTheme,
      onChanged: (value) {
        final provider = Provider.of<AppTheme>(context, listen: false);
        provider.switchTheme(isOn: value);
      },
    ),
  );
}
```

 


1. [talawa](../../index.html)
2. [theme\_switch](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_widgets_theme_switch/)
3. [ChangeThemeTile](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_widgets_theme_switch/ChangeThemeTile-class.html)
4. build method

##### ChangeThemeTile class





talawa
1.0.0+1






