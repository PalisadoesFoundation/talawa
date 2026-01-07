# Overview for `RangeSlider`

## Description

A Material Design range slider.

 Used to select a range from a range of values.

 

 
 ![A range slider widget, consisting of 5 divisions and showing the default
 value indicator.](https://flutter.github.io/assets-for-api-docs/assets/material/range_slider.png)

 This range values are in intervals of 20 because the Range Slider has 5
 divisions, from 0 to 100. This means are values are split between 0, 20, 40,
 60, 80, and 100. The range values are initialized with 40 and 80 in this demo.

 ** See code in examples/api/lib/material/range_slider/range_slider.0.dart **
 

 A range slider can be used to select from either a continuous or a discrete
 set of values. The default is to use a continuous range of values from [min]
 to [max]. To use discrete values, use a non-null value for [divisions], which
 indicates the number of discrete intervals. For example, if [min] is 0.0 and
 [max] is 50.0 and [divisions] is 5, then the slider can take on the
 discrete values 0.0, 10.0, 20.0, 30.0, 40.0, and 50.0.

 The terms for the parts of a slider are:

  * The "thumbs", which are the shapes that slide horizontally when the user
    drags them to change the selected range.
  * The "track", which is the horizontal line that the thumbs can be dragged
    along.
  * The "tick marks", which mark the discrete values of a discrete slider.
  * The "overlay", which is a highlight that's drawn over a thumb in response
    to a user tap-down gesture.
  * The "value indicators", which are the shapes that pop up when the user
    is dragging a thumb to show the value being selected.
  * The "active" segment of the slider is the segment between the two thumbs.
  * The "inactive" slider segments are the two track intervals outside of the
    slider's thumbs.

 The range slider will be disabled if [onChanged] is null or if the range
 given by [min]..[max] is empty (i.e. if [min] is equal to [max]).

 The range slider widget itself does not maintain any state. Instead, when
 the state of the slider changes, the widget calls the [onChanged] callback.
 Most widgets that use a range slider will listen for the [onChanged] callback
 and rebuild the slider with new [values] to update the visual appearance of
 the slider. To know when the value starts to change, or when it is done
 changing, set the optional callbacks [onChangeStart] and/or [onChangeEnd].

 By default, a slider will be as wide as possible, centered vertically. When
 given unbounded constraints, it will attempt to make the track 144 pixels
 wide (including margins on each side) and will shrink-wrap vertically.

 Requires one of its ancestors to be a [Material] widget. This is typically
 provided by a [Scaffold] widget.

 Requires one of its ancestors to be a [MediaQuery] widget. Typically, a
 [MediaQuery] widget is introduced by the [MaterialApp] or [WidgetsApp]
 widget at the top of your application widget tree.

 To determine how it should be displayed (e.g. colors, thumb shape, etc.),
 a slider uses the [SliderThemeData] available from either a [SliderTheme]
 widget, or the [ThemeData.sliderTheme] inside a [Theme] widget above it in
 the widget tree. You can also override some of the colors with the
 [activeColor] and [inactiveColor] properties, although more fine-grained
 control of the colors, and other visual properties is achieved using a
 [SliderThemeData].

 See also:

  * [SliderTheme] and [SliderThemeData] for information about controlling
    the visual appearance of the slider.
  * [Slider], for a single-valued slider.
  * [Radio], for selecting among a set of explicit values.
  * [Checkbox] and [Switch], for toggling a particular value on or off.
  * <https://material.io/design/components/sliders.html>
  * [MediaQuery], from which the text scale factor is obtained.

## Dependencies

- StatefulWidget

## Members

- **values**: `RangeValues`
  The currently selected values for this range slider.

 The slider's thumbs are drawn at horizontal positions that corresponds to
 these values.

- **onChanged**: `ValueChanged&lt;RangeValues&gt;?`
  Called when the user is selecting a new value for the slider by dragging.

 The slider passes the new values to the callback but does not actually
 change state until the parent widget rebuilds the slider with the new
 values.

 If null, the slider will be displayed as disabled.

 The callback provided to [onChanged] should update the state of the parent
 [StatefulWidget] using the [State.setState] method, so that the parent
 gets rebuilt; for example:

 

 ```dart
 RangeSlider(
   values: _rangeValues,
   min: 1.0,
   max: 10.0,
   onChanged: (RangeValues newValues) ,
 )
 ```
 

 See also:

  * [onChangeStart], which is called when the user starts changing the
    values.
  * [onChangeEnd], which is called when the user stops changing the values.

- **onChangeStart**: `ValueChanged&lt;RangeValues&gt;?`
  Called when the user starts selecting new values for the slider.

 This callback shouldn't be used to update the slider [values] (use
 [onChanged] for that). Rather, it should be used to be notified when the
 user has started selecting a new value by starting a drag or with a tap.

 The values passed will be the last [values] that the slider had before the
 change began.

 

 ```dart
 RangeSlider(
   values: _rangeValues,
   min: 1.0,
   max: 10.0,
   onChanged: (RangeValues newValues) ,
   onChangeStart: (RangeValues startValues) ,
 )
 ```
 

 See also:

  * [onChangeEnd] for a callback that is called when the value change is
    complete.

- **onChangeEnd**: `ValueChanged&lt;RangeValues&gt;?`
  Called when the user is done selecting new values for the slider.

 This differs from [onChanged] because it is only called once at the end
 of the interaction, while [onChanged] is called as the value is getting
 updated within the interaction.

 This callback shouldn't be used to update the slider [values] (use
 [onChanged] for that). Rather, it should be used to know when the user has
 completed selecting a new [values] by ending a drag or a click.

 

 ```dart
 RangeSlider(
   values: _rangeValues,
   min: 1.0,
   max: 10.0,
   onChanged: (RangeValues newValues) ,
   onChangeEnd: (RangeValues endValues) ,
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

 Typically used with [labels] to show the current discrete values.

 If null, the slider is continuous.

- **labels**: `RangeLabels?`
  Labels to show as text in the [SliderThemeData.rangeValueIndicatorShape]
 when the slider is active and [SliderThemeData.showValueIndicator]
 is satisfied.

 There are two labels: one for the start thumb and one for the end thumb.

 Each label is rendered using the active [ThemeData]'s
 [TextTheme.bodyLarge] text style, with the theme data's
 [ColorScheme.onPrimary] color. The label's text style can be overridden
 with [SliderThemeData.valueIndicatorTextStyle].

 If null, then the value indicator will not be displayed.

 See also:

  * [RangeSliderValueIndicatorShape] for how to create a custom value
    indicator shape.

- **activeColor**: `Color?`
  The color of the track's active segment, i.e. the span of track between
 the thumbs.

 Defaults to [ColorScheme.primary].

 Using a [SliderTheme] gives more fine-grained control over the
 appearance of various components of the slider.

- **inactiveColor**: `Color?`
  The color of the track's inactive segments, i.e. the span of tracks
 between the min and the start thumb, and the end thumb and the max.

 Defaults to [ColorScheme.primary] with 24% opacity.

 Using a [SliderTheme] gives more fine-grained control over the
 appearance of various components of the slider.

- **overlayColor**: `MaterialStateProperty<Color?>?`
  The highlight color that's typically used to indicate that
 the range slider thumb is hovered or dragged.

 If this property is null, [RangeSlider] will use [activeColor] with
 an opacity of 0.12. If null, [SliderThemeData.overlayColor]
 will be used, otherwise defaults to [ColorScheme.primary] with
 an opacity of 0.12.

- **mouseCursor**: `MaterialStateProperty<MouseCursor?>?`
  The cursor for a mouse pointer when it enters or is hovering over the
 widget.

 If null, then the value of [SliderThemeData.mouseCursor] is used. If that
 is also null, then [WidgetStateMouseCursor.clickable] is used.

 See also:

  * [WidgetStateMouseCursor], which can be used to create a [MouseCursor].

- **semanticFormatterCallback**: `SemanticFormatterCallback?`
  The callback used to create a semantic value from the slider's values.

 Defaults to formatting values as a percentage.

 This is used by accessibility frameworks like TalkBack on Android to
 inform users what the currently selected value is with more context.

 

 In the example below, a slider for currency values is configured to
 announce a value with a currency label.

 ```dart
 RangeSlider(
   values: _dollarsRange,
   min: 20.0,
   max: 330.0,
   onChanged: (RangeValues newValues) ,
   semanticFormatterCallback: (double newValue) 
  )
 ```
 

- **_minTouchTargetWidth**: `double`
## Constructors

### Unnamed Constructor
Creates a Material Design range slider.

 The range slider widget itself does not maintain any state. Instead, when
 the state of the slider changes, the widget calls the [onChanged]
 callback. Most widgets that use a range slider will listen for the
 [onChanged] callback and rebuild the slider with new [values] to update
 the visual appearance of the slider. To know when the value starts to
 change, or when it is done changing, set the optional callbacks
 [onChangeStart] and/or [onChangeEnd].

 * [values], which determines currently selected values for this range
   slider.
 * [onChanged], which is called while the user is selecting a new value for
   the range slider.
 * [onChangeStart], which is called when the user starts to select a new
   value for the range slider.
 * [onChangeEnd], which is called when the user is done selecting a new
   value for the range slider.

 You can override some of the colors with the [activeColor] and
 [inactiveColor] properties, although more fine-grained control of the
 appearance is achieved using a [SliderThemeData].

 The [min] must be less than or equal to the [max].

 The [RangeValues.start] attribute of the [values] parameter must be less
 than or equal to its [RangeValues.end] attribute. The [RangeValues.start]
 and [RangeValues.end] attributes of the [values] parameter must be greater
 than or equal to the [min] parameter and less than or equal to the [max]
 parameter.

 The [divisions] parameter must be null or greater than zero.

