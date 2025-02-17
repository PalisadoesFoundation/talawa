:::::::::: {#dartdoc-main-content .main-content above-sidebar="utils_validators/utils_validators-library-sidebar.html" below-sidebar="utils_validators/Validator-class-sidebar.html"}
<div>

# [Validator]{.kind-class} class

</div>

::: {.section .desc .markdown}
This class creats various validator methods for the application.

They are used to validate information given by the users.
:::

::: {#constructors .section .summary .offset-anchor}
## Constructors

[[Validator](../utils_validators/Validator/Validator.html)]{.name}[()]{.signature}

:   
:::

::: {#instance-properties .section .summary .offset-anchor .inherited}
## Properties

[[hashCode](https://api.flutter.dev/flutter/dart-core/Object/hashCode.html)]{.name} [→ [int](https://api.flutter.dev/flutter/dart-core/int-class.html)]{.signature}
:   The hash code for this object.
    ::: features
    [no setter]{.feature}[inherited]{.feature}
    :::

[[runtimeType](https://api.flutter.dev/flutter/dart-core/Object/runtimeType.html)]{.name} [→ [Type](https://api.flutter.dev/flutter/dart-core/Type-class.html)]{.signature}
:   A representation of the runtime type of the object.
    ::: features
    [no setter]{.feature}[inherited]{.feature}
    :::
:::

::: {#instance-methods .section .summary .offset-anchor}
## Methods

[[noSuchMethod](https://api.flutter.dev/flutter/dart-core/Object/noSuchMethod.html)]{.name}[([[[Invocation](https://api.flutter.dev/flutter/dart-core/Invocation-class.html)]{.type-annotation} [invocation]{.parameter-name}]{#noSuchMethod-param-invocation .parameter}) [→ dynamic]{.returntype .parameter} ]{.signature}
:   Invoked when a nonexistent method or property is accessed.
    ::: features
    [inherited]{.feature}
    :::

[[toString](https://api.flutter.dev/flutter/dart-core/Object/toString.html)]{.name}[() [→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.returntype .parameter} ]{.signature}
:   A string representation of this object.
    ::: features
    [inherited]{.feature}
    :::

[[validateUrlExistence](../utils_validators/Validator/validateUrlExistence.html)]{.name}[([[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-annotation} [url]{.parameter-name}]{#validateUrlExistence-param-url .parameter}) [→ [Future](https://api.flutter.dev/flutter/dart-core/Future-class.html)[\<[[bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)?]{.type-parameter}\>]{.signature}]{.returntype .parameter} ]{.signature}
:   Method to validate already exisiting URL.
:::

::: {#operators .section .summary .offset-anchor .inherited}
## Operators

[[operator ==](https://api.flutter.dev/flutter/dart-core/Object/operator_equals.html)]{.name}[([[[Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)]{.type-annotation} [other]{.parameter-name}]{#==-param-other .parameter}) [→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]{.returntype .parameter} ]{.signature}
:   The equality operator.
    ::: features
    [inherited]{.feature}
    :::
:::

::: {#static-methods .section .summary .offset-anchor}
## Static Methods

[[validateEmail](../utils_validators/Validator/validateEmail.html)]{.name}[([[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-annotation} [email]{.parameter-name}]{#validateEmail-param-email .parameter}) [→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)?]{.returntype .parameter} ]{.signature}
:   Method to validate a user\'s email.

[[validateEventForm](../utils_validators/Validator/validateEventForm.html)]{.name}[([[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-annotation} [value]{.parameter-name}, ]{#validateEventForm-param-value .parameter}[[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)?]{.type-annotation} [label]{.parameter-name}]{#validateEventForm-param-label .parameter}) [→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)?]{.returntype .parameter} ]{.signature}
:   Method to validate event form.

[[validateEventTime](../utils_validators/Validator/validateEventTime.html)]{.name}[([[[TimeOfDay](https://api.flutter.dev/flutter/material/TimeOfDay-class.html)]{.type-annotation} [startTime]{.parameter-name}, ]{#validateEventTime-param-startTime .parameter}[[[TimeOfDay](https://api.flutter.dev/flutter/material/TimeOfDay-class.html)]{.type-annotation} [endTime]{.parameter-name}]{#validateEventTime-param-endTime .parameter}) [→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)?]{.returntype .parameter} ]{.signature}
:   Method to validate event time.

[[validateFirstName](../utils_validators/Validator/validateFirstName.html)]{.name}[([[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-annotation} [value]{.parameter-name}]{#validateFirstName-param-value .parameter}) [→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)?]{.returntype .parameter} ]{.signature}
:   Method to validate a user\'s first name.

[[validateLastName](../utils_validators/Validator/validateLastName.html)]{.name}[([[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-annotation} [value]{.parameter-name}]{#validateLastName-param-value .parameter}) [→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)?]{.returntype .parameter} ]{.signature}
:   Method to validate a user\'s last name.

[[validatePassword](../utils_validators/Validator/validatePassword.html)]{.name}[([[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-annotation} [password]{.parameter-name}]{#validatePassword-param-password .parameter}) [→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)?]{.returntype .parameter} ]{.signature}
:   Method to validate password.

[[validatePasswordConfirm](../utils_validators/Validator/validatePasswordConfirm.html)]{.name}[([[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-annotation} [value]{.parameter-name}, ]{#validatePasswordConfirm-param-value .parameter}[[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-annotation} [comparator]{.parameter-name}]{#validatePasswordConfirm-param-comparator .parameter}) [→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)?]{.returntype .parameter} ]{.signature}
:   Method to valid password re-entered for confirmation.

[[validateURL](../utils_validators/Validator/validateURL.html)]{.name}[([[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-annotation} [value]{.parameter-name}]{#validateURL-param-value .parameter}) [→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)?]{.returntype .parameter} ]{.signature}
:   Method to validate an organization\'s URL.
:::
::::::::::

::::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../index.html)
2.  [validators](../utils_validators/)
3.  Validator class

##### validators library

::: {#dartdoc-sidebar-left-content}
:::
:::::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
