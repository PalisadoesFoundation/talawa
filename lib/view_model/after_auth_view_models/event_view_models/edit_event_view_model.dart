import 'package:flutter/material.dart';
import 'package:talawa/constants/recurrence_utils.dart';
import 'package:talawa/constants/recurrence_values.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/models/events/event_model.dart';
import 'package:talawa/view_model/after_auth_view_models/event_view_models/base_event_view_model.dart';
import 'package:talawa/view_model/after_auth_view_models/event_view_models/event_calendar_view_model.dart';
import 'package:talawa/widgets/custom_progress_dialog.dart';

/// EditEventViewModel class have methods to interact with model in.
///
/// the context of editing the event in the organization.
///
/// Methods include:
/// * `updateEvent` : to update an event.
class EditEventViewModel extends BaseEventViewModel {
  // Variable to hold the event details.
  late Event _event;

  /// Reference to the EventCalendarViewModel for calendar interactions.
  final calendarViewModel = locator<EventCalendarViewModel>();

  /// Event ID.
  String? eventId;

  /// Original recurrence state.
  bool wasRecurringOriginally = false;

  /// Method to initialize the event and fill the edit form.
  ///
  /// **params**:
  /// * `event`: An instance of `Event` that contains the details to initialize and fill the form.
  ///
  /// **returns**:
  ///   None
  void initialize(Event event) {
    _event = event;
    eventId = event.id;
    wasRecurringOriginally =
        event.recurring ?? false || event.recurrenceRule != null;
    _fillEditForm();
  }

  /// Method to populate the form fields with data from the provided event.
  ///
  /// This method initializes the text controllers and switches with values
  /// from the `_event` instance. It also parses and sets the event's start and
  /// end date and time.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  ///   None
  void _fillEditForm() {
    try {
      // Basic info
      eventTitleTextController.text = _event.name ?? '';
      eventLocationTextController.text = _event.location ?? '';
      eventDescriptionTextController.text = _event.description ?? '';
      isPublicSwitch = _event.isPublic ?? true;
      isRegisterableSwitch = _event.isRegisterable ?? true;
      isAllDay = _event.allDay ?? false;

      // Date handling - simplify to ensure we get proper dates
      if (_event.startAt != null) {
        eventStartDate = DateTime(
          _event.startAt!.year,
          _event.startAt!.month,
          _event.startAt!.day,
        );

        // Set time
        eventStartTime = TimeOfDay(
          hour: _event.startAt!.hour,
          minute: _event.startAt!.minute,
        );
      } else {
        eventStartDate = DateTime.now();
        eventStartTime = TimeOfDay.now();
      }

      if (_event.endAt != null) {
        eventEndDate = DateTime(
          _event.endAt!.year,
          _event.endAt!.month,
          _event.endAt!.day,
        );

        // Set time
        eventEndTime = TimeOfDay(
          hour: _event.endAt!.hour,
          minute: _event.endAt!.minute,
        );
      } else {
        // Default end date/time if not available
        final now = DateTime.now();
        eventEndDate = now;
        eventEndTime = TimeOfDay(
          hour: (now.hour + 1) % 24,
          minute: now.minute,
        );
      }
    } catch (e) {
      // Fallback to safe defaults
      final now = DateTime.now();
      eventStartDate = now;
      eventStartTime = TimeOfDay.now();
      eventEndDate = now;
      eventEndTime = TimeOfDay(
        hour: (now.hour + 1) % 24,
        minute: now.minute,
      );
    }
    isRecurring = _event.recurring ?? false || _event.recurrenceRule != null;
    initializeRecurrenceData();
    notifyListeners();
  }

  /// Initialize recurrence data from event.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  ///   None
  void initializeRecurrenceData() {
    if (_event.recurrenceRule != null) {
      final rule = _event.recurrenceRule!;
      frequency = rule.frequency;
      interval = rule.interval ?? 1;
      repeatsEveryCountController.text = '$interval';

      // Handle byDay - check if it contains position indicators (e.g., "1MO", "2TU")
      if (rule.byDay != null) {
        final List<String> byDayList = rule.byDay!;

        // Process position indicators in byDay
        if (byDayList.isNotEmpty && byDayList[0].length > 2) {
          // Extract position and day code
          final firstByDay = byDayList[0];
          final dayCode = firstByDay.substring(firstByDay.length - 2);
          final posStr = firstByDay.substring(0, firstByDay.length - 2);
          byPosition = int.tryParse(posStr);

          // Add the weekday without position
          final weekDaysToAdd =
              RecurrenceUtils.convertShortCodesToWeekDays([dayCode]);
          weekDays = weekDaysToAdd;

          // Enable appropriate position mode based on frequency
          if (frequency == Frequency.monthly) {
            useDayOfWeekMonthly = true;
          } else if (frequency == Frequency.yearly) {
            useDayOfWeekYearly = true;
          }
        } else {
          // Normal weekdays without position
          weekDays = RecurrenceUtils.convertShortCodesToWeekDays(byDayList);
        }
      }

      // Handle other recurrence properties
      count = rule.count;
      byMonthDay = rule.byMonthDay;
      byMonth = rule.byMonth;
      recurrenceEndDate = rule.recurrenceEndDate;
      never = rule.never ?? true;

      // Set end type based on available data
      if (never) {
        eventEndType = EventEndTypes.never;
      } else if (count != null) {
        eventEndType = EventEndTypes.after;
      } else if (recurrenceEndDate != null) {
        eventEndType = EventEndTypes.on;
      }

      // Determine if we should use day-of-week vs. day-of-month
      if (frequency == Frequency.monthly) {
        // If byDay exists, we're using day-of-week pattern
        useDayOfWeekMonthly = rule.byDay != null && rule.byDay!.isNotEmpty;
      } else if (frequency == Frequency.yearly) {
        // If byDay exists, we're using day-of-week pattern
        useDayOfWeekYearly = rule.byDay != null && rule.byDay!.isNotEmpty;
      }

      updateRecurrenceLabel();
    } else {
      resetRecurrenceSettings();
    }
  }

  @override
  Future<void> execute() async {
    try {
      final startDateTime = combineDateTime(eventStartDate, eventStartTime);
      final endDateTime = combineDateTime(eventEndDate, eventEndTime);
      final bool isRecurrenceSettingsEdit = _isRecurrenceSettingsEdited();
      String recurrenceType;
      if (wasRecurringOriginally) {
        if (isRecurring) {
          recurrenceType = await _showRecurrenceUpdateOptionDialog(
                isRecurrenceSettingsEdit: isRecurrenceSettingsEdit,
              ) ??
              'standalone';
        } else {
          recurrenceType = 'single';
        }
      } else {
        recurrenceType = 'standalone';
      }
      final Map<String, dynamic> variables = {
        'id': eventId,
      };

      if (eventTitleTextController.text != _event.name) {
        variables['name'] = eventTitleTextController.text;
      }

      if (eventDescriptionTextController.text != _event.description) {
        variables['description'] = eventDescriptionTextController.text;
      }

      if (eventLocationTextController.text != _event.location) {
        variables['location'] = eventLocationTextController.text;
      }

      if (isPublicSwitch != _event.isPublic) {
        variables['isPublic'] = isPublicSwitch;
      }

      if (isRegisterableSwitch != _event.isRegisterable) {
        variables['isRegisterable'] = isRegisterableSwitch;
      }

      if (isAllDay != _event.allDay) {
        variables['allDay'] = isAllDay;
      }

      // Get the original start and end dates for comparison
      final originalStartAt = _event.startAt?.toUtc().toIso8601String() ?? '';
      final originalEndAt = _event.endAt?.toUtc().toIso8601String() ?? '';

      // Only include timing changes if they actually changed
      final newStartAt = startDateTime.toUtc().toIso8601String();
      if (newStartAt != originalStartAt) {
        variables['startAt'] = newStartAt;
      }

      final newEndAt = endDateTime.toUtc().toIso8601String();
      if (newEndAt != originalEndAt) {
        variables['endAt'] = newEndAt;
      }

      final bool hasRecurrenceChanged = isRecurring != wasRecurringOriginally;

      // Handle recurrence data based on event type:
      if (wasRecurringOriginally) {
        // For previously recurring events
        if (isRecurring) {
          // Include recurrence data if:
          // 1. We're using thisAndFollowing option, or
          // 2. We're changing from non-recurring to recurring
          if (recurrenceType == 'thisAndFollowing' || hasRecurrenceChanged) {
            final recurrenceData = RecurrenceUtils.buildRecurrenceData(
              frequency: frequency,
              interval: interval,
              weekDays: weekDays,
              eventStartDate: eventStartDate,
              byMonthDay: byMonthDay,
              byMonth: byMonth,
              count: count,
              recurrenceEndDate: recurrenceEndDate,
              never: never,
              eventEndType: eventEndType,
              byPosition: byPosition,
              useDayOfWeekMonthly: useDayOfWeekMonthly,
              useDayOfWeekYearly: useDayOfWeekYearly,
            );
            if (recurrenceData.isNotEmpty) {
              variables['recurrence'] = recurrenceData;
            }
          }
        } else {
          // Changed from recurring to non-recurring
          variables['recurring'] = false;
        }
      } else if (isRecurring) {
        // For standalone events being made recurring
        variables['recurring'] = true;
        final recurrenceData = RecurrenceUtils.buildRecurrenceData(
          frequency: frequency,
          interval: interval,
          weekDays: weekDays,
          eventStartDate: eventStartDate,
          byMonthDay: byMonthDay,
          byMonth: byMonth,
          count: count,
          recurrenceEndDate: recurrenceEndDate,
          never: never,
          eventEndType: eventEndType,
          byPosition: byPosition,
          useDayOfWeekMonthly: useDayOfWeekMonthly,
          useDayOfWeekYearly: useDayOfWeekYearly,
        );
        if (recurrenceData.isNotEmpty) {
          variables['recurrence'] = recurrenceData;
        }
      }
      // For non-recurring events that were never recurring, don't include recurrence data

      // Check if there are any changes to update (aside from the ID)
      if (variables.length <= 1) {
        navigationService.showSnackBar('No changes to update');
        return;
      }

      navigationService.pushDialog(
        const CustomProgressDialog(),
      );

      final result = await eventService.editEvent(
        variables: variables,
        recurrenceType: recurrenceType,
      );
      navigationService.pop();
      if (result.hasException || result.data == null) {
        throw Exception('Event update failed: ${result.exception}');
      }
      navigationService.showSnackBar('Event updated successfully');
      calendarViewModel.refreshCurrentViewEvents();
      navigationService.pop();
      navigationService.pop();

      return;
    } catch (e) {
      navigationService.pop();
      navigationService
          .showSnackBar('An error occurred while updating the event');
      return;
    }
  }

  /// Shows a dialog for updating a recurring event with options.
  ///
  /// **params**:
  /// * `isRecurrenceSettingsEdit`: Whether recurrence settings are being edited
  ///
  /// **returns**:
  /// * `Future<String?>`: Selected recurrence update type
  Future<String?> _showRecurrenceUpdateOptionDialog({
    required bool isRecurrenceSettingsEdit,
  }) {
    return showDialog<String>(
      context: navigationService.navigatorKey.currentContext!,
      builder: (context) => AlertDialog(
        title: const Text('Update Recurring Event'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('How would you like to update this event?'),
            const SizedBox(height: 16),
            if (!isRecurrenceSettingsEdit) ...[
              _buildUpdateOption(context, 'Update this event only', 'single'),
              const SizedBox(height: 8),
            ],
            _buildUpdateOption(
              context,
              'Update this and all future events',
              'thisAndFollowing',
            ),
            if (!isRecurrenceSettingsEdit) ...[
              const SizedBox(height: 8),
              _buildUpdateOption(
                context,
                'Update all events in the series',
                'series',
              ),
            ],
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(null),
            child: const Text('Cancel'),
          ),
        ],
      ),
    );
  }

  /// Builds an update option button for recurring events.
  ///
  /// **params**:
  /// * `context`: Build context
  /// * `text`: Display text for the option
  /// * `value`: Value to return when selected
  ///
  /// **returns**:
  /// * `Widget`: A button widget for the update option
  Widget _buildUpdateOption(BuildContext context, String text, String value) {
    return InkWell(
      onTap: () => Navigator.of(context).pop(value),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        decoration: BoxDecoration(
          border: Border.all(color: Theme.of(context).dividerColor),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(text),
      ),
    );
  }

  /// Checks if recurrence settings are being edited.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  /// * `bool`: True if any recurrence settings were changed
  bool _isRecurrenceSettingsEdited() {
    // Check if recurrence status has changed
    if (isRecurring != wasRecurringOriginally) {
      return true;
    }

    // If the event is now recurring, check for changes to recurrence settings
    if (isRecurring) {
      final recurrenceRule = _event.recurrenceRule;

      // If it had no recurrence rule before, any recurrence is a change
      if (recurrenceRule == null) {
        return true;
      }

      // Check for changes in frequency
      if (frequency != recurrenceRule.frequency) {
        return true;
      }

      // Check for changes in interval
      if (interval != (recurrenceRule.interval ?? 1)) {
        return true;
      }

      // Check for changes in weekdays
      if (recurrenceRule.byDay != null) {
        final originalWeekDays =
            RecurrenceUtils.convertShortCodesToWeekDays(recurrenceRule.byDay!);
        if (weekDays.difference(originalWeekDays).isNotEmpty ||
            originalWeekDays.difference(weekDays).isNotEmpty) {
          return true;
        }
      } else if (weekDays.isNotEmpty) {
        return true;
      }

      // Check for changes in count
      if (count != recurrenceRule.count) {
        return true;
      }

      // Check for changes in end date
      final originalEndDate = recurrenceRule.recurrenceEndDate;
      if ((recurrenceEndDate == null && originalEndDate != null) ||
          (recurrenceEndDate != null && originalEndDate == null) ||
          (recurrenceEndDate != null &&
              originalEndDate != null &&
              recurrenceEndDate!.difference(originalEndDate).inDays != 0)) {
        return true;
      }

      // Check for changes in never ending flag
      if (never != (recurrenceRule.never ?? true)) {
        return true;
      }
    }

    // No recurrence changes detected
    return false;
  }
}
