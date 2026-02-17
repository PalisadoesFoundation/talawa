import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:talawa/constants/recurrence_utils.dart';
import 'package:talawa/constants/recurrence_values.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/view_model/after_auth_view_models/event_view_models/base_event_view_model.dart';
import 'package:talawa/widgets/recurring_event_helper_widgets.dart';

/// custom padding.
final _sectionPadding = SizeConfig.blockSizeHorizontal! * 8;

/// Widget to build custom recurrence page for editing events.
class CustomRecurringEvent extends StatefulWidget {
  const CustomRecurringEvent({super.key, required this.model});

  /// Instance of base event view model.
  final BaseEventViewModel model;

  @override
  State<CustomRecurringEvent> createState() => _CustomRecurringEventState();
}

class _CustomRecurringEventState extends State<CustomRecurringEvent> {
  /// Instance of Base event view model.
  late BaseEventViewModel viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = widget.model;
    _countController = TextEditingController(
      text: viewModel.count?.toString() ?? "10",
    );
  }

  late final TextEditingController _countController;

  @override
  void dispose() {
    _countController.dispose();
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
            onPressed: _saveAndClose,
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

  /// Validates inputs, saves changes and closes the dialog.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  ///   None
  void _saveAndClose() {
    viewModel.updateRecurrenceLabel();

    // Validate and update data before navigation
    final intervalText = viewModel.repeatsEveryCountController.text;

    // Parse and validate interval
    int parsedInterval = 1;
    try {
      parsedInterval = int.parse(intervalText);
      if (parsedInterval <= 0) parsedInterval = 1;
    } catch (e) {
      parsedInterval = 1;
      viewModel.repeatsEveryCountController.text = '1';
    }
    if (viewModel.eventEndType == EventEndTypes.never) {
      viewModel.recurrenceEndDate = null;
      viewModel.count = null;
      viewModel.never = true;
    } else if (viewModel.eventEndType == EventEndTypes.on) {
      viewModel.count = null;
      viewModel.never = false;
    } else if (viewModel.eventEndType == EventEndTypes.after) {
      viewModel.never = false;
    }

    // Update interval
    viewModel.interval = parsedInterval;

    // Update recurrence label with all the complex properties
    viewModel.updateRecurrenceLabel();

    // Ensure isRecurring is set to true
    viewModel.isRecurring = true;

    viewModel.navigateBack();
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
        // Frequency selector
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
        Divider(color: Theme.of(context).hintColor),

        // Frequency-specific options
        if (viewModel.frequency == Frequency.weekly)
          _buildWeeklyOptions(context)
        else if (viewModel.frequency == Frequency.monthly)
          _buildMonthlyOptions(context)
        else if (viewModel.frequency == Frequency.yearly)
          _buildYearlyOptions(context),

        // Always show divider between frequency options and end options
        Divider(color: Theme.of(context).hintColor),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:
                  EdgeInsets.only(top: _sectionPadding, left: _sectionPadding),
              child: inputFieldHeading('Ends'),
            ),
            _buildEventEndOptions(),
          ],
        ),
      ],
    );
  }

  /// Custom weekday selector for EditEvent.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  /// * `Widget`: Widget containing the custom weekday selector.
  Widget _buildCustomWeekDaySelector() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: SizeConfig.blockSizeVertical!),
      child: Wrap(
        children: List.generate(
          days.length,
          (index) => Container(
            margin: const EdgeInsets.all(4),
            child: FilterChip(
              selected: viewModel.weekDays.contains(days[index]),
              label: Text(days[index].substring(0, 2)),
              onSelected: (bool selected) {
                setState(() {
                  if (selected) {
                    viewModel.weekDays.add(days[index]);
                  } else {
                    viewModel.weekDays.remove(days[index]);
                  }
                });
              },
            ),
          ),
        ),
      ),
    );
  }

  /// Custom weekday selector for EditEvent.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  /// * `Widget`: Widget containing the custom weekday selector.
  Widget _buildEventEndOptions() {
    return Column(
      children: [
        RadioListTile<String>(
          title: const Text(EventEndTypes.never),
          value: EventEndTypes.never,
          groupValue: viewModel.eventEndType,
          onChanged: (value) {
            setState(() {
              viewModel.setEventEndType(EventEndTypes.never);
              viewModel.updateRecurrenceLabel();
            });
          },
        ),
        RadioListTile<String>(
          title: Row(
            children: [
              const Text(EventEndTypes.on),
              const SizedBox(width: 8),
              InkWell(
                onTap: viewModel.eventEndType == EventEndTypes.on
                    ? () async {
                        final date = await showDatePicker(
                          context: context,
                          initialDate: viewModel.recurrenceEndDate ??
                              DateTime.now().add(const Duration(days: 30)),
                          firstDate: DateTime.now(),
                          lastDate:
                              DateTime.now().add(const Duration(days: 365 * 5)),
                        );
                        if (date != null) {
                          if (!mounted) return;
                          setState(() {
                            viewModel.recurrenceEndDate = date;
                          });
                        }
                      }
                    : null,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    viewModel.recurrenceEndDate != null
                        ? DateFormat("MMM d, yyyy")
                            .format(viewModel.recurrenceEndDate!)
                        : 'Select Date',
                  ),
                ),
              ),
            ],
          ),
          value: EventEndTypes.on,
          groupValue: viewModel.eventEndType,
          onChanged: (value) {
            setState(() {
              viewModel.setEventEndType(EventEndTypes.on);
              viewModel.updateRecurrenceLabel();
            });
          },
        ),
        RadioListTile<String>(
          title: Row(
            children: [
              const Text(EventEndTypes.after),
              const SizedBox(width: 8),
              SizedBox(
                width: 60,
                child: TextField(
                  enabled: viewModel.eventEndType == EventEndTypes.after,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.symmetric(horizontal: 8),
                  ),
                  controller: _countController,
                  onChanged: (value) {
                    final int? parsed = int.tryParse(value);
                    if (parsed != null && parsed > 0) {
                      setState(() {
                        viewModel.count = parsed;
                      });
                    }
                  },
                ),
              ),
              const SizedBox(width: 8),
              const Text('occurrences'),
            ],
          ),
          value: EventEndTypes.after,
          groupValue: viewModel.eventEndType,
          onChanged: (value) {
            setState(() {
              viewModel.setEventEndType(EventEndTypes.after);
              _countController.text = viewModel.count?.toString() ?? '10';
              viewModel.updateRecurrenceLabel();
            });
          },
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
    final frequencyOptions = {
      Frequency.daily: 'daily',
      Frequency.weekly: 'weekly',
      Frequency.monthly: 'monthly',
      Frequency.yearly: 'yearly',
    };

    return Row(
      children: [
        SizedBox(
          width: SizeConfig.screenWidth! * 0.15,
          child: CustomTextField(
            maxTextLength: 2,
            textEditingController: viewModel.repeatsEveryCountController,
          ),
        ),
        SizedBox(
          width: SizeConfig.screenWidth! * 0.03,
        ),
        _buildFrequencyDropdown(frequencyOptions),
      ],
    );
  }

  /// Build custom frequency dropdown.
  ///
  /// **params**:
  /// * `frequencyOptions`: Map of frequency options with keys as frequency values and values as display text.
  ///
  /// **returns**:
  /// * `Widget`: Widget containing the custom frequency dropdown.
  Widget _buildFrequencyDropdown(Map<String, String> frequencyOptions) {
    return CustomRectangle(
      child: Container(
        padding: const EdgeInsets.all(12),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              PopupMenuButton<String>(
                offset: const Offset(0, 40),
                itemBuilder: (BuildContext context) {
                  return <PopupMenuEntry<String>>[
                    for (int i = 0; i < frequencyOptions.values.length; i++)
                      PopupMenuItem<String>(
                        value: frequencyOptions.values.elementAt(i),
                        child: Text(frequencyOptions.values.elementAt(i)),
                      ),
                  ];
                },
                onSelected: (String value) {
                  // Find the frequency for the selected display value
                  final selectedFrequency = frequencyOptions.entries
                      .firstWhere((entry) => entry.value == value)
                      .key;

                  setState(() {
                    // Store the previous frequency to handle transitions
                    final previousFrequency = viewModel.frequency;
                    viewModel.frequency = selectedFrequency;

                    // Initialize appropriate defaults based on the selected frequency
                    _initializeFrequencyDefaults(
                      previousFrequency,
                      selectedFrequency,
                    );
                  });
                },
                tooltip: 'Select option',
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      frequencyOptions[viewModel.frequency]!,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const Icon(Icons.arrow_drop_down),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
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

  /// Builds options specific to weekly recurrence.
  ///
  /// **params**:
  /// * `context`: BuildContext of the widget.
  ///
  /// **returns**:
  /// * `Widget`: Container with weekly recurrence options.
  Widget _buildWeeklyOptions(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(_sectionPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              inputFieldHeading('Repeats on'),
              _buildCustomWeekDaySelector(),
            ],
          ),
        ),
      ],
    );
  }

  /// Builds options specific to monthly recurrence.
  ///
  /// **params**:
  /// * `context`: BuildContext of the widget.
  ///
  /// **returns**:
  /// * `Widget`: Container with monthly recurrence options.
  Widget _buildMonthlyOptions(BuildContext context) {
    // Get current day of month and day of week from event start date
    final dayOfMonth = viewModel.eventStartDate.day;
    final dayOfWeek = viewModel.eventStartDate.weekday;

    // Calculate the position (1st, 2nd, 3rd, etc.)
    final weekPosition =
        RecurrenceUtils.getWeekDayOccurrenceInMonth(viewModel.eventStartDate);

    // Check if this is the last occurrence
    final isLastOccurrence =
        RecurrenceUtils.isLastOccurrenceOfWeekDay(viewModel.eventStartDate);

    // Convert weekday to the correct format
    final Map<int, String> weekdayToCode = {
      DateTime.monday: WeekDays.monday,
      DateTime.tuesday: WeekDays.tuesday,
      DateTime.wednesday: WeekDays.wednesday,
      DateTime.thursday: WeekDays.thursday,
      DateTime.friday: WeekDays.friday,
      DateTime.saturday: WeekDays.saturday,
      DateTime.sunday: WeekDays.sunday,
    };

    return Container(
      padding: EdgeInsets.all(_sectionPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          inputFieldHeading('Monthly options'),
          const SizedBox(height: 8),

          // Day of month option
          RadioListTile<bool>(
            title: Text('On day $dayOfMonth of the month'),
            value: false,
            groupValue: viewModel.useDayOfWeekMonthly,
            onChanged: (value) {
              setState(() {
                viewModel.useDayOfWeekMonthly = false;
                viewModel.byMonthDay = [dayOfMonth];
                viewModel.weekDays = {};
                viewModel.weekDayOccurrenceInMonth = null;
                viewModel.byPosition = null;
              });
            },
          ),

          // Day of week option
          RadioListTile<bool>(
            title: Text(
              'On the ${isLastOccurrence ? 'last' : ordinal(weekPosition)} ${weekdayToCode[dayOfWeek]} of the month',
            ),
            value: true,
            groupValue: viewModel.useDayOfWeekMonthly,
            onChanged: (value) {
              setState(() {
                viewModel.useDayOfWeekMonthly = true;
                viewModel.byMonthDay = null;
                viewModel.weekDays = {weekdayToCode[dayOfWeek]!};
                viewModel.weekDayOccurrenceInMonth =
                    isLastOccurrence ? -1 : weekPosition;
                viewModel.byPosition = isLastOccurrence ? -1 : weekPosition;
              });
            },
          ),
        ],
      ),
    );
  }

  /// Builds options specific to yearly recurrence.
  ///
  /// **params**:
  /// * `context`: BuildContext of the widget.
  ///
  /// **returns**:
  /// * `Widget`: Container with yearly recurrence options.
  Widget _buildYearlyOptions(BuildContext context) {
    final monthIndex = viewModel.eventStartDate.month - 1;
    final dayOfMonth = viewModel.eventStartDate.day;
    final dayOfWeek = viewModel.eventStartDate.weekday;

    // Calculate the position (1st, 2nd, 3rd, etc.)
    final weekPosition =
        RecurrenceUtils.getWeekDayOccurrenceInMonth(viewModel.eventStartDate);

    // Check if this is the last occurrence
    final isLastOccurrence =
        RecurrenceUtils.isLastOccurrenceOfWeekDay(viewModel.eventStartDate);

    // Get month name
    final monthName = monthNames[monthIndex];

    // Convert weekday to correct format
    final Map<int, String> weekdayToCode = {
      DateTime.monday: WeekDays.monday,
      DateTime.tuesday: WeekDays.tuesday,
      DateTime.wednesday: WeekDays.wednesday,
      DateTime.thursday: WeekDays.thursday,
      DateTime.friday: WeekDays.friday,
      DateTime.saturday: WeekDays.saturday,
      DateTime.sunday: WeekDays.sunday,
    };

    return Container(
      padding: EdgeInsets.all(_sectionPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          inputFieldHeading('Yearly options'),
          const SizedBox(height: 8),

          // Month and day option
          RadioListTile<bool>(
            title: Text('On $monthName $dayOfMonth'),
            value: false,
            groupValue: viewModel.useDayOfWeekYearly,
            onChanged: (value) {
              setState(() {
                viewModel.useDayOfWeekYearly = false;
                viewModel.byMonthDay = [dayOfMonth];
                viewModel.byMonth = [viewModel.eventStartDate.month];
                viewModel.weekDays = {};
                viewModel.weekDayOccurrenceInMonth = null;
                viewModel.byPosition = null;
              });
            },
          ),

          // Month, position and day of week option
          RadioListTile<bool>(
            title: Text(
              'On the ${isLastOccurrence ? 'last' : ordinal(weekPosition)} ${weekdayToCode[dayOfWeek]} of $monthName',
            ),
            value: true,
            groupValue: viewModel.useDayOfWeekYearly,
            onChanged: (value) {
              setState(() {
                viewModel.useDayOfWeekYearly = true;
                viewModel.byMonthDay = null;
                viewModel.byMonth = [viewModel.eventStartDate.month];
                viewModel.weekDays = {weekdayToCode[dayOfWeek]!};
                viewModel.weekDayOccurrenceInMonth =
                    isLastOccurrence ? -1 : weekPosition;
                viewModel.byPosition = isLastOccurrence ? -1 : weekPosition;
              });
            },
          ),
        ],
      ),
    );
  }

  /// Returns the ordinal representation of a number (1st, 2nd, 3rd, etc.).
  ///
  /// **params**:
  /// * `number`: The number to convert to ordinal.
  ///
  /// **returns**:
  /// * `String`: The ordinal representation of the number.
  String ordinal(int number) {
    if (number <= 0) return '';
    if (number > 3 && number < 21) return '${number}th'; // 4th to 20th
    switch (number % 10) {
      case 1:
        return '${number}st';
      case 2:
        return '${number}nd';
      case 3:
        return '${number}rd';
      default:
        return '${number}th';
    }
  }

  /// Initialize appropriate defaults based on the selected frequency.
  ///
  /// **params**:
  /// * `previousFrequency`: The previous frequency value.
  /// * `newFrequency`: The newly selected frequency value.
  ///
  /// **returns**:
  ///   None
  void _initializeFrequencyDefaults(
    String previousFrequency,
    String newFrequency,
  ) {
    // Reset all pattern-specific fields
    viewModel.weekDays = {};
    viewModel.byMonthDay = null;
    viewModel.byMonth = null;
    viewModel.weekDayOccurrenceInMonth = null;
    viewModel.useDayOfWeekMonthly = false;
    viewModel.useDayOfWeekYearly = false;
    viewModel.byPosition = null;

    // Initialize pattern-specific defaults
    switch (newFrequency) {
      case Frequency.daily:
        // Daily frequency doesn't use weekDays
        viewModel.weekDays = {};

      case Frequency.weekly:
        // For weekly, initialize with the current day of week
        final weekday = viewModel.eventStartDate.weekday;
        final Map<int, String> weekdayToCode = {
          DateTime.monday: WeekDays.monday,
          DateTime.tuesday: WeekDays.tuesday,
          DateTime.wednesday: WeekDays.wednesday,
          DateTime.thursday: WeekDays.thursday,
          DateTime.friday: WeekDays.friday,
          DateTime.saturday: WeekDays.saturday,
          DateTime.sunday: WeekDays.sunday,
        };
        viewModel.weekDays = {weekdayToCode[weekday]!};

      case Frequency.monthly:
        // For monthly, default to day of month (e.g., "15th of each month")
        final dayOfMonth = viewModel.eventStartDate.day;
        viewModel.byMonthDay = [dayOfMonth];

      case Frequency.yearly:
        // For yearly, default to month and day (e.g., "January 15")
        final dayOfMonth = viewModel.eventStartDate.day;
        final month = viewModel.eventStartDate.month;
        viewModel.byMonthDay = [dayOfMonth];
        viewModel.byMonth = [month];
    }
  }
}
