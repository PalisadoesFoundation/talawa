import 'package:flutter/material.dart';
import 'package:talawa/constants/recurrence_values.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/view_model/after_auth_view_models/event_view_models/create_event_view_model.dart';
import 'package:talawa/widgets/create_recurring_event_helper_widgets.dart';
import 'package:talawa/widgets/custom_weekday_selector.dart';

/// custom padding.
final _sectionPadding = SizeConfig.blockSizeHorizontal! * 8;

/// Widget to build custom recurrence page.
class CustomRecurrencePage extends StatefulWidget {
  const CustomRecurrencePage({super.key, required this.model});

  /// Instance of create event view model.
  final CreateEventViewModel model;

  @override
  State<CustomRecurrencePage> createState() => _CustomRecurrencePageState();
}

class _CustomRecurrencePageState extends State<CustomRecurrencePage> {
  /// Instance of create event view model.
  late CreateEventViewModel viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = widget.model;
    viewModel.endOccurenceController.addListener(() {
      if (viewModel.endOccurenceController.text.isNotEmpty) {
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    viewModel.endOccurenceController.removeListener(() {
      setState(() {});
    });
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 1,
        centerTitle: true,
        title: Text(
          AppLocalizations.of(context)!.strictTranslate('Custom recurrence'),
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontWeight: FontWeight.w600,
                fontSize: 20,
              ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              setState(() {
                if (viewModel.eventEndType == EventEndTypes.never) {
                  viewModel.setEventEndDate(null);
                } else if (viewModel.eventEndType == EventEndTypes.after) {
                  viewModel.count =
                      int.parse(viewModel.endOccurenceController.text);
                }
                viewModel.interval =
                    int.parse(viewModel.repeatsEveryCountController.text);
                viewModel.recurrenceLabel =
                    RecurrenceUtils.getRecurrenceRuleText(
                  viewModel.frequency,
                  viewModel.weekDays,
                  viewModel.interval,
                  viewModel.count,
                  viewModel.weekDayOccurenceInMonth,
                  viewModel.eventStartDate,
                  viewModel.eventEndDate,
                );
              });
              print(
                "Frequency - ${viewModel.frequency}, Weekdays - ${viewModel.weekDays}, Interval - ${viewModel.interval}, Count - ${viewModel.count}, WeekDayOccurenceInMonth - ${viewModel.weekDayOccurenceInMonth}, End Date - ${viewModel.eventEndDate}, Start Date - ${viewModel.eventStartDate}, Recurrence Label - ${viewModel.recurrenceLabel}",
              );
              navigationService.pop();
            },
            child: Text(AppLocalizations.of(context)!.strictTranslate('Done')),
          ),
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: _buildRecurrenceOptions(context),
      ),
    );
  }

  /// Utility to build recurrence options widgets.
  ///
  /// **params**:
  /// * `context`: BuildContext of the widget.
  ///
  /// **returns**:
  /// * `Column`: Column of recurrence options widgets.
  Column _buildRecurrenceOptions(BuildContext context) {
    final List<String> monthlyOptions = [
      RecurrenceUtils.getRecurrenceRuleText(
        Frequency.monthly,
        null,
        int.parse(viewModel.repeatsEveryCountController.text),
        int.parse(viewModel.endOccurenceController.text),
        null,
        viewModel.eventStartDate,
        viewModel.eventEndDate,
      ),
      RecurrenceUtils.getRecurrenceRuleText(
        Frequency.monthly,
        {
          RecurrenceUtils.weekDays[widget.model.eventStartDate.weekday],
        },
        int.parse(viewModel.repeatsEveryCountController.text),
        int.parse(viewModel.endOccurenceController.text),
        RecurrenceUtils.getWeekDayOccurenceInMonth(
          widget.model.eventStartDate,
        ),
        viewModel.eventStartDate,
        viewModel.eventEndDate,
      ),
      RecurrenceUtils.getRecurrenceRuleText(
        Frequency.monthly,
        {
          RecurrenceUtils.weekDays[widget.model.eventStartDate.weekday],
        },
        int.parse(viewModel.repeatsEveryCountController.text),
        int.parse(viewModel.endOccurenceController.text),
        -1,
        viewModel.eventStartDate,
        viewModel.eventEndDate,
      ),
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.all(_sectionPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              inputFieldHeading('Repeats every'),
              _section1InputFields(),
            ],
          ),
        ),
        recurrenceisDailyorYearly()
            ? buildCustomDivider(context)
            : Column(
                children: [
                  buildCustomDivider(context),
                  Container(
                    padding: EdgeInsets.fromLTRB(
                      _sectionPadding,
                      _sectionPadding,
                      90,
                      _sectionPadding,
                    ),
                    child: viewModel.recurrenceInterval ==
                            EventIntervals.monthly
                        ? Row(
                            children: [
                              RecurrenceFrequencyDropdown(
                                model: viewModel,
                                options: [
                                  monthlyOptions[0],
                                  if (RecurrenceUtils
                                          .getWeekDayOccurenceInMonth(
                                        widget.model.eventStartDate,
                                      ) !=
                                      5)
                                    monthlyOptions[1],
                                  if (RecurrenceUtils.isLastOccurenceOfWeekDay(
                                    widget.model.eventStartDate,
                                  ))
                                    monthlyOptions[2],
                                ],
                                selectedOption: monthlyOptions[0],
                                onSelected: (String value) {
                                  Set<String>? tempWeekDays;
                                  int? tempWeekDayOccurenceInMonth;
                                  if (value == monthlyOptions[0]) {
                                    tempWeekDays = null;
                                    tempWeekDayOccurenceInMonth = null;
                                  } else if (value == monthlyOptions[1]) {
                                    tempWeekDays = {
                                      RecurrenceUtils.weekDays[
                                          widget.model.eventStartDate.weekday],
                                    };
                                    tempWeekDayOccurenceInMonth =
                                        RecurrenceUtils
                                            .getWeekDayOccurenceInMonth(
                                      widget.model.eventStartDate,
                                    );
                                  } else {
                                    tempWeekDays = {
                                      RecurrenceUtils.weekDays[
                                          widget.model.eventStartDate.weekday],
                                    };
                                    tempWeekDayOccurenceInMonth = -1;
                                  }
                                  setState(() {
                                    viewModel.frequency = Frequency.monthly;
                                    viewModel.recurrenceLabel = value;
                                    viewModel.weekDays = tempWeekDays;
                                    viewModel.weekDayOccurenceInMonth =
                                        tempWeekDayOccurenceInMonth;
                                  });
                                },
                              ),
                            ],
                          )
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              inputFieldHeading('Repeats on'),
                              CustomWeekDaySelector(
                                model: viewModel,
                              ),
                            ],
                          ),
                  ),
                  buildCustomDivider(context),
                ],
              ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:
                  EdgeInsets.only(top: _sectionPadding, left: _sectionPadding),
              child: inputFieldHeading('Ends'),
            ),
            EventEndOptions(
              model: viewModel,
            ),
          ],
        ),
      ],
    );
  }

  /// Input Fields of repeats every section.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  /// * `Row`: Row of Custom input fields.
  Row _section1InputFields() {
    return Row(
      children: [
        SizedBox(
          width: SizeConfig.screenWidth! * 0.15,
          child: CustomTextField(
            key: const Key('inputsection1TextField'),
            maxTextLength: 2,
            textEditingController: viewModel.repeatsEveryCountController,
          ),
        ),
        SizedBox(
          width: SizeConfig.screenWidth! * 0.03,
        ),
        RecurrenceFrequencyDropdown(
          model: viewModel,
          options: [
            EventIntervals.daily,
            EventIntervals.weekly,
            EventIntervals.monthly,
            EventIntervals.yearly,
          ],
          selectedOption: viewModel.recurrenceInterval,
          onSelected: (String value) {
            switch (value) {
              case EventIntervals.daily:
                updateModel(Frequency.daily, value, null, null);
                break;
              case EventIntervals.weekly:
                updateModel(Frequency.weekly, value, null, null);
                break;
              case EventIntervals.monthly:
                updateModel(Frequency.monthly, value, null, null);
                break;
              case EventIntervals.yearly:
                updateModel(Frequency.yearly, value, null, null);
                break;
              default:
                updateModel(Frequency.weekly, value, null, null);
                break;
            }
          },
        ),
      ],
    );
  }

  /// Custom heading for input fields.
  ///
  /// **params**:
  /// * `title`: Text displayed as heading.
  ///
  /// **returns**:
  /// * `Container`: Container containing the heading text.
  Container inputFieldHeading(String title) => Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title),
            const SizedBox(
              height: 12,
            ),
          ],
        ),
      );

  /// Divider with custom properties.
  ///
  /// **params**:
  /// * `context`: BuildContext of the widget.
  ///
  /// **returns**:
  /// * `Divider`: Custom divider.
  Divider buildCustomDivider(BuildContext context) {
    return Divider(
      color: Theme.of(context).hintColor,
    );
  }

  /// Determines whether the recurrence frequency is daily or yearly.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  /// * `bool`: A boolean value indicating whether the recurrence frequency is daily or yearly.
  bool recurrenceisDailyorYearly() {
    final widgetModel = viewModel;
    return widgetModel.recurrenceInterval == EventIntervals.daily ||
        widgetModel.recurrenceInterval == EventIntervals.yearly;
  }

  /// Returns the updated model with the selected recurrence options.
  ///
  /// **params**:
  /// * `frequency`: represent the frequency of the event.
  /// * `value`: represent the interval of the event.
  /// * `weekDayOccurenceInMonth`: represent the week day occurence in month.
  /// * `weekDays`: represent the list of week days.
  ///
  /// **returns**:
  ///   None
  void updateModel(
    String frequency,
    String value,
    int? weekDayOccurenceInMonth,
    Set<String>? weekDays,
  ) {
    setState(() {
      widget.model.frequency = frequency;
      widget.model.recurrenceInterval = value;
      widget.model.weekDayOccurenceInMonth = weekDayOccurenceInMonth;
      widget.model.weekDays = weekDays;
    });
  }
}
