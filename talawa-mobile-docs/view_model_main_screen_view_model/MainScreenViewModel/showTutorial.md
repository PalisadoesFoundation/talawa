


# showTutorial method








void showTutorial
({required dynamic onClickTarget([TargetFocus](https://pub.dev/documentation/tutorial_coach_mark/1.2.9/tutorial_coach_mark/TargetFocus-class.html)), required dynamic onFinish()})





<p>This function show tutorial to user.</p>
<p><strong>params</strong>:</p>
<ul>
<li><code>onClickTarget</code>: Its a function which is required to run desired tasks on click.</li>
<li><code>onFinish</code>: Its a function which is required to run desired tasks on finish</li>
</ul>
<p><strong>returns</strong>:
  None</p>



## Implementation

```dart
void showTutorial({
  required dynamic Function(TargetFocus) onClickTarget,
  required dynamic Function() onFinish,
}) {
  tutorialCoachMark = TutorialCoachMark(
    targets: targets,
    colorShadow: Theme.of(context).colorScheme.secondaryContainer,
    textSkip: "SKIP",
    textStyleSkip: TextStyle(
      color: Theme.of(context).colorScheme.background,
      fontSize: 20,
    ),
    paddingFocus: 10,
    opacityShadow: 1.0,
    onFinish: onFinish,
    onClickTarget: onClickTarget,
    onSkip: () {
      if (scaffoldKey.currentState!.isDrawerOpen) {
        navigationService.pop();
      }
      tourSkipped = true;
      onTabTapped(0);
    },
    onClickOverlay: (target) {
      onClickTarget(target);
    },
  )..show(context: context);
}
```







