


# dropDownList method








[Widget](https://api.flutter.dev/flutter/widgets/Widget-class.html) dropDownList
([ExploreEventsViewModel](../../view_model_after_auth_view_models_event_view_models_explore_events_view_model/ExploreEventsViewModel-class.md) model, [BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.html) context)





<p>Shows a list of dropdown taken from  <code>model</code> and <code>context</code>.</p>
<p><strong>params</strong>:</p>
<ul>
<li><code>model</code>: contains the events data</li>
<li><code>context</code>: the overall context of UI</li>
</ul>
<p><strong>returns</strong>:</p>
<ul>
<li><code>Widget</code>: the dropdown</li>
</ul>



## Implementation

```dart
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







