::::::: {#dartdoc-main-content .main-content above-sidebar="widgets_custom_alert_dialog/CustomAlertDialog-class-sidebar.html" below-sidebar=""}
<div>

# [CustomAlertDialog]{.kind-constructor} constructor

</div>

::: {.section .multi-line-signature}
const [CustomAlertDialog]{.name}({

1.  [[[Key](https://api.flutter.dev/flutter/foundation/Key-class.html)?]{.type-annotation}
    [key]{.parameter-name}, ]{#-param-key .parameter}
2.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-annotation}
    [successText]{.parameter-name} = [\'Confirm\']{.default-value},
    ]{#-param-successText .parameter}
3.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-annotation}
    [dialogTitle]{.parameter-name} = [\'Confirmation\']{.default-value},
    ]{#-param-dialogTitle .parameter}
4.  [[[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]{.type-annotation}
    [reverse]{.parameter-name} = [false]{.default-value},
    ]{#-param-reverse .parameter}
5.  [[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-annotation}
    [secondaryButtonText]{.parameter-name} =
    [\'Close\']{.default-value}, ]{#-param-secondaryButtonText
    .parameter}
6.  [[dynamic]{.type-annotation}
    [secondaryButtonTap]{.parameter-name}()?,
    ]{#-param-secondaryButtonTap .parameter}
7.  [required [dynamic]{.type-annotation} [success]{.parameter-name}(),
    ]{#-param-success .parameter}
8.  [required
    [[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-annotation}
    [dialogSubTitle]{.parameter-name}, ]{#-param-dialogSubTitle
    .parameter}

})
:::

::: {.section .desc .markdown}
Constructs a
[CustomAlertDialog](../../widgets_custom_alert_dialog/CustomAlertDialog-class.html)
widget.

`reverse` indicates whether the order of action buttons should be
reversed. `success` is the function triggered upon tapping the primary
action button. `secondaryButtonTap` is the function triggered upon
tapping the secondary action button. `successText` is the text displayed
on the primary action button. `dialogTitle` is the title displayed in
the dialog (default value is \'Confirmation\'). `dialogSubTitle` is the
subtitle or message content of the dialog. `secondaryButtonText` is the
text displayed on the secondary action button (default value is
\'Close\').
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
const CustomAlertDialog({
  super.key,
  this.successText = 'Confirm',
  this.dialogTitle = 'Confirmation',
  this.reverse = false,
  this.secondaryButtonText = 'Close',
  this.secondaryButtonTap,
  required this.success,
  required this.dialogSubTitle,
});
```
:::
:::::::

::::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../../index.html)
2.  [custom_alert_dialog](../../widgets_custom_alert_dialog/)
3.  [CustomAlertDialog](../../widgets_custom_alert_dialog/CustomAlertDialog-class.html)
4.  CustomAlertDialog const constructor

##### CustomAlertDialog class

::: {#dartdoc-sidebar-left-content}
:::
:::::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
