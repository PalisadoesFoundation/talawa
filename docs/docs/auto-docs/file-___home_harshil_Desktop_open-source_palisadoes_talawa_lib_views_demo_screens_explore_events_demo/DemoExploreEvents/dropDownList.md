




dropDownList method - DemoExploreEvents class - explore\_events\_demo library - Dart API







menu

1. [talawa](../../index.html)
2. [views/demo\_screens/explore\_events\_demo.dart](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_views_demo_screens_explore_events_demo/)
3. [DemoExploreEvents](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_views_demo_screens_explore_events_demo/DemoExploreEvents-class.html)
4. dropDownList method

dropDownList


dark\_mode

light\_mode




# dropDownList method


dynamic
dropDownList(

1. dynamic model,
2. dynamic context

)

Shows a list of dropdown taken from `model` and `context`.

**params**:

* `model`: contains the events data
* `context`: the overall context of UI

**returns**:

* `Widget`: the dropdown

## Implementation

```
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

 


1. [talawa](../../index.html)
2. [explore\_events\_demo](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_views_demo_screens_explore_events_demo/)
3. [DemoExploreEvents](../../file-___home_harshil_Desktop_open-source_palisadoes_talawa_lib_views_demo_screens_explore_events_demo/DemoExploreEvents-class.html)
4. dropDownList method

##### DemoExploreEvents class





talawa
1.0.0+1






