




exitAlertDialog method - CustomDrawerViewModel class - custom\_drawer\_view\_model library - Dart API







menu

1. [talawa](../../index.html)
2. [view\_model/widgets\_view\_models/custom\_drawer\_view\_model.dart](../../view_model_widgets_view_models_custom_drawer_view_model/view_model_widgets_view_models_custom_drawer_view_model-library.html)
3. [CustomDrawerViewModel](../../view_model_widgets_view_models_custom_drawer_view_model/CustomDrawerViewModel-class.html)
4. exitAlertDialog method

exitAlertDialog


dark\_mode

light\_mode




# exitAlertDialog method


[CustomAlertDialog](../../widgets_custom_alert_dialog/CustomAlertDialog-class.html)
exitAlertDialog()

returns an exit alert dialog.

**params**:
None

**returns**:

* `CustomAlertDialog`: returns customAlertDialogBox.

## Implementation

```
CustomAlertDialog exitAlertDialog() {
  return CustomAlertDialog(
    key: const Key("Exit?"),
    reverse: true,
    dialogSubTitle: 'Are you sure you want to exit this organization?',
    successText: 'Exit',
    success: () {},
  );
}
```

 


1. [talawa](../../index.html)
2. [custom\_drawer\_view\_model](../../view_model_widgets_view_models_custom_drawer_view_model/view_model_widgets_view_models_custom_drawer_view_model-library.html)
3. [CustomDrawerViewModel](../../view_model_widgets_view_models_custom_drawer_view_model/CustomDrawerViewModel-class.html)
4. exitAlertDialog method

##### CustomDrawerViewModel class





talawa
1.0.0+1






