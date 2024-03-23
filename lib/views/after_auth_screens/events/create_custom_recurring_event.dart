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
  Widget build(BuildContext context) {
    viewModel = widget.model;
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
              if (viewModel.eventEndType == EventEndTypes.never) {
                viewModel.setEventEndDate(null);
              } else if (viewModel.eventEndType == EventEndTypes.on) {
                viewModel.eventEndDate = viewModel.eventEndOnEndDate;
              } else if (viewModel.eventEndType == EventEndTypes.after) {
                viewModel.recurranceCount =
                    int.parse(viewModel.endOccurenceController.text);
              }
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
                    child: viewModel.recurranceFrequency == Recurrance.monthly
                        ? Row(
                            children: [
                              RecurrenceFrequencyDropdown(
                                model: viewModel,
                                options: [
                                  'Monthly on day 3',
                                  'Monthly on the first Sunday',
                                ],
                                selectedOption: viewModel.monthlyRecurrence,
                                onSelected: (String value) {
                                  setState(() {
                                    viewModel.monthlyRecurrence = value;
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
            Recurrance.daily,
            Recurrance.weekly,
            Recurrance.monthly,
            Recurrance.yearly,
          ],
          selectedOption: viewModel.recurranceFrequency,
          onSelected: (String value) {
            setState(() {
              viewModel.recurranceFrequency = value;
            });
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
    return widgetModel.recurranceFrequency == Recurrance.daily ||
        widgetModel.recurranceFrequency == Recurrance.yearly;
  }
}
