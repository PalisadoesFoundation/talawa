::::::: {#dartdoc-main-content .main-content above-sidebar="services_third_party_service_multi_media_pick_service/MultiMediaPickerService-class-sidebar.html" below-sidebar=""}
<div>

# [permissionDeniedDialog]{.kind-method} method

</div>

::: {.section .multi-line-signature}
[[CustomAlertDialog](../../widgets_custom_alert_dialog/CustomAlertDialog-class.html)]{.returntype}
[permissionDeniedDialog]{.name}()
:::

::: {.section .desc .markdown}
Generates a custom alert dialog for permission denial.

When called, it creates and returns a `CustomAlertDialog` widget with
pre-defined settings. This dialog prompts the user to grant camera
permissions from the app settings.

**params**: None

**returns**:

-   `CustomAlertDialog`: Custom Alert Dialog widget.
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
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
:::
:::::::

::::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../../index.html)
2.  [multi_media_pick_service](../../services_third_party_service_multi_media_pick_service/)
3.  [MultiMediaPickerService](../../services_third_party_service_multi_media_pick_service/MultiMediaPickerService-class.html)
4.  permissionDeniedDialog method

##### MultiMediaPickerService class

::: {#dartdoc-sidebar-left-content}
:::
:::::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
