




dropDownList function - event\_filter\_bottomsheet library - Dart API







menu

1. [talawa](../index.html)
2. [views/after\_auth\_screens/events/event\_filter\_bottomsheet.dart](../views_after_auth_screens_events_event_filter_bottomsheet/views_after_auth_screens_events_event_filter_bottomsheet-library.html)
3. dropDownList function

dropDownList


dark\_mode

light\_mode




# dropDownList function


[Widget](https://api.flutter.dev/flutter/widgets/Widget-class.html)
dropDownList(

1. [ExploreEventsViewModel](../view_model_after_auth_view_models_event_view_models_explore_events_view_model/ExploreEventsViewModel-class.html) model,
2. [BuildContext](https://api.flutter.dev/flutter/widgets/BuildContext-class.html) context

)

Shows a list of dropdown taken from `model` and `context`.

**params**:

* `model`: contains the events data
* `context`: the overall context of UI

**returns**:

* `Widget`: the dropdown

## Implementation

```
Widget dropDownList(
  ExploreEventsViewModel model,
  BuildContext context,
) {
  final Map<String, String> filters = {
    'All Events': 'Show all events',
    'My Events': 'Show all events created by you',
    'Registered Events': 'Show all events you have registered',
    'Public Events': 'Show events for all',
    'Private Events': 'Show invite-only events',
  };
  return SizedBox(
    height: SizeConfig.screenHeight,
    width: SizeConfig.screenWidth,
    child: Padding(
      padding: EdgeInsets.symmetric(
        horizontal: SizeConfig.safeBlockHorizontal! * 10,
      ),
      child: StatefulBuilder(
        builder: (_, StateSetter setState) {
          return SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: SizeConfig.safeBlockVertical,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      AppLocalizations.of(
                        context,
                      )!
                          .strictTranslate(
                        "Filters",
                      ),
                      style: Theme.of(
                        context,
                      ).textTheme.headlineSmall,
                    ),
                    IconButton(
                      key: const Key('close'),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.close,
                      ),
                    ),
                  ],
                ),
                ...List.generate(
                  filters.length,
                  (index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: SizeConfig.safeBlockVertical! * 2,
                      ),
                      child: GestureDetector(
                        onTap: () {
                          model.choseValueFromDropdown(
                            filters.keys.toList()[index],
                          );
                          setState(() {});
                        },
                        child: Container(
                          key: Key(
                            filters.keys.toList()[index],
                          ),
                          decoration: BoxDecoration(
                            color: model.chosenValue ==
                                    filters.keys.toList()[index]
                                ? Theme.of(context).colorScheme.secondary
                                : AppTheme.white,
                            borderRadius: BorderRadius.all(
                              Radius.circular(
                                SizeConfig.safeBlockHorizontal! * 2,
                              ),
                            ),
                          ),
                          width: SizeConfig.screenWidth! - 60,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: SizeConfig.safeBlockHorizontal! * 5,
                              vertical: SizeConfig.safeBlockVertical! / 2,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  AppLocalizations.of(context)!.strictTranslate(
                                    filters.keys.toList()[index],
                                  ),
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelLarge!
                                      .copyWith(
                                        color: model.chosenValue ==
                                                filters.keys.toList()[index]
                                            ? AppTheme.white
                                            : AppTheme.blackPrimary,
                                      ),
                                ),
                                Text(
                                  AppLocalizations.of(context)!.strictTranslate(
                                    filters.values.toList()[index],
                                  ),
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelSmall!
                                      .copyWith(
                                        color: model.chosenValue ==
                                                filters.keys.toList()[index]
                                            ? AppTheme.white
                                            : AppTheme.blackSecondary,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          );
        },
      ),
    ),
  );
}
```

 


1. [talawa](../index.html)
2. [event\_filter\_bottomsheet](../views_after_auth_screens_events_event_filter_bottomsheet/views_after_auth_screens_events_event_filter_bottomsheet-library.html)
3. dropDownList function

##### event\_filter\_bottomsheet library





talawa
1.0.0+1






