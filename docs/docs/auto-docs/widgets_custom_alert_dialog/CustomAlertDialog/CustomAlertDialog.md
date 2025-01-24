




CustomAlertDialog constructor - CustomAlertDialog - custom\_alert\_dialog library - Dart API







menu

1. [talawa](../../index.html)
2. [widgets/custom\_alert\_dialog.dart](../../widgets_custom_alert_dialog/widgets_custom_alert_dialog-library.html)
3. [CustomAlertDialog](../../widgets_custom_alert_dialog/CustomAlertDialog-class.html)
4. CustomAlertDialog const constructor

CustomAlertDialog


dark\_mode

light\_mode




# CustomAlertDialog constructor


const
CustomAlertDialog({

1. [Key](https://api.flutter.dev/flutter/foundation/Key-class.html)? key,
2. String successText = 'Confirm',
3. String dialogTitle = 'Confirmation',
4. bool reverse = false,
5. String secondaryButtonText = 'Close',
6. dynamic secondaryButtonTap()?,
7. required dynamic success(),
8. required String dialogSubTitle,

})

Constructs a [CustomAlertDialog](../../widgets_custom_alert_dialog/CustomAlertDialog-class.html) widget.

`reverse` indicates whether the order of action buttons should be reversed.
`success` is the function triggered upon tapping the primary action button.
`secondaryButtonTap` is the function triggered upon tapping the secondary action button.
`successText` is the text displayed on the primary action button.
`dialogTitle` is the title displayed in the dialog (default value is 'Confirmation').
`dialogSubTitle` is the subtitle or message content of the dialog.
`secondaryButtonText` is the text displayed on the secondary action button (default value is 'Close').


## Implementation

```
const CustomAlertDialog({
  super.key,
  this.successText = 'Confirm',
  this.dialogTitle = 'Confirmation',
  this.reverse = false,
  this.secondaryButtonText = 'Close',
  this.secondaryButtonTap,
  required this.success,
  required this.dialogSubTitle,
});
```

 


1. [talawa](../../index.html)
2. [custom\_alert\_dialog](../../widgets_custom_alert_dialog/widgets_custom_alert_dialog-library.html)
3. [CustomAlertDialog](../../widgets_custom_alert_dialog/CustomAlertDialog-class.html)
4. CustomAlertDialog const constructor

##### CustomAlertDialog class





talawa
1.0.0+1






