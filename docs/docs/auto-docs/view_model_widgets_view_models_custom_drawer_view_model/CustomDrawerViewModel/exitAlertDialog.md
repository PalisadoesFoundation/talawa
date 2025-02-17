
<div>

# exitAlertDialog method

</div>


[[CustomAlertDialog](../../widgets_custom_alert_dialog/CustomAlertDialog-class.md)]




returns an exit alert dialog.

**params**: None

**returns**:

-   `CustomAlertDialog`: returns customAlertDialogBox.



## Implementation

``` language-dart
CustomAlertDialog  {
  return CustomAlertDialog(
    key: const Key("Exit?"),
    reverse: true,
    dialogSubTitle: 'Are you sure you want to exit this organization?',
    successText: 'Exit',
    success: () {},
  );
}
```







1.  [talawa](../../index.md)
2.  [custom_drawer_view_model](../../view_model_widgets_view_models_custom_drawer_view_model/)
3.  [CustomDrawerViewModel](../../view_model_widgets_view_models_custom_drawer_view_model/CustomDrawerViewModel-class.md)
4.  exitAlertDialog method

##### CustomDrawerViewModel class







