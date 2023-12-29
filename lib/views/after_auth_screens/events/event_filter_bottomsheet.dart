import 'package:flutter/material.dart';
import 'package:talawa/apptheme.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/view_model/after_auth_view_models/event_view_models/explore_events_view_model.dart';

/// Shows a list of dropdown taken from  `model` and `context`.
///
/// **params**:
/// * `model`: contains the events data
/// * `context`: the overall context of UI
///
/// **returns**:
/// * `Widget`: the dropdown
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
