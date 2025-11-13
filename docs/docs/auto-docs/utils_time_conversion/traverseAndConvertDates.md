<div id="overlay-under-drawer">

</div>

<div id="title">

<span id="sidenav-left-toggle" class="material-symbols-outlined"
role="button" tabindex="0">menu</span>

1.  [talawa](../index.md)
2.  [utils/time_conversion.dart](../utils_time_conversion/utils_time_conversion-library.md)
3.  traverseAndConvertDates function

<div class="self-name">

traverseAndConvertDates

</div>

<div id="theme-button" class="toggle" title="Toggle brightness">

<span id="dark-theme-button" class="material-symbols-outlined">
dark_mode </span> <span id="light-theme-button"
class="material-symbols-outlined"> light_mode </span>

</div>

</div>

<div role="main">

<div id="dartdoc-main-content" class="main-content"
above-sidebar="utils_time_conversion/utils_time_conversion-library-sidebar.html"
below-sidebar="">

<div>

# <span class="kind-function">traverseAndConvertDates</span> function

</div>

<div class="section multi-line-signature">

<span class="returntype">void</span>
<span class="name">traverseAndConvertDates</span>(

1.  <span id="traverseAndConvertDates-param-obj"
    class="parameter"><span class="type-annotation">[Map](https://api.flutter.dev/flutter/dart-core/Map-class.md)<span class="signature">\<<span class="type-parameter">[String](https://api.flutter.dev/flutter/dart-core/String-class.html)</span>,
    <span class="type-parameter">dynamic</span>\></span></span>
    <span class="parameter-name">obj</span>, </span>
2.  <span id="traverseAndConvertDates-param-convertFn"
    class="parameter"><span class="type-annotation">[String](https://api.flutter.dev/flutter/dart-core/String-class.html)</span>
    <span class="parameter-name">convertFn</span>(</span>
    1.  <span id="param-"
        class="parameter"><span class="type-annotation">[String](https://api.flutter.dev/flutter/dart-core/String-class.md)?</span></span>

    ),
3.  <span id="traverseAndConvertDates-param-splitFn"
    class="parameter"><span class="type-annotation">[Map](https://api.flutter.dev/flutter/dart-core/Map-class.html)<span class="signature">\<<span class="type-parameter">[String](https://api.flutter.dev/flutter/dart-core/String-class.html)</span>,
    <span class="type-parameter">[String](https://api.flutter.dev/flutter/dart-core/String-class.html)</span>\></span></span>
    <span class="parameter-name">splitFn</span>(</span>
    1.  <span id="param-"
        class="parameter"><span class="type-annotation">[String](https://api.flutter.dev/flutter/dart-core/String-class.md)?</span></span>

    )

)

</div>

<div class="section desc markdown">

Traverses a nested map and converts date and time fields to the desired
format.

**params**:

- `obj`: The nested map to traverse and convert.
- `convertFn`: A function that converts a combined date and time string
  to the desired format.
- `splitFn`: A function that splits a converted date and time string
  into separate date and time strings.

**returns**: None

</div>

<div id="source" class="section summary source-code">

## Implementation

``` language-dart
void traverseAndConvertDates(
  Map<String, dynamic> obj,
  String Function(String?) convertFn,
  Map<String, String> Function(String?) splitFn,
) 
```

</div>

</div>

<div id="dartdoc-sidebar-left" class="sidebar sidebar-offcanvas-left">

<div id="header-search-sidebar" class="hidden-l">

</div>

1.  [talawa](../index.md)
2.  [time_conversion](../utils_time_conversion/utils_time_conversion-library.md)
3.  traverseAndConvertDates function

##### time_conversion library

<div id="dartdoc-sidebar-left-content">

</div>

</div>

<div id="dartdoc-sidebar-right" class="sidebar sidebar-offcanvas-right">

</div>

</div>

<span class="no-break"> talawa 1.0.0+1 </span>
