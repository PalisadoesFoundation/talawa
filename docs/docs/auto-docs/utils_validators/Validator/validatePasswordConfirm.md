<div id="overlay-under-drawer">

</div>

<div id="title">

<span id="sidenav-left-toggle" class="material-symbols-outlined"
role="button" tabindex="0">menu</span>

1.  [talawa](../../index.md)
2.  [utils/validators.dart](../../utils_validators/utils_validators-library.md)
3.  [Validator](../../utils_validators/Validator-class.md)
4.  validatePasswordConfirm static method

<div class="self-name">

validatePasswordConfirm

</div>

<div id="theme-button" class="toggle" title="Toggle brightness">

<span id="dark-theme-button" class="material-symbols-outlined">
dark_mode </span> <span id="light-theme-button"
class="material-symbols-outlined"> light_mode </span>

</div>

</div>

<div role="main">

<div id="dartdoc-main-content" class="main-content"
above-sidebar="utils_validators/Validator-class-sidebar.html"
below-sidebar="">

<div>

# <span class="kind-method">validatePasswordConfirm</span> static method

</div>

<div class="section multi-line-signature">

<span class="returntype">[String](https://api.flutter.dev/flutter/dart-core/String-class.html)?</span>
<span class="name">validatePasswordConfirm</span>(

1.  <span id="validatePasswordConfirm-param-value"
    class="parameter"><span class="type-annotation">[String](https://api.flutter.dev/flutter/dart-core/String-class.md)</span>
    <span class="parameter-name">value</span>, </span>
2.  <span id="validatePasswordConfirm-param-comparator"
    class="parameter"><span class="type-annotation">[String](https://api.flutter.dev/flutter/dart-core/String-class.html)</span>
    <span class="parameter-name">comparator</span></span>

)

</div>

<div class="section desc markdown">

Method to valid password re-entered for confirmation.

**params**:

- `value`: the entered password
- `comparator`: the original password

**returns**:

- `String?`: error message if password is invalid.

</div>

<div id="source" class="section summary source-code">

## Implementation

``` language-dart
static String? validatePasswordConfirm(
  String value,
  String comparator,
) 
```

</div>

</div>

<div id="dartdoc-sidebar-left" class="sidebar sidebar-offcanvas-left">

<div id="header-search-sidebar" class="hidden-l">

</div>

1.  [talawa](../../index.md)
2.  [validators](../../utils_validators/utils_validators-library.md)
3.  [Validator](../../utils_validators/Validator-class.md)
4.  validatePasswordConfirm static method

##### Validator class

<div id="dartdoc-sidebar-left-content">

</div>

</div>

<div id="dartdoc-sidebar-right" class="sidebar sidebar-offcanvas-right">

</div>

</div>

<span class="no-break"> talawa 1.0.0+1 </span>
