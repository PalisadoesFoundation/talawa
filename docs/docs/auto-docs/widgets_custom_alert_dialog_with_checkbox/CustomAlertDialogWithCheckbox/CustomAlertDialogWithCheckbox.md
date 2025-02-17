
<div>

# CustomAlertDialogWithCheckbox constructor

</div>


const CustomAlertDialogWithCheckbox({

1.  [[[Key](https://api.flutter.dev/flutter/foundation/Key-class.html)?]
    key, ]
2.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]
    successText = \'Confirm\',
    ]
3.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]
    dialogTitle = \'Confirmation\',
    ]
4.  [[[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]
    reverse = false,
    ]
5.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]
    secondaryButtonText =
    \'Close\', ]
6.  [dynamic
    ?,
    ]
7.  required [dynamic
    success(]
    1.  [[[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)?]]

    ),
8.  [required
    [[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]
    dialogSubTitle, ]
9.  [required
    [[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]
    checkboxLabel, ]
10. [[[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]
    initialCheckboxValue = false,
    ]

})



## Implementation

``` language-dart
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







1.  [talawa](../../index.html)
2.  [custom_alert_dialog_with_checkbox](../../widgets_custom_alert_dialog_with_checkbox/)
3.  [CustomAlertDialogWithCheckbox](../../widgets_custom_alert_dialog_with_checkbox/CustomAlertDialogWithCheckbox-class.html)
4.  CustomAlertDialogWithCheckbox const constructor

##### CustomAlertDialogWithCheckbox class







