




permissionDeniedDialog method - MultiMediaPickerService class - multi\_media\_pick\_service library - Dart API







menu

1. [talawa](../../index.html)
2. [services/third\_party\_service/multi\_media\_pick\_service.dart](../../services_third_party_service_multi_media_pick_service/services_third_party_service_multi_media_pick_service-library.html)
3. [MultiMediaPickerService](../../services_third_party_service_multi_media_pick_service/MultiMediaPickerService-class.html)
4. permissionDeniedDialog method

permissionDeniedDialog


dark\_mode

light\_mode




# permissionDeniedDialog method


[CustomAlertDialog](../../widgets_custom_alert_dialog/CustomAlertDialog-class.html)
permissionDeniedDialog()

Generates a custom alert dialog for permission denial.

When called, it creates and returns a `CustomAlertDialog` widget with pre-defined settings.
This dialog prompts the user to grant camera permissions from the app settings.

**params**:
None

**returns**:

* `CustomAlertDialog`: Custom Alert Dialog widget.

## Implementation

```
CustomAlertDialog permissionDeniedDialog() {
  return CustomAlertDialog(
    success: () {
      locator<NavigationService>().pop();
      openAppSettings();
    },
    dialogTitle: 'Permission Denied',
    successText: 'SETTINGS',
    dialogSubTitle:
        "Camera permission is required, to use this feature, give permission from app settings",
  );
}
```

 


1. [talawa](../../index.html)
2. [multi\_media\_pick\_service](../../services_third_party_service_multi_media_pick_service/services_third_party_service_multi_media_pick_service-library.html)
3. [MultiMediaPickerService](../../services_third_party_service_multi_media_pick_service/MultiMediaPickerService-class.html)
4. permissionDeniedDialog method

##### MultiMediaPickerService class





talawa
1.0.0+1






