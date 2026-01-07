# Overview for `Step`

## Description

A material step used in [Stepper]. The step can have a title and subtitle,
 an icon within its circle, some content and a state that governs its
 styling.

 See also:

  * [Stepper]
  * <https://material.io/archive/guidelines/components/steppers.html>

## Members

- **title**: `Widget`
  The title of the step that typically describes it.

- **subtitle**: `Widget?`
  The subtitle of the step that appears below the title and has a smaller
 font size. It typically gives more details that complement the title.

 If null, the subtitle is not shown.

- **content**: `Widget`
  The content of the step that appears below the [title] and [subtitle].

 Below the content, every step has a 'continue' and 'cancel' button.

- **state**: `StepState`
  The state of the step which determines the styling of its components
 and whether steps are interactive.

- **isActive**: `bool`
  Whether or not the step is active. The flag only influences styling.

- **label**: `Widget?`
  Only [StepperType.horizontal], Optional widget that appears under the [title].
 By default, uses the `bodyLarge` theme.

- **stepStyle**: `StepStyle?`
  Optional overrides for the step's default visual configuration.

## Constructors

### Unnamed Constructor
Creates a step for a [Stepper].

