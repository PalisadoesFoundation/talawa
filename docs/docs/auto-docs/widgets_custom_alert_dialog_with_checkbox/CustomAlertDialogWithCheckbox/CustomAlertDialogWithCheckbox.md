




CustomAlertDialogWithCheckbox constructor - CustomAlertDialogWithCheckbox - custom\_alert\_dialog\_with\_checkbox library - Dart API







menu

1. [talawa](../../index.html)
2. [widgets/custom\_alert\_dialog\_with\_checkbox.dart](../../widgets_custom_alert_dialog_with_checkbox/widgets_custom_alert_dialog_with_checkbox-library.html)
3. [CustomAlertDialogWithCheckbox](../../widgets_custom_alert_dialog_with_checkbox/CustomAlertDialogWithCheckbox-class.html)
4. CustomAlertDialogWithCheckbox const constructor

CustomAlertDialogWithCheckbox


dark\_mode

light\_mode




# CustomAlertDialogWithCheckbox constructor


const
CustomAlertDialogWithCheckbox({

1. [Key](https://api.flutter.dev/flutter/foundation/Key-class.html)? key,
2. String successText = 'Confirm',
3. String dialogTitle = 'Confirmation',
4. bool reverse = false,
5. String secondaryButtonText = 'Close',
6. dynamic secondaryButtonTap()?,
7. required dynamic success(
   1. bool?),
8. required String dialogSubTitle,
9. required String checkboxLabel,
10. bool initialCheckboxValue = false,

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
2. [custom\_alert\_dialog\_with\_checkbox](../../widgets_custom_alert_dialog_with_checkbox/widgets_custom_alert_dialog_with_checkbox-library.html)
3. [CustomAlertDialogWithCheckbox](../../widgets_custom_alert_dialog_with_checkbox/CustomAlertDialogWithCheckbox-class.html)
4. CustomAlertDialogWithCheckbox const constructor

##### CustomAlertDialogWithCheckbox class





talawa
1.0.0+1






