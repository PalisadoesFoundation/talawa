::: {#overlay-under-drawer}
:::

::: {#title}
[menu]{#sidenav-left-toggle .material-symbols-outlined role="button"
tabindex="0"}

1.  [talawa](../index.html)
2.  [constants/recurrence_values.dart](../constants_recurrence_values/)
3.  RecurrenceUtils class

::: self-name
RecurrenceUtils
:::

::: {#theme-button .toggle title="Toggle brightness"}
[ dark_mode ]{#dark-theme-button .material-symbols-outlined} [
light_mode ]{#light-theme-button .material-symbols-outlined}
:::
:::

::: {role="main"}
::: {#dartdoc-main-content .main-content above-sidebar="constants_recurrence_values/constants_recurrence_values-library-sidebar.html" below-sidebar="constants_recurrence_values/RecurrenceUtils-class-sidebar.html"}
<div>

# [RecurrenceUtils]{.kind-class} class

</div>

::: {.section .desc .markdown}
conatins all neccessary utils.
:::

::: {#constructors .section .summary .offset-anchor}
## Constructors

[[RecurrenceUtils](../constants_recurrence_values/RecurrenceUtils/RecurrenceUtils.html)]{.name}[()]{.signature}

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

::: {#instance-methods .section .summary .offset-anchor .inherited}
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

[[getRecurrenceRuleText](../constants_recurrence_values/RecurrenceUtils/getRecurrenceRuleText.html)]{.name}[([[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-annotation} [frequency]{.parameter-name}, ]{#getRecurrenceRuleText-param-frequency .parameter}[[[Set](https://api.flutter.dev/flutter/dart-core/Set-class.html)[\<[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-parameter}\>]{.signature}?]{.type-annotation} [weekDays]{.parameter-name}, ]{#getRecurrenceRuleText-param-weekDays .parameter}[[[int](https://api.flutter.dev/flutter/dart-core/int-class.html)?]{.type-annotation} [interval]{.parameter-name}, ]{#getRecurrenceRuleText-param-interval .parameter}[[[int](https://api.flutter.dev/flutter/dart-core/int-class.html)?]{.type-annotation} [count]{.parameter-name}, ]{#getRecurrenceRuleText-param-count .parameter}[[[int](https://api.flutter.dev/flutter/dart-core/int-class.html)?]{.type-annotation} [weekDayOccurenceInMonth]{.parameter-name}, ]{#getRecurrenceRuleText-param-weekDayOccurenceInMonth .parameter}[[[DateTime](https://api.flutter.dev/flutter/dart-core/DateTime-class.html)]{.type-annotation} [startDate]{.parameter-name}, ]{#getRecurrenceRuleText-param-startDate .parameter}[[[DateTime](https://api.flutter.dev/flutter/dart-core/DateTime-class.html)?]{.type-annotation} [endDate]{.parameter-name}]{#getRecurrenceRuleText-param-endDate .parameter}) [→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.returntype .parameter} ]{.signature}
:   \'getRecurrenceRuleText\' return text for various recurrence rules.

[[getWeekDayOccurenceInMonth](../constants_recurrence_values/RecurrenceUtils/getWeekDayOccurenceInMonth.html)]{.name}[([[[DateTime](https://api.flutter.dev/flutter/dart-core/DateTime-class.html)]{.type-annotation} [date]{.parameter-name}]{#getWeekDayOccurenceInMonth-param-date .parameter}) [→ [int](https://api.flutter.dev/flutter/dart-core/int-class.html)]{.returntype .parameter} ]{.signature}
:   \'getWeekDayOccurenceInMonth\' returns the week day occurence in
    month.

[[getWeekDaysString](../constants_recurrence_values/RecurrenceUtils/getWeekDaysString.html)]{.name}[([[[List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-parameter}\>]{.signature}]{.type-annotation} [weekDays]{.parameter-name}]{#getWeekDaysString-param-weekDays .parameter}) [→ [String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.returntype .parameter} ]{.signature}
:   \'getWeekDaysString\' returns string for weekDays.

[[isLastOccurenceOfWeekDay](../constants_recurrence_values/RecurrenceUtils/isLastOccurenceOfWeekDay.html)]{.name}[([[[DateTime](https://api.flutter.dev/flutter/dart-core/DateTime-class.html)]{.type-annotation} [date]{.parameter-name}]{#isLastOccurenceOfWeekDay-param-date .parameter}) [→ [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)]{.returntype .parameter} ]{.signature}
:   Function to check whether cuurent event instance is Last occurence
    of Week Day.
:::

::: {#constants .section .summary .offset-anchor}
## Constants

[[monthNames](../constants_recurrence_values/RecurrenceUtils/monthNames-constant.html)]{.name} [→ const [List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-parameter}\>]{.signature}]{.signature}
:   represents all the months.

[[weekDayOccurences](../constants_recurrence_values/RecurrenceUtils/weekDayOccurences-constant.html)]{.name} [→ const [List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-parameter}\>]{.signature}]{.signature}
:   represents all the week day occurences.

[[weekDays](../constants_recurrence_values/RecurrenceUtils/weekDays-constant.html)]{.name} [→ const [List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-parameter}\>]{.signature}]{.signature}
:   represents all the week days.
:::
:::

::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../index.html)
2.  [recurrence_values](../constants_recurrence_values/)
3.  RecurrenceUtils class

##### recurrence_values library

::: {#dartdoc-sidebar-left-content}
:::
:::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
:::

[ talawa 1.0.0+1 ]{.no-break}
