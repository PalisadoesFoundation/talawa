<div id="overlay-under-drawer">

</div>

<div id="title">

<span id="sidenav-left-toggle" class="material-symbols-outlined"
role="button" tabindex="0">menu</span>

1.  [talawa](../../index.md)
2.  [widgets/recurrence_dialog.dart](../../widgets_recurrence_dialog/widgets_recurrence_dialog-library.md)
3.  [ShowRecurrenceDialog](../../widgets_recurrence_dialog/ShowRecurrenceDialog-class.md)
4.  debugFillProperties method

<div class="self-name">

debugFillProperties

</div>

<div id="theme-button" class="toggle" title="Toggle brightness">

<span id="dark-theme-button" class="material-symbols-outlined">
dark_mode </span> <span id="light-theme-button"
class="material-symbols-outlined"> light_mode </span>

</div>

</div>

<div role="main">

<div id="dartdoc-main-content" class="main-content"
above-sidebar="widgets_recurrence_dialog/ShowRecurrenceDialog-class-sidebar.html"
below-sidebar="">

<div>

# <span class="kind-method">debugFillProperties</span> method

</div>

<div class="section multi-line-signature">

<div>

1.  @[override](https://api.flutter.dev/flutter/dart-core/override-constant.html)

</div>

<span class="returntype">void</span>
<span class="name">debugFillProperties</span>(

1.  <span id="debugFillProperties-param-properties"
    class="parameter"><span class="type-annotation">DiagnosticPropertiesBuilder</span>
    <span class="parameter-name">properties</span></span>

)

<div class="features">

<span class="feature">inherited</span>

</div>

</div>

<div class="section desc markdown">

Add additional properties associated with the node.

Use the most specific `DiagnosticsProperty` existing subclass to
describe each property instead of the `DiagnosticsProperty` base class.
There are only a small number of `DiagnosticsProperty` subclasses each
covering a common use case. Consider what values a property is relevant
for users debugging as users debugging large trees are overloaded with
information. Common named parameters in `DiagnosticsNode` subclasses
help filter when and how properties are displayed.

`defaultValue`, `showName`, `showSeparator`, and `level` keep string
representations of diagnostics terse and hide properties when they are
not very useful.

- Use `defaultValue` any time the default value of a property is
  uninteresting. For example, specify a default value of null any time a
  property being null does not indicate an error.

- Avoid specifying the `level` parameter unless the result you want
  cannot be achieved by using the `defaultValue` parameter or using the
  `ObjectFlagProperty` class to conditionally display the property as a
  flag.

- Specify `showName` and `showSeparator` in rare cases where the string
  output would look clumsy if they were not set.

  ``` language-dart
  DiagnosticsProperty<Object>('child(3, 4)', null, ifNull: 'is null', showSeparator: false).
  ```

  Shows using `showSeparator` to get output `child(3, 4) is null` which
  is more polished than `child(3, 4): is null`.

  ``` language-dart
  DiagnosticsProperty<IconData>('icon', icon, ifNull: '<empty>', showName: false).
  ```

  Shows using `showName` to omit the property name as in this context
  the property name does not add useful information.

`ifNull`, `ifEmpty`, `unit`, and `tooltip` make property descriptions
clearer. The examples in the code sample below illustrate good uses of
all of these parameters.

## DiagnosticsProperty subclasses for primitive types

- `StringProperty`, which supports automatically enclosing a
  [String](https://api.flutter.dev/flutter/dart-core/String-class.html)
  value in quotes.
- `DoubleProperty`, which supports specifying a unit of measurement for
  a
  [double](https://api.flutter.dev/flutter/dart-core/double-class.html)
  value.
- `PercentProperty`, which clamps a
  [double](https://api.flutter.dev/flutter/dart-core/double-class.html)
  to between 0 and 1 and formats it as a percentage.
- `IntProperty`, which supports specifying a unit of measurement for an
  [int](https://api.flutter.dev/flutter/dart-core/int-class.html) value.
- `FlagProperty`, which formats a
  [bool](https://api.flutter.dev/flutter/dart-core/bool-class.html)
  value as one or more flags. Depending on the use case it is better to
  format a bool as `DiagnosticsProperty<bool>` instead of using
  `FlagProperty` as the output is more verbose but unambiguous.

## Other important `DiagnosticsProperty` variants

- `EnumProperty`, which provides terse descriptions of enum values
  working around limitations of the `toString` implementation for Dart
  enum types.
- `IterableProperty`, which handles iterable values with display
  customizable depending on the `DiagnosticsTreeStyle` used.
- `ObjectFlagProperty`, which provides terse descriptions of whether a
  property value is present or not. For example, whether an `onClick`
  callback is specified or an animation is in progress.
- `ColorProperty`, which must be used if the property value is a
  [Color](https://api.flutter.dev/flutter/dart-ui/Color-class.html) or
  one of its subclasses.
- `IconDataProperty`, which must be used if the property value is of
  type `IconData`.

If none of these subclasses apply, use the `DiagnosticsProperty`
constructor or in rare cases create your own `DiagnosticsProperty`
subclass as in the case for `TransformProperty` which handles
[Matrix4](https://pub.dev/documentation/vector_math/2.1.4/vector_math_64/Matrix4-class.html)
that represent transforms. Generally any property value with a good
`toString` method implementation works fine using `DiagnosticsProperty`
directly.



This example shows best practices for implementing
[debugFillProperties](../../widgets_recurrence_dialog/ShowRecurrenceDialog/debugFillProperties.md)
illustrating use of all common `DiagnosticsProperty` subclasses and all
common `DiagnosticsProperty` parameters.

``` language-dart
class ExampleObject extends ExampleSuperclass 
```



Used by
[toDiagnosticsNode](../../widgets_recurrence_dialog/ShowRecurrenceDialog/toDiagnosticsNode.md)
and
[toString](../../widgets_recurrence_dialog/ShowRecurrenceDialog/toString.md).

Do not add values that have lifetime shorter than the object.

</div>

<div id="source" class="section summary source-code">

## Implementation

``` language-dart
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) 
```

</div>

</div>

<div id="dartdoc-sidebar-left" class="sidebar sidebar-offcanvas-left">

<div id="header-search-sidebar" class="hidden-l">

</div>

1.  [talawa](../../index.md)
2.  [recurrence_dialog](../../widgets_recurrence_dialog/widgets_recurrence_dialog-library.md)
3.  [ShowRecurrenceDialog](../../widgets_recurrence_dialog/ShowRecurrenceDialog-class.md)
4.  debugFillProperties method

##### ShowRecurrenceDialog class

<div id="dartdoc-sidebar-left-content">

</div>

</div>

<div id="dartdoc-sidebar-right" class="sidebar sidebar-offcanvas-right">

</div>

</div>

<span class="no-break"> talawa 1.0.0+1 </span>
