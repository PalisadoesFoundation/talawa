import 'package:flutter/material.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/widgets/create_recurring_event_helper_widgets.dart';
import 'package:talawa/widgets/custom_weekday_selector.dart';

/// custom padding.
final _sectionPadding = SizeConfig.blockSizeHorizontal! * 8;

/// Enables users to define their customRecurrence event.
class CustomRecurrencePage extends StatelessWidget {
  CustomRecurrencePage({super.key});

  final TextEditingController _repeatFrequencyTextController =
      TextEditingController();

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
            onPressed: () {},
            child: const Text('Done'),
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
        buildCustomDivider(context),
        Container(
          padding: EdgeInsets.fromLTRB(
            _sectionPadding,
            _sectionPadding,
            90,
            _sectionPadding,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              inputFieldHeading('Repeats on'),
              CustomWeekDaySelector(),
            ],
          ),
        ),
        buildCustomDivider(context),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:
                  EdgeInsets.only(top: _sectionPadding, left: _sectionPadding),
              child: inputFieldHeading('Ends'),
            ),
            const EventEndOptions(),
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
            textEditingController: _repeatFrequencyTextController,
          ),
        ),
        SizedBox(
          width: SizeConfig.screenWidth! * 0.03,
        ),
        CustomRectangle(
          child: Container(
            padding: const EdgeInsets.all(12),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment
                    .center, // Align the row's contents to the center horizontally
                children: [
                  RecurrenceFrequencyDropdown(),
                ],
              ),
            ),
          ),
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
}
