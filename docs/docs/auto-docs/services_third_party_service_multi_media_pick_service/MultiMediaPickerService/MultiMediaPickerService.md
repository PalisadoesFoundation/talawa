::: {#overlay-under-drawer}
:::

::: {#title}
[menu]{#sidenav-left-toggle .material-symbols-outlined role="button"
tabindex="0"}

1.  [talawa](../../index.html)
2.  [services/third_party_service/multi_media_pick_service.dart](../../services_third_party_service_multi_media_pick_service/)
3.  [MultiMediaPickerService](../../services_third_party_service_multi_media_pick_service/MultiMediaPickerService-class.html)
4.  MultiMediaPickerService constructor

::: self-name
MultiMediaPickerService
:::

::: {#theme-button .toggle title="Toggle brightness"}
[ dark_mode ]{#dark-theme-button .material-symbols-outlined} [
light_mode ]{#light-theme-button .material-symbols-outlined}
:::
:::

::: {role="main"}
::: {#dartdoc-main-content .main-content above-sidebar="services_third_party_service_multi_media_pick_service/MultiMediaPickerService-class-sidebar.html" below-sidebar=""}
<div>

# [MultiMediaPickerService]{.kind-constructor} constructor

</div>

::: {.section .multi-line-signature}
[MultiMediaPickerService]{.name}()
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
MultiMediaPickerService() {
  _picker = locator<ImagePicker>();
  _fileStream = _fileStreamController.stream.asBroadcastStream();
  _imageService = imageService;
}
```
:::
:::

::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../../index.html)
2.  [multi_media_pick_service](../../services_third_party_service_multi_media_pick_service/)
3.  [MultiMediaPickerService](../../services_third_party_service_multi_media_pick_service/MultiMediaPickerService-class.html)
4.  MultiMediaPickerService constructor

##### MultiMediaPickerService class

::: {#dartdoc-sidebar-left-content}
:::
:::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
:::

[ talawa 1.0.0+1 ]{.no-break}
