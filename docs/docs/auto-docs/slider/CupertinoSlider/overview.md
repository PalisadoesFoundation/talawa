# Overview for `CupertinoSlider`

## Description

An iOS-style slider.

 

 Used to select from a range of values.

 A slider can be used to select from either a continuous or a discrete set of
 values. The default is use a continuous range of values from [min] to [max].
 To use discrete values, use a non-null value for [divisions], which
 indicates the number of discrete intervals. For example, if [min] is 0.0 and
 [max] is 50.0 and [divisions] is 5, then the slider can take on the values
 discrete values 0.0, 10.0, 20.0, 30.0, 40.0, and 50.0.

 The slider itself does not maintain any state. Instead, when the state of
 the slider changes, the widget calls the [onChanged] callback. Most widgets
 that use a slider will listen for the [onChanged] callback and rebuild the
 slider with a new [value] to update the visual appearance of the slider.

 
 This example shows how to show the current slider value as it changes.

 ** See code in examples/api/lib/cupertino/slider/cupertino_slider.0.dart **
 

 See also:

  * <https://developer.apple.com/design/human-interface-guidelines/sliders/>

## Dependencies

- StatefulWidget

## Members

- **value**: `double`
  The currently selected value for this slider.

 The slider's thumb is drawn at a position that corresponds to this value.

- **onChanged**: `ValueChanged&lt;double&gt;?`
  Called when the user selects a new value for the slider.

 The slider passes the new value to the callback but does not actually
 change state until the parent widget rebuilds the slider with the new
 value.

 If null, the slider will be displayed as disabled.

 The callback provided to onChanged should update the state of the parent
 [StatefulWidget] using the [State.setState] method, so that the parent
 gets rebuilt; for example:

 ```dart
 CupertinoSlider(
   value: _cupertinoSliderValue.,
   min: 1.0,
   max: 10.0,
   divisions: 10,
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
 selecting a new value by starting a drag.

 The value passed will be the last [value] that the slider had before the
 change began.

 

 ```dart
 CupertinoSlider(
   value: _cupertinoSliderValue.,
   min: 1.0,
   max: 10.0,
   divisions: 10,
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
 selecting a new [value] by ending a drag.

 

 ```dart
 CupertinoSlider(
   value: _cupertinoSliderValue.,
   min: 1.0,
   max: 10.0,
   divisions: 10,
   onChanged: (double newValue) ,
   onChangeEnd: (double newValue) ,
 )
 ```
 

 See also:

  * [onChangeStart] for a callback that is called when a value change
    begins.

- **min**: `double`
  The minimum value the user can select.

 Defaults to 0.0.

- **max**: `double`
  The maximum value the user can select.

 Defaults to 1.0.

- **divisions**: `int?`
  The number of discrete divisions.

 If null, the slider is continuous.

- **activeColor**: `Color?`
  The color to use for the portion of the slider that has been selected.

 Defaults to the [CupertinoTheme]'s primary color if null.

- **thumbColor**: `Color`
  The color to use for the thumb of the slider.

 Defaults to [CupertinoColors.white].

## Constructors

### Unnamed Constructor
Creates an iOS-style slider.

 The slider itself does not maintain any state. Instead, when the state of
 the slider changes, the widget calls the [onChanged] callback. Most widgets
 that use a slider will listen for the [onChanged] callback and rebuild the
 slider with a new [value] to update the visual appearance of the slider.

 * [value] determines currently selected value for this slider.
 * [onChanged] is called when the user selects a new value for the slider.
 * [onChangeStart] is called when the user starts to select a new value for
   the slider.
 * [onChangeEnd] is called when the user is done selecting a new value for
   the slider.

