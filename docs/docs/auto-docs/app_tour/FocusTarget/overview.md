# Overview for `FocusTarget`

## Description

Class that represents FocusTarget.

## Members

- **key**: `GlobalKey`
  represents the key of the target that is intended to be focused.

- **keyName**: `String`
  keyName of the target in mainScreenViewModel.

- **description**: `String`
  description of the target.

- **isCircle**: `bool`
  true if focusing shape is circle.

- **align**: `ContentAlign`
  alignment of description text.

- **crossAlign**: `CrossAxisAlignment`
  crossAxisAlignment.

- **skipAlignment**: `Alignment`
  skip alignment configuration.

- **appTour**: `AppTour`
  instance of AppTour.

- **next**: ` ?`
  next callback that is executed on pressing this target.

- **nextCrossAlign**: `CrossAxisAlignment`
  next target's crossAxisAlignment.

- **isEnd**: `bool`
  true current target ends ths appTour.

- **focusWidget**: `TargetFocus`
  Target focus widget with all above properties.

## Constructors

### Unnamed Constructor
This returns a widget for a step in a tutorial.

 **params**:
 * `key`: key of type GlobalKey.
 * `keyName`: key where the widget shows.
 * `description`: description of the step.
 * `isCircle`: bool to specify if circle
 * `align`: align of type ContentAlign to align button.
 * `crossAlign`: Cross align axes
 * `skipAlignment`: to give alignment of skip option
 * `next`: Function` type, this show the next step or `key` to show the tour of.
 * `nextCrossAlign`: nextCrossAlign to give alignment of next option
 * `isEnd`: true if last step of the tour.
 * `tutorialCoachMark`: instance of tutorialCoachMark to which this focusTarget is linked.

