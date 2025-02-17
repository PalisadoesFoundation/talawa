
<div>

# dropDownList method

</div>


[[Widget](https://api.flutter.dev/flutter/widgets/Widget-class.html)]
dropDownList(

1.  [[[ExploreEventsViewModel](../../view_model_after_auth_view_models_event_view_models_explore_events_view_model/ExploreEventsViewModel-class.md)]
    model, ]
2.  [[[BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.html)]
    context]

)



Shows a list of dropdown taken from `model` and `context`.

**params**:

-   `model`: contains the events data
-   `context`: the overall context of UI

**returns**:

-   `Widget`: the dropdown



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
    }).,
    onChanged: (value) {
      model.choseValueFromDropdown(value!);
    },
  );
}
```







1.  [talawa](../../index.md)
2.  [explore_events_demo](../../views_demo_screens_explore_events_demo/)
3.  [DemoExploreEvents](../../views_demo_screens_explore_events_demo/DemoExploreEvents-class.md)
4.  dropDownList method

##### DemoExploreEvents class







