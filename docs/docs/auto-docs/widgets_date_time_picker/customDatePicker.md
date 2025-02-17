::::::: {#dartdoc-main-content .main-content above-sidebar="widgets_date_time_picker/widgets_date_time_picker-library-sidebar.html" below-sidebar=""}
<div>

# [customDatePicker]{.kind-function} function

</div>

::: {.section .multi-line-signature}
[[Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[DateTime](https://api.flutter.dev/flutter/dart-core/DateTime-class.html)]{.type-parameter}\>]{.signature}]{.returntype}
[customDatePicker]{.name}({

1.  [required
    [[DateTime](https://api.flutter.dev/flutter/dart-core/DateTime-class.html)]{.type-annotation}
    [initialDate]{.parameter-name},
    ]{#customDatePicker-param-initialDate .parameter}

})
:::

::: {.section .desc .markdown}
Shows a dialog containing a Material Design date picker.

The returned Future resolves to the date selected by the user when the
user confirms the dialog. If the user cancels the dialog, null is
returned.
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
Future<DateTime> customDatePicker({required DateTime initialDate}) async {
  // showDatePicker which shows a material design date range picker used to select a range of dates.
  final DateTime? picked = await showDatePicker(
    context: navigationService.navigatorKey.currentContext!,
    initialDate: initialDate,
    firstDate: DateTime(2015, 8),
    lastDate: DateTime(2101),
  );
  if (picked != null && picked != initialDate) {
    return picked;
  }
  return initialDate;
}
```
:::
:::::::

::::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../index.html)
2.  [date_time_picker](../widgets_date_time_picker/)
3.  customDatePicker function

##### date_time_picker library

::: {#dartdoc-sidebar-left-content}
:::
:::::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
