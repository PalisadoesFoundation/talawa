




CustomAlertDialogWithCheckbox constructor - CustomAlertDialogWithCheckbox - custom\_alert\_dialog\_with\_checkbox library - Dart API







menu

1. [talawa](../../index.html)
2. [widgets/custom\_alert\_dialog\_with\_checkbox.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_widgets_custom_alert_dialog_with_checkbox/)
3. [CustomAlertDialogWithCheckbox](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_widgets_custom_alert_dialog_with_checkbox/CustomAlertDialogWithCheckbox-class.html)
4. CustomAlertDialogWithCheckbox const constructor

CustomAlertDialogWithCheckbox


dark\_mode

light\_mode




# CustomAlertDialogWithCheckbox constructor


const
CustomAlertDialogWithCheckbox({

1. dynamic key,
2. [String](https://api.flutter.dev/flutter/dart-core/String-class.html) successText = 'Confirm',
3. [String](https://api.flutter.dev/flutter/dart-core/String-class.html) dialogTitle = 'Confirmation',
4. [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html) reverse = false,
5. [String](https://api.flutter.dev/flutter/dart-core/String-class.html) secondaryButtonText = 'Close',
6. dynamic secondaryButtonTap()?,
7. required dynamic success(
   1. [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)?),
8. required [String](https://api.flutter.dev/flutter/dart-core/String-class.html) dialogSubTitle,
9. required [String](https://api.flutter.dev/flutter/dart-core/String-class.html) checkboxLabel,
10. [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html) initialCheckboxValue = false,

})

## Implementation

```
const CustomAlertDialogWithCheckbox({
  super.key,
  this.successText = 'Confirm',
  this.dialogTitle = 'Confirmation',
  this.reverse = false,
  this.secondaryButtonText = 'Close',
  this.secondaryButtonTap,
  required this.success,
  required this.dialogSubTitle,
  required this.checkboxLabel,
  this.initialCheckboxValue = false,
});
```

 


1. [talawa](../../index.html)
2. [custom\_alert\_dialog\_with\_checkbox](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_widgets_custom_alert_dialog_with_checkbox/)
3. [CustomAlertDialogWithCheckbox](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_widgets_custom_alert_dialog_with_checkbox/CustomAlertDialogWithCheckbox-class.html)
4. CustomAlertDialogWithCheckbox const constructor

##### CustomAlertDialogWithCheckbox class





talawa
1.0.0+1






