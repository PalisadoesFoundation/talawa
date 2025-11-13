<div id="overlay-under-drawer">

</div>

<div id="title">

<span id="sidenav-left-toggle" class="material-symbols-outlined"
role="button" tabindex="0">menu</span>

1.  [talawa](../index.md)
2.  [utils/time_conversion.dart](../utils_time_conversion/)
3.  combineDateTime function

<div class="self-name">

combineDateTime

</div>

<span id="dark-theme-button" class="material-symbols-outlined"
aria-hidden="true"> dark_mode </span> <span id="light-theme-button"
class="material-symbols-outlined" aria-hidden="true"> light_mode </span>

</div>

<div role="main">

<div id="dartdoc-main-content" class="main-content"
above-sidebar="utils_time_conversion/utils_time_conversion-library-sidebar.html"
below-sidebar="">

<div>

# <span class="kind-function">combineDateTime</span> function

</div>

<div class="section multi-line-signature">

<span class="returntype">[String](https://api.flutter.dev/flutter/dart-core/String-class.html)</span>
<span class="name">combineDateTime</span>(

1.  <span id="combineDateTime-param-date"
    class="parameter"><span class="type-annotation">[String](https://api.flutter.dev/flutter/dart-core/String-class.md)?</span>
    <span class="parameter-name">date</span>, </span>
2.  <span id="combineDateTime-param-time"
    class="parameter"><span class="type-annotation">[String](https://api.flutter.dev/flutter/dart-core/String-class.html)?</span>
    <span class="parameter-name">time</span></span>

)

</div>

<div class="section desc markdown">

Combines the given date and time strings into a single string.

**params**:

- `date`: The date string in a valid date format (e.g., 'YYYY-MM-DD').
- `time`: The time string in a valid time format (e.g., 'HH:MM:SS').

**returns**:

- `String`: A string that combines the `date` and `time`, separated by a
  space.
- Returns an empty string if either input is null or empty.

</div>

<div id="source" class="section summary source-code">

## Implementation

``` language-dart
String combineDateTime(String? date, String? time) 
```

</div>

</div>

<div id="dartdoc-sidebar-left" class="sidebar sidebar-offcanvas-left">

<div id="header-search-sidebar" class="hidden-l">

</div>

1.  [talawa](../index.md)
2.  [time_conversion](../utils_time_conversion/)
3.  combineDateTime function

##### time_conversion library

<div id="dartdoc-sidebar-left-content">

</div>

</div>

<div id="dartdoc-sidebar-right" class="sidebar sidebar-offcanvas-right">

</div>

</div>

<span class="no-break"> talawa 1.0.0+1 </span>
