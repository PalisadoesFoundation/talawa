




showTutorial method - AppTour class - app\_tour library - Dart API







menu

1. [talawa](../../index.html)
2. [models/app\_tour.dart](../../models_app_tour/models_app_tour-library.html)
3. [AppTour](../../models_app_tour/AppTour-class.html)
4. showTutorial method

showTutorial


dark\_mode

light\_mode




# showTutorial method


void
showTutorial({

1. required dynamic onClickTarget(
   1. [TargetFocus](https://pub.dev/documentation/tutorial_coach_mark/1.2.12/tutorial_coach_mark/TargetFocus-class.html)),
2. required dynamic onFinish(),
3. required List<[FocusTarget](../../models_app_tour/FocusTarget-class.html)> targets,

})

This function show tutorial to user.

**params**:

* `onClickTarget`: Its a function which is required to run desired tasks on click.
* `onFinish`: Its a function which is required to run desired tasks on finish
* `targets`: `FocusTargets` to show the tour on.

**returns**:
None


## Implementation

```
void showTutorial({
  required Function(TargetFocus) onClickTarget,
  required dynamic Function() onFinish,
  required List<FocusTarget> targets,
}) {
  tutorialCoachMark = TutorialCoachMark(
    targets: targets.map((target) => target.focusWidget).toList(),
    colorShadow: Theme.of(model.context).colorScheme.secondaryContainer,
    textSkip: "SKIP",
    textStyleSkip: TextStyle(
      color: Theme.of(model.context).colorScheme.surface,
      fontSize: 20,
    ),
    paddingFocus: 10,
    opacityShadow: 1.0,
    onFinish: onFinish,
    onClickTarget: onClickTarget,
    onSkip: () {
      if (MainScreenViewModel.scaffoldKey.currentState!.isDrawerOpen) {
        navigationService.pop();
      }
      model.tourSkipped = true;
      model.onTabTapped(0);
      return true;
    },
    onClickOverlay: (target) {
      onClickTarget(target);
    },
  );
  if (!model.testMode) tutorialCoachMark.show(context: model.context);
}
```

 


1. [talawa](../../index.html)
2. [app\_tour](../../models_app_tour/models_app_tour-library.html)
3. [AppTour](../../models_app_tour/AppTour-class.html)
4. showTutorial method

##### AppTour class





talawa
1.0.0+1






