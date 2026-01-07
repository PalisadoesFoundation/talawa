# Overview for `Slider`

## Description

A Material Design slider.

 Used to select from a range of values.

 

 
 This example showcases non-discrete and discrete [Slider]s.
 The [Slider]s will show the updated ![Material 3 Design appearance](https://m3.material.io/components/sliders/overview)
 when setting the [Slider.year2023] flag to false.

 ** See code in examples/api/lib/material/slider/slider.0.dart **
 

 
 This example shows a [Slider] widget using the [Slider.secondaryTrackValue]
 to show a secondary track in the slider.

 ** See code in examples/api/lib/material/slider/slider.1.dart **
 

 A slider can be used to select from either a continuous or a discrete set of
 values. The default is to use a continuous range of values from [min] to
 [max]. To use discrete values, use a non-null value for [divisions], which
 indicates the number of discrete intervals. For example, if [min] is 0.0 and
 [max] is 50.0 and [divisions] is 5, then the slider can take on the
 discrete values 0.0, 10.0, 20.0, 30.0, 40.0, and 50.0.

 The terms for the parts of a slider are:

  * The "thumb", which is a shape that slides horizontally when the user
    drags it.
  * The "track", which is the line that the slider thumb slides along.
  * The "value indicator", which is a shape that pops up when the user
    is dragging the thumb to indicate the value being selected.
  * The "active" side of the slider is the side between the thumb and the
    minimum value.
  * The "inactive" side of the slider is the side between the thumb and the
    maximum value.

 The slider will be disabled if [onChanged] is null or if the range given by
 [min]..[max] is empty (i.e. if [min] is equal to [max]).

 The slider widget itself does not maintain any state. Instead, when the state
 of the slider changes, the widget calls the [onChanged] callback. Most
 widgets that use a slider will listen for the [onChanged] callback and
 rebuild the slider with a new [value] to update the visual appearance of the
 slider. To know when the value starts to change, or when it is done
 changing, set the optional callbacks [onChangeStart] and/or [onChangeEnd].

 By default, a slider will be as wide as possible, centered vertically. When
 given unbounded constraints, it will attempt to make the track 144 pixels
 wide (with margins on each side) and will shrink-wrap vertically.

 Requires one of its ancestors to be a [Material] widget.

 Requires one of its ancestors to be a [MediaQuery] widget. Typically, these
 are introduced by the [MaterialApp] or [WidgetsApp] widget at the top of
 your application widget tree.

 To determine how it should be displayed (e.g. colors, thumb shape, etc.),
 a slider uses the [SliderThemeData] available from either a [SliderTheme]
 widget or the [ThemeData.sliderTheme] a [Theme] widget above it in the
 widget tree. You can also override some of the colors with the [activeColor]
 and [inactiveColor] properties, although more fine-grained control of the
 look is achieved using a [SliderThemeData].

 See also:

  * [SliderTheme] and [SliderThemeData] for information about controlling
    the visual appearance of the slider.
  * [Radio], for selecting among a set of explicit values.
  * [Checkbox] and [Switch], for toggling a particular value on or off.
  * <https://material.io/design/components/sliders.html>
  * [MediaQuery], from which the text scale factor is obtained.

## Dependencies

- StatefulWidget

## Members

- **value**: `double`
  The currently selected value for this slider.

 The slider's thumb is drawn at a position that corresponds to this value.

- **secondaryTrackValue**: `double?`
  The secondary track value for this slider.

 If not null, a secondary track using [Slider.secondaryActiveColor] color
 is drawn between the thumb and this value, over the inactive track.

 If less than [Slider.value], then the secondary track is not shown.

 It can be ideal for media scenarios such as showing the buffering progress
 while the [Slider.value] shows the play progress.

- **onChanged**: `ValueChanged&lt;double&gt;?`
  Called during a drag when the user is selecting a new value for the slider
 by dragging.

 The slider passes the new value to the callback but does not actually
 change state until the parent widget rebuilds the slider with the new
 value.

 If null, the slider will be displayed as disabled.

 The callback provided to onChanged should update the state of the parent
 [StatefulWidget] using the [State.setState] method, so that the parent
 gets rebuilt; for example:

 

 ```dart
 Slider(
   value: _duelCommandment.,
   min: 1.0,
   max: 10.0,
   divisions: 10,
   label: '$_duelCommandment',
   onChanged: (double newValue) ,
 )
 ```
 

 See also:

  * [onChangeStart] for a callback that is called when the user starts
    changing the value.
  * [onChangeEnd] for a callback that is called when the user stops
    changing the value.

- **onChangeStart**: `ValueChanged&lt;double&gt;?`
  Called when the user starts selecting a new value for the slider.

 This callback shouldn't be used to update the slider [value] (use
 [onChanged] for that), but rather to be notified when the user has started
 selecting a new value by starting a drag or with a tap.

 The value passed will be the last [value] that the slider had before the
 change began.

 

 ```dart
 Slider(
   value: _duelCommandment.,
   min: 1.0,
   max: 10.0,
   divisions: 10,
   label: '$_duelCommandment',
   onChanged: (double newValue) ,
   onChangeStart: (double startValue) ,
 )
 ```
 

 See also:

  * [onChangeEnd] for a callback that is called when the value change is
    complete.

- **onChangeEnd**: `ValueChanged&lt;double&gt;?`
  Called when the user is done selecting a new value for the slider.

 This callback shouldn't be used to update the slider [value] (use
 [onChanged] for that), but rather to know when the user has completed
 selecting a new [value] by ending a drag or a click.

 

 ```dart
 Slider(
   value: _duelCommandment.,
   min: 1.0,
   max: 10.0,
   divisions: 10,
   label: '$_duelCommandment',
   onChanged: (double newValue) ,
   onChangeEnd: (double newValue) ,
 )
 ```
 

 See also:

  * [onChangeStart] for a callback that is called when a value change
    begins.

- **min**: `double`
  The minimum value the user can select.

 Defaults to 0.0. Must be less than or equal to [max].

 If the [max] is equal to the [min], then the slider is disabled.

- **max**: `double`
  The maximum value the user can select.

 Defaults to 1.0. Must be greater than or equal to [min].

 If the [max] is equal to the [min], then the slider is disabled.

- **divisions**: `int?`
  The number of discrete divisions.

 Typically used with [label] to show the current discrete value.

 If null, the slider is continuous.

- **label**: `String?`
  A label to show above the slider when the slider is active and
 [SliderThemeData.showValueIndicator] is satisfied.

 It is used to display the value of a discrete slider, and it is displayed
 as part of the value indicator shape.

 The label is rendered using the active [ThemeData]'s [TextTheme.bodyLarge]
 text style, with the theme data's [ColorScheme.onPrimary] color. The
 label's text style can be overridden with
 [SliderThemeData.valueIndicatorTextStyle].

 If null, then the value indicator will not be displayed.

 Ignored if this slider is created with [Slider.adaptive].

 See also:

  * [SliderComponentShape] for how to create a custom value indicator
    shape.

- **activeColor**: `Color?`
  The color to use for the portion of the slider track that is active.

 The "active" side of the slider is the side between the thumb and the
 minimum value.

 If null, [SliderThemeData.activeTrackColor] of the ambient
 [SliderTheme] is used. If that is null, [ColorScheme.primary] of the
 surrounding [ThemeData] is used.

 Using a [SliderTheme] gives much more fine-grained control over the
 appearance of various components of the slider.

- **inactiveColor**: `Color?`
  The color for the inactive portion of the slider track.

 The "inactive" side of the slider is the side between the thumb and the
 maximum value.

 If null, [SliderThemeData.inactiveTrackColor] of the ambient [SliderTheme]
 is used. If [Slider.year2023] is false and [ThemeData.useMaterial3] is true,
 then [ColorScheme.secondaryContainer] is used and if [ThemeData.useMaterial3]
 is false, [ColorScheme.primary] with an opacity of 0.24 is used. Otherwise,
 [ColorScheme.surfaceContainerHighest] is used.

 Using a [SliderTheme] gives much more fine-grained control over the
 appearance of various components of the slider.

 Ignored if this slider is created with [Slider.adaptive].

- **secondaryActiveColor**: `Color?`
  The color to use for the portion of the slider track between the thumb and
 the [Slider.secondaryTrackValue].

 Defaults to the [SliderThemeData.secondaryActiveTrackColor] of the current
 [SliderTheme].

 If that is also null, defaults to [ColorScheme.primary] with an
 opacity of 0.54.

 Using a [SliderTheme] gives much more fine-grained control over the
 appearance of various components of the slider.

 Ignored if this slider is created with [Slider.adaptive].

- **thumbColor**: `Color?`
  The color of the thumb.

 If this color is null, [Slider] will use [activeColor], If [activeColor]
 is also null, [Slider] will use [SliderThemeData.thumbColor].

 If that is also null, defaults to [ColorScheme.primary].

 * [CupertinoSlider] will have a white thumb
 (like the native default iOS slider).

- **overlayColor**: `MaterialStateProperty<Color?>?`
  The highlight color that's typically used to indicate that
 the slider thumb is focused, hovered, or dragged.

 If this property is null, [Slider] will use [activeColor] with
 an opacity of 0.12, If null, [SliderThemeData.overlayColor]
 will be used.

 If that is also null, If [ThemeData.useMaterial3] is true,
 Slider will use [ColorScheme.primary] with an opacity of 0.08 when
 slider thumb is hovered and with an opacity of 0.1 when slider thumb
 is focused or dragged, If [ThemeData.useMaterial3] is false, defaults
 to [ColorScheme.primary] with an opacity of 0.12.

- **mouseCursor**: `MouseCursor?`
  
 The cursor for a mouse pointer when it enters or is hovering over the
 widget.

 If [mouseCursor] is a [WidgetStateMouseCursor],
 [WidgetStateProperty.resolve] is used for the following [WidgetState]s:

  * [WidgetState.dragged].
  * [WidgetState.hovered].
  * [WidgetState.focused].
  * [WidgetState.disabled].
 

 If null, then the value of [SliderThemeData.mouseCursor] is used. If that
 is also null, then [WidgetStateMouseCursor.clickable] is used.

- **semanticFormatterCallback**: `SemanticFormatterCallback?`
  The callback used to create a semantic value from a slider value.

 Defaults to formatting values as a percentage.

 This is used by accessibility frameworks like TalkBack on Android to
 inform users what the currently selected value is with more context.

 

 In the example below, a slider for currency values is configured to
 announce a value with a currency label.

 ```dart
 Slider(
   value: _dollars.,
   min: 20.0,
   max: 330.0,
   label: '$_dollars dollars',
   onChanged: (double newValue) ,
   semanticFormatterCallback: (double newValue) 
  )
 ```
 

 Ignored if this slider is created with [Slider.adaptive]

- **focusNode**: `FocusNode?`
  

- **autofocus**: `bool`
  

- **allowedInteraction**: `SliderInteraction?`
  Allowed way for the user to interact with the [Slider].

 For example, if this is set to [SliderInteraction.tapOnly], the user can
 interact with the slider only by tapping anywhere on the track. Sliding
 will have no effect.

 Defaults to [SliderInteraction.tapAndSlide].

- **padding**: `EdgeInsetsGeometry?`
  Determines the padding around the [Slider].

 If specified, this padding overrides the default vertical padding of
 the [Slider], defaults to the height of the overlay shape, and the
 horizontal padding, defaults to the width of the thumb shape or
 overlay shape, whichever is larger.

- **year2023**: `bool?`
  When true, the [Slider] will use the 2023 Material Design 3 appearance.
 Defaults to true.

 If this is set to false, the [Slider] will use the latest Material Design 3
 appearance, which was introduced in December 2023.

 If [ThemeData.useMaterial3] is false, then this property is ignored.

- **_sliderType**: `_SliderType`
## Constructors

### Unnamed Constructor
Creates a Material Design slider.

 The slider itself does not maintain any state. Instead, when the state of
 the slider changes, the widget calls the [onChanged] callback. Most
 widgets that use a slider will listen for the [onChanged] callback and
 rebuild the slider with a new [value] to update the visual appearance of
 the slider.

 * [value] determines currently selected value for this slider.
 * [onChanged] is called while the user is selecting a new value for the
   slider.
 * [onChangeStart] is called when the user starts to select a new value for
   the slider.
 * [onChangeEnd] is called when the user is done selecting a new value for
   the slider.

 You can override some of the colors with the [activeColor] and
 [inactiveColor] properties, although more fine-grained control of the
 appearance is achieved using a [SliderThemeData].

### adaptive
Creates an adaptive [Slider] based on the target platform, following
 Material design's
 [Cross-platform guidelines](https://material.io/design/platform-guidance/cross-platform-adaptation.html).

 Creates a [CupertinoSlider] if the target platform is iOS or macOS, creates a
 Material Design slider otherwise.

 If a [CupertinoSlider] is created, the following parameters are ignored:
 [secondaryTrackValue], [label], [inactiveColor], [secondaryActiveColor],
 [semanticFormatterCallback].

 The target platform is based on the current [Theme]: [ThemeData.platform].

#### Parameters

- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
- ``: `dynamic`
