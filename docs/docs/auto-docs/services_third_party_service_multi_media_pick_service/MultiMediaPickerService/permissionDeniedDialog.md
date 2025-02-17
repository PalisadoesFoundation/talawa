
<div>

# permissionDeniedDialog method

</div>


[[CustomAlertDialog](../../widgets_custom_alert_dialog/CustomAlertDialog-class.html)]




Generates a custom alert dialog for permission denial.

When called, it creates and returns a `CustomAlertDialog` widget with
pre-defined settings. This dialog prompts the user to grant camera
permissions from the app settings.

**params**: None

**returns**:

-   `CustomAlertDialog`: Custom Alert Dialog widget.



## Implementation

``` language-dart
CustomAlertDialog  {
  return CustomAlertDialog(
    success: () {
      locator<NavigationService>().;
      ;
    },
    dialogTitle: 'Permission Denied',
    successText: 'SETTINGS',
    dialogSubTitle:
        "Camera permission is required, to use this feature, give permission from app settings",
  );
}
```







1.  [talawa](../../index.html)
2.  [multi_media_pick_service](../../services_third_party_service_multi_media_pick_service/)
3.  [MultiMediaPickerService](../../services_third_party_service_multi_media_pick_service/MultiMediaPickerService-class.html)
4.  permissionDeniedDialog method

##### MultiMediaPickerService class







