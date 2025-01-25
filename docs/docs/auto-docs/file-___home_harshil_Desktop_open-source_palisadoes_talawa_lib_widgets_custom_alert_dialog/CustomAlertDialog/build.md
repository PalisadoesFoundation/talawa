




build method - CustomAlertDialog class - custom\_alert\_dialog library - Dart API







menu

1. [talawa](../../index.html)
2. [widgets/custom\_alert\_dialog.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_widgets_custom_alert_dialog/)
3. [CustomAlertDialog](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_widgets_custom_alert_dialog/CustomAlertDialog-class.html)
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
  final List<Widget> actions = [
    RaisedRoundedButton(
      key: Key(secondaryButtonText),
      onTap: () {
        secondaryButtonTap != null
            ? secondaryButtonTap!()
            : navigationService.pop();
      },
      buttonLabel:
          AppLocalizations.of(context)!.strictTranslate(secondaryButtonText),
      textColor: Colors.white,
      backgroundColor: const Color(0xFF008A37),
      width: SizeConfig.screenWidth! * 0.2,
      height: SizeConfig.screenHeight! * 0.06,
    ),
    RaisedRoundedButton(
      key: Key(successText),
      onTap: () => success(),
      buttonLabel: AppLocalizations.of(context)!.strictTranslate(successText),
      textColor: const Color(0xFF008A37),
      backgroundColor: Theme.of(context).colorScheme.tertiary,
      width: SizeConfig.screenWidth! * 0.2,
      height: SizeConfig.screenHeight! * 0.06,
    ),
  ];
  return AlertDialog(
    surfaceTintColor: Theme.of(context).colorScheme.secondaryContainer,
    title: Text(
      AppLocalizations.of(context)!.strictTranslate(dialogTitle),
      style: Theme.of(context)
          .textTheme
          .headlineSmall!
          .copyWith(fontWeight: FontWeight.w800),
    ),
    content: Text(
      AppLocalizations.of(context)!.strictTranslate(dialogSubTitle),
    ),
    buttonPadding: EdgeInsets.symmetric(
      horizontal: SizeConfig.screenWidth! * 0.05,
      vertical: SizeConfig.screenHeight! * 0.05,
    ),
    actions: reverse ? actions.reversed.toList() : actions,
  );
}
```

 


1. [talawa](../../index.html)
2. [custom\_alert\_dialog](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_widgets_custom_alert_dialog/)
3. [CustomAlertDialog](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_widgets_custom_alert_dialog/CustomAlertDialog-class.html)
4. build method

##### CustomAlertDialog class





talawa
1.0.0+1






