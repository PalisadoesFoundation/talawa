<div id="overlay-under-drawer">

</div>

<div id="title">

<span id="sidenav-left-toggle" class="material-symbols-outlined"
role="button" tabindex="0">menu</span>

1.  [talawa](../../index.md)
2.  [utils/validators.dart](../../utils_validators/)
3.  [Validator](../../utils_validators/Validator-class.md)
4.  validateEventTime static method

<div class="self-name">

validateEventTime

</div>

<span id="dark-theme-button" class="material-symbols-outlined"
aria-hidden="true"> dark_mode </span> <span id="light-theme-button"
class="material-symbols-outlined" aria-hidden="true"> light_mode </span>

</div>

<div role="main">

<div id="dartdoc-main-content" class="main-content"
above-sidebar="utils_validators/Validator-class-sidebar.html"
below-sidebar="">

<div>

# <span class="kind-method">validateEventTime</span> static method

</div>

<div class="section multi-line-signature">

<span class="returntype">[String](https://api.flutter.dev/flutter/dart-core/String-class.html)?</span>
<span class="name">validateEventTime</span>(

1.  <span id="validateEventTime-param-startTime"
    class="parameter"><span class="type-annotation">[TimeOfDay](https://api.flutter.dev/flutter/material/TimeOfDay-class.md)</span>
    <span class="parameter-name">startTime</span>, </span>
2.  <span id="validateEventTime-param-endTime"
    class="parameter"><span class="type-annotation">[TimeOfDay](https://api.flutter.dev/flutter/material/TimeOfDay-class.html)</span>
    <span class="parameter-name">endTime</span></span>

)

</div>

<div class="section desc markdown">

Method to validate event time.

**params**:

- `startTime`: the start time of the event
- `endTime`: the end time of the event

**returns**:

- `String?`: error message if time is invalid.

</div>

<div id="source" class="section summary source-code">

## Implementation

``` language-dart
static String? validateEventTime(TimeOfDay startTime, TimeOfDay endTime) 
```

</div>

</div>

<div id="dartdoc-sidebar-left" class="sidebar sidebar-offcanvas-left">

<div id="header-search-sidebar" class="hidden-l">

</div>

1.  [talawa](../../index.md)
2.  [validators](../../utils_validators/)
3.  [Validator](../../utils_validators/Validator-class.md)
4.  validateEventTime static method

##### Validator class

<div id="dartdoc-sidebar-left-content">

</div>

</div>

<div id="dartdoc-sidebar-right" class="sidebar sidebar-offcanvas-right">

</div>

</div>

<span class="no-break"> talawa 1.0.0+1 </span>
