::::::: {#dartdoc-main-content .main-content above-sidebar="widgets_date_time_picker/widgets_date_time_picker-library-sidebar.html" below-sidebar=""}
<div>

# [customTimePicker]{.kind-function} function

</div>

::: {.section .multi-line-signature}
[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[TimeOfDay](https://api.flutter.dev/flutter/material/TimeOfDay-class.html)]{.type-parameter}\>]{.signature}]{.returntype}
[customTimePicker]{.name}({

1.  [required
    [[TimeOfDay](https://api.flutter.dev/flutter/material/TimeOfDay-class.html)]{.type-annotation}
    [initialTime]{.parameter-name},
    ]{#customTimePicker-param-initialTime .parameter}

})
:::

::: {.section .desc .markdown}
Shows a dialog containing a material design time picker.

The returned Future resolves to the time selected by the user when the
user closes the dialog. If the user cancels the dialog, null is
returned.
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
Future<TimeOfDay> customTimePicker({required TimeOfDay initialTime}) async {
  // showTimePicker which shows a material design time range picker used to select a range of times.
  // Click ![here](https://api.flutter.dev/flutter/material/showTimePicker.html) to know more.
  final TimeOfDay? pickedTime = await showTimePicker(
    context: navigationService.navigatorKey.currentContext!,
    initialTime: initialTime,
  );

  if (pickedTime != null && pickedTime != initialTime) {
    return pickedTime;
  }
  return initialTime;
}
```
:::
:::::::

::::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../index.html)
2.  [date_time_picker](../widgets_date_time_picker/)
3.  customTimePicker function

##### date_time_picker library

::: {#dartdoc-sidebar-left-content}
:::
:::::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
