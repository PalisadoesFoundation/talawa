<div id="overlay-under-drawer">

</div>

<div id="title">

<span id="sidenav-left-toggle" class="material-symbols-outlined"
role="button" tabindex="0">menu</span>

1.  [talawa](../../index.md)
2.  [constants/recurrence_values.dart](../../constants_recurrence_values/)
3.  [RecurrenceUtils](../../constants_recurrence_values/RecurrenceUtils-class.md)
4.  getRecurrenceRuleText static method

<div class="self-name">

getRecurrenceRuleText

</div>

<span id="dark-theme-button" class="material-symbols-outlined"
aria-hidden="true"> dark_mode </span> <span id="light-theme-button"
class="material-symbols-outlined" aria-hidden="true"> light_mode </span>

</div>

<div role="main">

<div id="dartdoc-main-content" class="main-content"
above-sidebar="constants_recurrence_values/RecurrenceUtils-class-sidebar.html"
below-sidebar="">

<div>

# <span class="kind-method">getRecurrenceRuleText</span> static method

</div>

<div class="section multi-line-signature">

<span class="returntype">[String](https://api.flutter.dev/flutter/dart-core/String-class.html)</span>
<span class="name">getRecurrenceRuleText</span>(

1.  <span id="getRecurrenceRuleText-param-frequency"
    class="parameter"><span class="type-annotation">[String](https://api.flutter.dev/flutter/dart-core/String-class.md)</span>
    <span class="parameter-name">frequency</span>, </span>
2.  <span id="getRecurrenceRuleText-param-weekDays"
    class="parameter"><span class="type-annotation">[Set](https://api.flutter.dev/flutter/dart-core/Set-class.html)<span class="signature">\<<span class="type-parameter">[String](https://api.flutter.dev/flutter/dart-core/String-class.html)</span>\></span>?</span>
    <span class="parameter-name">weekDays</span>, </span>
3.  <span id="getRecurrenceRuleText-param-interval"
    class="parameter"><span class="type-annotation">[int](https://api.flutter.dev/flutter/dart-core/int-class.html)?</span>
    <span class="parameter-name">interval</span>, </span>
4.  <span id="getRecurrenceRuleText-param-count"
    class="parameter"><span class="type-annotation">[int](https://api.flutter.dev/flutter/dart-core/int-class.html)?</span>
    <span class="parameter-name">count</span>, </span>
5.  <span id="getRecurrenceRuleText-param-weekDayOccurenceInMonth"
    class="parameter"><span class="type-annotation">[int](https://api.flutter.dev/flutter/dart-core/int-class.html)?</span>
    <span class="parameter-name">weekDayOccurenceInMonth</span>, </span>
6.  <span id="getRecurrenceRuleText-param-startDate"
    class="parameter"><span class="type-annotation">[DateTime](https://api.flutter.dev/flutter/dart-core/DateTime-class.html)</span>
    <span class="parameter-name">startDate</span>, </span>
7.  <span id="getRecurrenceRuleText-param-endDate"
    class="parameter"><span class="type-annotation">[DateTime](https://api.flutter.dev/flutter/dart-core/DateTime-class.html)?</span>
    <span class="parameter-name">endDate</span>, </span>

)

</div>

<div class="section desc markdown">

'getRecurrenceRuleText' return text for various recurrence rules.

**params**:

- `frequency`: Frequency of the event.
- `weekDays`: List of week days.
- `interval`: Interval of the event.
- `count`: Count of the event.
- `weekDayOccurenceInMonth`: Week day occurence in month.
- `startDate`: Start date of the event.
- `endDate`: End date of the event.

**returns**:

- `String`: Recurrence rule text.

</div>

<div id="source" class="section summary source-code">

## Implementation

``` language-dart
static String getRecurrenceRuleText(
  String frequency,
  Set<String>? weekDays,
  int? interval,
  int? count,
  int? weekDayOccurenceInMonth,
  DateTime startDate,
  DateTime? endDate,
) 
```

</div>

</div>

<div id="dartdoc-sidebar-left" class="sidebar sidebar-offcanvas-left">

<div id="header-search-sidebar" class="hidden-l">

</div>

1.  [talawa](../../index.md)
2.  [recurrence_values](../../constants_recurrence_values/)
3.  [RecurrenceUtils](../../constants_recurrence_values/RecurrenceUtils-class.md)
4.  getRecurrenceRuleText static method

##### RecurrenceUtils class

<div id="dartdoc-sidebar-left-content">

</div>

</div>

<div id="dartdoc-sidebar-right" class="sidebar sidebar-offcanvas-right">

</div>

</div>

<span class="no-break"> talawa 1.0.0+1 </span>
