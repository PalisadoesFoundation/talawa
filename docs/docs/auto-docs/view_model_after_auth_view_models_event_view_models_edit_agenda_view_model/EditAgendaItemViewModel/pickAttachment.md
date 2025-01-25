::: {#overlay-under-drawer}
:::

::: {#title}
[menu]{#sidenav-left-toggle .material-symbols-outlined role="button"
tabindex="0"}

1.  [talawa](../../index.html)
2.  [view_model/after_auth_view_models/event_view_models/edit_agenda_view_model.dart](../../view_model_after_auth_view_models_event_view_models_edit_agenda_view_model/)
3.  [EditAgendaItemViewModel](../../view_model_after_auth_view_models_event_view_models_edit_agenda_view_model/EditAgendaItemViewModel-class.html)
4.  pickAttachment method

::: self-name
pickAttachment
:::

::: {#theme-button .toggle title="Toggle brightness"}
[ dark_mode ]{#dark-theme-button .material-symbols-outlined} [
light_mode ]{#light-theme-button .material-symbols-outlined}
:::
:::

::: {role="main"}
::: {#dartdoc-main-content .main-content above-sidebar="view_model_after_auth_view_models_event_view_models_edit_agenda_view_model/EditAgendaItemViewModel-class-sidebar.html" below-sidebar=""}
<div>

# [pickAttachment]{.kind-method} method

</div>

::: {.section .multi-line-signature}
[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[void]{.type-parameter}\>]{.signature}]{.returntype}
[pickAttachment]{.name}({

1.  [[[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]{.type-annotation}
    [fromCamera]{.parameter-name} = [false]{.default-value},
    ]{#pickAttachment-param-fromCamera .parameter}

})
:::

::: {.section .desc .markdown}
Picks an attachment for the agenda item from the gallery or camera.

**params**:

-   `fromCamera`: If `true`, opens the camera to pick an image,
    otherwise opens the gallery.

**returns**: None
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
Future<void> pickAttachment({bool fromCamera = false}) async {
  final File? pickedFile =
      await _multiMediaPickerService.getPhotoFromGallery(camera: fromCamera);
  if (pickedFile != null) {
    final base64PickedFile = await imageService.convertToBase64(pickedFile);
    _currentAttachments.add(base64PickedFile);
    notifyListeners();
  }
}
```
:::
:::

::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../../index.html)
2.  [edit_agenda_view_model](../../view_model_after_auth_view_models_event_view_models_edit_agenda_view_model/)
3.  [EditAgendaItemViewModel](../../view_model_after_auth_view_models_event_view_models_edit_agenda_view_model/EditAgendaItemViewModel-class.html)
4.  pickAttachment method

##### EditAgendaItemViewModel class

::: {#dartdoc-sidebar-left-content}
:::
:::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
:::

[ talawa 1.0.0+1 ]{.no-break}
