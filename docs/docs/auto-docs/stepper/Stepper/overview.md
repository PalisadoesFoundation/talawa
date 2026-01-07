# Overview for `Stepper`

## Description

A material stepper widget that displays progress through a sequence of
 steps. Steppers are particularly useful in the case of forms where one step
 requires the completion of another one, or where multiple steps need to be
 completed in order to submit the whole form.

 The widget is a flexible wrapper. A parent class should pass [currentStep]
 to this widget based on some logic triggered by the three callbacks that it
 provides.

 
 An example the shows how to use the [Stepper], and the [Stepper] UI
 appearance.

 ** See code in examples/api/lib/material/stepper/stepper.0.dart **
 

 See also:

  * [Step]
  * <https://material.io/archive/guidelines/components/steppers.html>

## Dependencies

- StatefulWidget

## Members

- **steps**: `List&lt;Step&gt;`
  The steps of the stepper whose titles, subtitles, icons always get shown.

 The length of [steps] must not change.

- **physics**: `ScrollPhysics?`
  How the stepper's scroll view should respond to user input.

 For example, determines how the scroll view continues to
 animate after the user stops dragging the scroll view.

 If the stepper is contained within another scrollable it
 can be helpful to set this property to [ClampingScrollPhysics].

- **controller**: `ScrollController?`
  An object that can be used to control the position to which this scroll
 view is scrolled.

 To control the initial scroll offset of the scroll view, provide a
 [controller] with its [ScrollController.initialScrollOffset] property set.

- **type**: `StepperType`
  The type of stepper that determines the layout. In the case of
 [StepperType.horizontal], the content of the current step is displayed
 underneath as opposed to the [StepperType.vertical] case where it is
 displayed in-between.

- **currentStep**: `int`
  The index into [steps] of the current step whose content is displayed.

- **onStepTapped**: `ValueChanged&lt;int&gt;?`
  The callback called when a step is tapped, with its index passed as
 an argument.

- **onStepContinue**: `VoidCallback?`
  The callback called when the 'continue' button is tapped.

 If null, the 'continue' button will be disabled.

- **onStepCancel**: `VoidCallback?`
  The callback called when the 'cancel' button is tapped.

 If null, the 'cancel' button will be disabled.

- **controlsBuilder**: `ControlsWidgetBuilder?`
  The callback for creating custom controls.

 If null, the default controls from the current theme will be used.

 This callback which takes in a context and a [ControlsDetails] object, which
 contains step information and two functions: [onStepContinue] and [onStepCancel].
 These can be used to control the stepper. For example, reading the
 [ControlsDetails.currentStep] value within the callback can change the text
 of the continue or cancel button depending on which step users are at.

 
 Creates a stepper control with custom buttons.

 ```dart
 Widget build(BuildContext context) 
 ```
 ** See code in examples/api/lib/material/stepper/stepper.controls_builder.0.dart **
 

- **elevation**: `double?`
  The elevation of this stepper's [Material] when [type] is [StepperType.horizontal].

- **margin**: `EdgeInsetsGeometry?`
  Custom margin on vertical stepper.

- **connectorColor**: `MaterialStateProperty&lt;Color&gt;?`
  Customize connected lines colors.

 Resolves in the following states:
  * [WidgetState.selected].
  * [WidgetState.disabled].

 If not set then the widget will use default colors, primary for selected state
 and grey.shade400 for disabled state.

- **connectorThickness**: `double?`
  The thickness of the connecting lines.

- **stepIconBuilder**: `StepIconBuilder?`
  Callback for creating custom icons for the [steps].

 When overriding icon for [StepState.error], please return
 a widget whose width and height are 14 pixels or less to avoid overflow.

 If null, the default icons will be used for respective [StepState].

- **stepIconHeight**: `double?`
  Overrides the default step icon size height.

- **stepIconWidth**: `double?`
  Overrides the default step icon size width.

- **stepIconMargin**: `EdgeInsets?`
  Overrides the default step icon margin.

- **clipBehavior**: `Clip`
  The [Step.content] will be clipped to this Clip type.

 Defaults to [Clip.none].

 See also:

  * [Clip], which explains how to use this property.

## Constructors

### Unnamed Constructor
Creates a stepper from a list of steps.

 This widget is not meant to be rebuilt with a different list of steps
 unless a key is provided in order to distinguish the old stepper from the
 new one.

