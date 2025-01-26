::: {#overlay-under-drawer}
:::

::: {#title}
[menu]{#sidenav-left-toggle .material-symbols-outlined role="button"
tabindex="0"}

1.  [talawa](../index.html)
2.  [utils/time_conversion.dart](../utils_time_conversion/)
3.  dateTimeFields constant

::: self-name
dateTimeFields
:::

::: {#theme-button .toggle title="Toggle brightness"}
[ dark_mode ]{#dark-theme-button .material-symbols-outlined} [
light_mode ]{#light-theme-button .material-symbols-outlined}
:::
:::

::: {role="main"}
::: {#dartdoc-main-content .main-content above-sidebar="utils_time_conversion/utils_time_conversion-library-sidebar.html" below-sidebar=""}
<div>

# [dateTimeFields]{.kind-top-level-property} top-level constant

</div>

::: {.section .multi-line-signature}
[Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)[\<[[String](https://api.flutter.dev/flutter/dart-core/String-class.html)]{.type-parameter},
[[List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[Object](https://api.flutter.dev/flutter/dart-core/Object-class.html)]{.type-parameter}\>]{.signature}]{.type-parameter}\>]{.signature}
const [dateTimeFields]{.name}
:::

::: {.section .desc .markdown}
Contains information about the date and time fields used for conversion.
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
const dateTimeFields = {
  'directFields': [
    'createdAt',
    'birthDate',
    'updatedAt',
    'recurrenceStartDate',
    'recurrenceEndDate',
    'pluginCreatedBy',
    'dueDate',
    'completionDate',
    'startCursor',
    'endCursor',
  ],
  'pairedFields': [
    {'dateField': 'startDate', 'timeField': 'startTime'},
    {'dateField': 'endDate', 'timeField': 'endTime'},
  ],
};
```
:::
:::

::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../index.html)
2.  [time_conversion](../utils_time_conversion/)
3.  dateTimeFields constant

##### time_conversion library

::: {#dartdoc-sidebar-left-content}
:::
:::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
:::

[ talawa 1.0.0+1 ]{.no-break}
