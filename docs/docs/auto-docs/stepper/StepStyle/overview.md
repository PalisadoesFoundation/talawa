# Overview for `StepStyle`

## Description

This class is used to override the default visual properties of [Step] widgets within a [Stepper].

 To customize the appearance of a [Step] create an instance of this class with non-null parameters
 for the step properties whose default value you want to override.

 Example usage:
 ```dart
 Step(
   title: const Text('Step 1'),
   content: const Text('Content for Step 1'),
   stepStyle: StepStyle(
     color: Colors.blue,
     errorColor: Colors.red,
     border: Border.all(color: Colors.grey),
     boxShadow: const BoxShadow(blurRadius: 3.0, color: Colors.black26),
     gradient: const LinearGradient(colors: <Color>[Colors.red, Colors.blue]),
     indexStyle: const TextStyle(color: Colors.white),
   ),
 )
 ```

 
 An example that uses [StepStyle] to customize the appearance of each [Step] in a [Stepper].

 ** See code in examples/api/lib/material/stepper/step_style.0.dart **
 

## Dependencies

- Diagnosticable

## Members

- **color**: `Color?`
  Overrides the default color of the circle in the step.

- **errorColor**: `Color?`
  Overrides the default color of the error indicator in the step.

- **connectorColor**: `Color?`
  Overrides the default color of the connector line between two steps.

 This property only applies when [Stepper.type] is [StepperType.horizontal].

- **connectorThickness**: `double?`
  Overrides the default thickness of the connector line between two steps.

 This property only applies when [Stepper.type] is [StepperType.horizontal].

- **border**: `BoxBorder?`
  Add a border around the step.

 Will be applied to the circle in the step.

- **boxShadow**: `BoxShadow?`
  Add a shadow around the step.

- **gradient**: `Gradient?`
  Add a gradient around the step.

 If [gradient] is specified, [color] will be ignored.

- **indexStyle**: `TextStyle?`
  Overrides the default style of the index in the step.

## Constructors

### Unnamed Constructor
Constructs a [StepStyle].

