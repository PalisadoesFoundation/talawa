::::::: {#dartdoc-main-content .main-content above-sidebar="models_app_tour/AppTour-class-sidebar.html" below-sidebar=""}
<div>

# [showTutorial]{.kind-method} method

</div>

::: {.section .multi-line-signature}
[void]{.returntype} [showTutorial]{.name}({

1.  [required [dynamic]{.type-annotation}
    [onClickTarget]{.parameter-name}(]{#showTutorial-param-onClickTarget
    .parameter}
    1.  [[[TargetFocus](https://pub.dev/documentation/tutorial_coach_mark/1.2.12/tutorial_coach_mark/TargetFocus-class.html)]{.type-annotation}]{#param-
        .parameter}

    ),
2.  [required [dynamic]{.type-annotation} [onFinish]{.parameter-name}(),
    ]{#showTutorial-param-onFinish .parameter}
3.  [required
    [[List](https://api.flutter.dev/flutter/dart-core/List-class.html)[\<[[FocusTarget](../../models_app_tour/FocusTarget-class.html)]{.type-parameter}\>]{.signature}]{.type-annotation}
    [targets]{.parameter-name}, ]{#showTutorial-param-targets
    .parameter}

})
:::

::: {.section .desc .markdown}
This function show tutorial to user.

**params**:

-   `onClickTarget`: Its a function which is required to run desired
    tasks on click.
-   `onFinish`: Its a function which is required to run desired tasks on
    finish
-   `targets`: `FocusTargets` to show the tour on.

**returns**: None
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
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
:::
:::::::

::::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../../index.html)
2.  [app_tour](../../models_app_tour/)
3.  [AppTour](../../models_app_tour/AppTour-class.html)
4.  showTutorial method

##### AppTour class

::: {#dartdoc-sidebar-left-content}
:::
:::::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
