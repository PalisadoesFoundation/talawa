::::::: {#dartdoc-main-content .main-content above-sidebar="views_demo_screens_explore_events_demo/DemoExploreEvents-class-sidebar.html" below-sidebar=""}
<div>

# [dropDownList]{.kind-method} method

</div>

::: {.section .multi-line-signature}
[[Widget](https://api.flutter.dev/flutter/widgets/Widget-class.html)]{.returntype}
[dropDownList]{.name}(

1.  [[[ExploreEventsViewModel](../../view_model_after_auth_view_models_event_view_models_explore_events_view_model/ExploreEventsViewModel-class.html)]{.type-annotation}
    [model]{.parameter-name}, ]{#dropDownList-param-model .parameter}
2.  [[[BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.html)]{.type-annotation}
    [context]{.parameter-name}]{#dropDownList-param-context .parameter}

)
:::

::: {.section .desc .markdown}
Shows a list of dropdown taken from `model` and `context`.

**params**:

-   `model`: contains the events data
-   `context`: the overall context of UI

**returns**:

-   `Widget`: the dropdown
:::

::: {#source .section .summary .source-code}
## Implementation

``` language-dart
Widget dropDownList(ExploreEventsViewModel model, BuildContext context) {
  return DropdownButton<String>(
    key: homeModel?.keySECategoryMenu,
    value: model.chosenValue,
    isExpanded: true,
    items: <String>[
      'All Events',
      'Created Events',
      'Registered Events',
      'Public Events',
      'Private Events',
    ].map<DropdownMenuItem<String>>((String value) {
      return DropdownMenuItem<String>(
        value: value,
        child: Text(
          AppLocalizations.of(context)!.strictTranslate(value),
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: Theme.of(context).colorScheme.secondary),
        ),
      );
    }).toList(),
    onChanged: (value) {
      model.choseValueFromDropdown(value!);
    },
  );
}
```
:::
:::::::

::::: {#dartdoc-sidebar-left .sidebar .sidebar-offcanvas-left}
::: {#header-search-sidebar .hidden-l}
:::

1.  [talawa](../../index.html)
2.  [explore_events_demo](../../views_demo_screens_explore_events_demo/)
3.  [DemoExploreEvents](../../views_demo_screens_explore_events_demo/DemoExploreEvents-class.html)
4.  dropDownList method

##### DemoExploreEvents class

::: {#dartdoc-sidebar-left-content}
:::
:::::

::: {#dartdoc-sidebar-right .sidebar .sidebar-offcanvas-right}
:::
