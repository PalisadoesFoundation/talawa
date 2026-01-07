# Overview for `ControlsDetails`

## Description

Container for all the information necessary to build a Stepper widget's
 forward and backward controls for any given step.

 Used by [Stepper.controlsBuilder].

## Members

- **currentStep**: `int`
  Index that is active for the surrounding [Stepper] widget. This may be
 different from [stepIndex] if the user has just changed steps and we are
 currently animating toward that step.

- **stepIndex**: `int`
  Index of the step for which these controls are being built. This is
 not necessarily the active index, if the user has just changed steps and
 this step is animating away. To determine whether a given builder is building
 the active step or the step being navigated away from, see [isActive].

- **onStepContinue**: `VoidCallback?`
  The callback called when the 'continue' button is tapped.

 If null, the 'continue' button will be disabled.

- **onStepCancel**: `VoidCallback?`
  The callback called when the 'cancel' button is tapped.

 If null, the 'cancel' button will be disabled.

## Constructors

### Unnamed Constructor
Creates a set of details describing the Stepper.

