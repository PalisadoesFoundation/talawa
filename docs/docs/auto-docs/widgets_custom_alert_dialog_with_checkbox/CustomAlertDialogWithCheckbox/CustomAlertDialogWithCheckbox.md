:::::: {#dartdoc-main-content .main-content above-sidebar="widgets_custom_alert_dialog_with_checkbox/CustomAlertDialogWithCheckbox-class-sidebar.html" below-sidebar=""}
<div>

# [CustomAlertDialogWithCheckbox]{.kind-constructor} constructor

</div>

::: {.section .multi-line-signature}
const [CustomAlertDialogWithCheckbox]{.name}({

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
7.  [required [dynamic]{.type-annotation}
    [success]{.parameter-name}(]{#-param-success .parameter}
    1.  [[[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)?]{.type-annotation}]{#param-
        .parameter}

    ),
8.  [required
    [[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-annotation}
    [dialogSubTitle]{.parameter-name}, ]{#-param-dialogSubTitle
    .parameter}
9.  [required
    [[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-annotation}
    [checkboxLabel]{.parameter-name}, ]{#-param-checkboxLabel
    .parameter}
10. [[[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]{.type-annotation}
    [initialCheckboxValue]{.parameter-name} = [false]{.default-value},
    ]{#-param-initialCheckboxValue .parameter}

})
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
const CustomAlertDialogWithCheckbox({
  super.key,
  this.successText = 'Confirm',
  this.dialogTitle = 'Confirmation',
  this.reverse = false,
  this.secondaryButtonText = 'Close',
  this.secondaryButtonTap,
  required this.success,
  required this.dialogSubTitle,
  required this.checkboxLabel,
  this.initialCheckboxValue = false,
});
```
:::
::::::

::::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../../index.html)
2.  [custom_alert_dialog_with_checkbox](../../widgets_custom_alert_dialog_with_checkbox/)
3.  [CustomAlertDialogWithCheckbox](../../widgets_custom_alert_dialog_with_checkbox/CustomAlertDialogWithCheckbox-class.html)
4.  CustomAlertDialogWithCheckbox const constructor

##### CustomAlertDialogWithCheckbox class

::: {#dartdoc-sidebar-left-content}
:::
:::::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
