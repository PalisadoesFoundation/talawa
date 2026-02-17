import 'dart:io';

import 'package:flutter/material.dart';
import 'package:talawa/constants/recurrence_utils.dart';
import 'package:talawa/constants/recurrence_values.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/models/organization/org_info.dart';
import 'package:talawa/services/event_service.dart';
import 'package:talawa/services/third_party_service/multi_media_pick_service.dart';
import 'package:talawa/services/user_config.dart';
import 'package:talawa/utils/validators.dart';
import 'package:talawa/view_model/base_view_model.dart';
import 'package:talawa/widgets/date_time_picker.dart';

/// Base class for event view models with common recurrence functionality.
abstract class BaseEventViewModel extends BaseModel {
  /// Constructor to initialize controllers and focus nodes.
  BaseEventViewModel() {
    eventTitleTextController = TextEditingController();
    eventLocationTextController = TextEditingController();
    eventDescriptionTextController = TextEditingController();
    repeatsEveryCountController = TextEditingController(text: '1');
  }

  ///  MultiMediaPickerService instance.
  final MultiMediaPickerService multiMediaPickerService =
      locator<MultiMediaPickerService>();

  /// Event service instance.
  final eventService = locator<EventService>();

  /// Form validation mode.
  AutovalidateMode validate = AutovalidateMode.disabled;

  /// Current organization info.
  final OrgInfo currentOrg = locator<UserConfig>().currentOrg;

  /// Image file for the event.
  File? imageFile;

  /// Event title controller.
  late final TextEditingController eventTitleTextController;

  /// Event location controller.
  late final TextEditingController eventLocationTextController;

  /// Event description controller.
  late final TextEditingController eventDescriptionTextController;

  /// Recurrence interval controller.
  late final TextEditingController repeatsEveryCountController;

  /// Event start time.
  TimeOfDay eventStartTime = TimeOfDay.now();

  /// Event end time greater then start time in deafult also.
  TimeOfDay eventEndTime = TimeOfDay.now().replacing(
    hour: TimeOfDay.now().minute == 59
        ? TimeOfDay.now().hour + 1
        : TimeOfDay.now().hour,
    minute: TimeOfDay.now().minute == 59 ? 59 : TimeOfDay.now().minute + 1,
  );

  /// Event start date.
  DateTime eventStartDate = DateTime.now();

  /// Event end date.
  DateTime eventEndDate = DateTime.now();

  /// Whether the event is public.
  bool isPublicSwitch = true;

  /// Whether the event is registerable.
  bool isRegisterableSwitch = true;

  /// Clean up resources when the view model is destroyed.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  ///   None
  void cleanUp() {
    eventTitleTextController.dispose();
    eventLocationTextController.dispose();
    eventDescriptionTextController.dispose();
    repeatsEveryCountController.dispose();
  }

  /// Whether the event is all day.
  bool isAllDay = true;

  /// Whether the event is recurring.
  bool isRecurring = false;

  /// Recurrence frequency.
  String frequency = Frequency.weekly;

  /// Recurrence weekdays.
  Set<String> weekDays = {};

  /// Recurrence interval.
  int interval = 1;

  /// Recurrence occurrence count.
  int? count;

  /// Recurrence month days.
  List<int>? byMonthDay;

  /// Recurrence months.
  List<int>? byMonth;

  /// Occurrence of weekday in month (for monthly/yearly). -1 for last occurrence.
  int? weekDayOccurrenceInMonth;

  /// Day position for monthly recurrence (e.g., 1st Monday, 3rd Friday).
  int? byPosition;

  /// Recurrence end date.
  DateTime? recurrenceEndDate;

  /// Whether recurrence never ends.
  bool never = true;

  /// Recurrence display label.
  String recurrenceLabel = 'Does not repeat';

  /// Event end type.
  String eventEndType = EventEndTypes.never;

  /// Sets the event end type and updates dependent fields accordingly.
  ///
  /// **params**:
  /// * `type`: The event end type to set.
  ///
  /// **returns**:
  ///   None
  void setEventEndType(String type) {
    eventEndType = type;
    if (type == EventEndTypes.never) {
      count = null;
      recurrenceEndDate = null;
      never = true;
    } else if (type == EventEndTypes.on) {
      recurrenceEndDate ??=
          DateTime.now().add(const Duration(days: kDefaultRecurrenceEndDays));
      count = null;
      never = false;
    } else if (type == EventEndTypes.after) {
      recurrenceEndDate = null;
      count ??= 10;
      never = false;
    }
  }

  /// Whether to use day of week for monthly recurrence (vs. day of month).
  bool useDayOfWeekMonthly = false;

  /// Whether to use day of week for yearly recurrence (vs. day of month).
  bool useDayOfWeekYearly = false;

  /// Execute the main action (e.g., create or update event).
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  ///   None
  Future<void> execute() async {}

  /// Execute the main action if the user is logged in.
  ///
  /// This method checks if the user is logged in before executing the main action.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  ///   None
  Future<void> executeIfLoggedIn() async {
    if (userConfig.loggedIn) {
      await execute();
    }
  }

  /// Reset recurrence to default values.
  ///
  /// This method resets all recurrence-related properties to their default values,
  /// effectively making the event non-recurring. It sets frequency to weekly by default,
  /// clears all weekday selections, sets interval to 1, and resets end conditions.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  ///   None
  void resetRecurrenceSettings() {
    isRecurring = false;
    frequency = Frequency.weekly;
    weekDays = {};
    interval = 1;
    repeatsEveryCountController.text = '1';
    count = null;
    byMonth = null;
    byMonthDay = null;
    recurrenceEndDate = null;
    never = true;
    eventEndType = EventEndTypes.never;
    weekDayOccurrenceInMonth = null;
    byPosition = null;
    useDayOfWeekMonthly = false;
    useDayOfWeekYearly = false;
    updateRecurrenceLabel();
  }

  /// Combine date and time into a DateTime object.
  ///
  /// **params**:
  /// * `date`: Date part
  /// * `time`: Time part (optional)
  ///
  /// **returns**:
  /// * `DateTime`: Combined DateTime object
  DateTime combineDateTime(
    DateTime date,
    TimeOfDay? time,
  ) {
    final combined = DateTime(
      date.year,
      date.month,
      date.day,
      time?.hour ?? 0,
      time?.minute ?? 0,
    );
    return combined;
  }

  /// Get image from gallery or camera.
  ///
  /// **params**:
  /// * `camera`: Use camera if true, gallery if false
  ///
  /// **returns**:
  ///   None
  Future<void> getImageFromGallery({bool camera = false}) async {
    final image =
        await multiMediaPickerService.getPhotoFromGallery(camera: camera);
    if (image != null) {
      imageFile = image;
      notifyListeners();
    }
  }

  /// Remove selected image.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  ///   None
  void removeImage() {
    imageFile = null;
    notifyListeners();
  }

  /// Set recurrence frequency and defaults.
  ///
  /// **params**:
  /// * `freq`: Recurrence frequency
  ///
  /// **returns**:
  ///   None
  void setRecurrenceFrequency(String freq) {
    frequency = freq;
    interval = 1;

    switch (freq) {
      case Frequency.daily:
        weekDays = {};
        byMonth = null;
        byMonthDay = null;
      case Frequency.weekly:
        if (weekDays.isEmpty) {
          weekDays = {days[eventStartDate.weekday - 1]};
        }
        byMonth = null;
        byMonthDay = null;
      case Frequency.monthly:
        byMonth = null;
        byMonthDay = [eventStartDate.day];
        weekDays = {};
      case Frequency.yearly:
        weekDays = {};
        byMonth = [eventStartDate.month];
        byMonthDay = [eventStartDate.day];
    }
    notifyListeners();
  }

  /// Shows date picker and handles start date selection with validation.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  ///   None
  Future<void> pickStartDate() async {
    final date = await customDatePicker(
      initialDate: eventStartDate,
    );
    // Validator functions tested in unit tests
    // coverage:ignore-start
    final errorMessage = Validators.eventStartDate(date);
    // coverage:ignore-end
    if (errorMessage != null) {
      navigationService.showSnackBar(errorMessage);
      return;
    }
    eventStartDate = date;
    final startDateTime = combineDateTime(eventStartDate, eventStartTime);
    final endDateTime = combineDateTime(eventEndDate, eventEndTime);
    if (endDateTime.isBefore(startDateTime)) {
      eventEndDate = eventStartDate;

      /// end time 1 minute extra then start time
      eventEndTime = eventStartTime.replacing(
        hour: eventStartTime.minute == 59
            ? eventStartTime.hour + 1
            : eventStartTime.hour,
        minute: eventStartTime.minute == 59 ? 59 : eventStartTime.minute + 1,
      );
    }
    notifyListeners();
  }

  /// Shows time picker and handles start time selection with validation.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  ///   None
  Future<void> pickStartTime() async {
    if (isAllDay) {
      return;
    }

    final time = await customTimePicker(
      initialTime: eventStartTime,
    );
    eventStartTime = time;
    final endDateTime = combineDateTime(eventEndDate, eventEndTime);
    final startDateTime = combineDateTime(eventStartDate, eventStartTime);
    if (endDateTime.isBefore(startDateTime)) {
      if (eventStartDate.year == eventEndDate.year &&
          eventStartDate.month == eventEndDate.month &&
          eventStartDate.day == eventEndDate.day) {
        eventEndTime = time;
      }
    }

    notifyListeners();
  }

  /// Shows date picker and handles end date selection with validation.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  ///   None
  Future<void> pickEndDate() async {
    final date = await customDatePicker(
      initialDate: eventEndDate,
    );
    // Validator functions tested in unit tests
    // coverage:ignore-start
    final errorMessage = Validators.eventDateTime(
      eventStartDate,
      eventStartTime,
      date,
      eventEndTime,
    );
    // coverage:ignore-end
    if (errorMessage != null) {
      navigationService.showSnackBar(errorMessage);
      return;
    }

    eventEndDate = date;
    notifyListeners();
  }

  /// Shows time picker and handles end time selection with validation.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  ///   None
  Future<void> pickEndTime() async {
    if (isAllDay) {
      return;
    }

    final time = await customTimePicker(
      initialTime: eventEndTime,
    );
    if (eventStartDate.year == eventEndDate.year &&
        eventStartDate.month == eventEndDate.month &&
        eventStartDate.day == eventEndDate.day) {
      // Validator functions tested in unit tests
      // coverage:ignore-start
      final errorMessage = Validators.eventDateTime(
        eventStartDate,
        eventStartTime,
        eventEndDate,
        time,
      );
      // coverage:ignore-end

      if (errorMessage != null) {
        navigationService.showSnackBar(errorMessage);
        return;
      }
    }
    eventEndTime = time;
    notifyListeners();
  }

  /// Updates the recurrence label based on current settings.
  ///
  /// This method sets the human-readable description of the recurrence rule
  /// based on the current recurrence properties (frequency, interval, weekdays, etc.).
  /// It sets the recurrenceLabel property using RecurrenceUtils.getRecurrenceRuleText()
  /// and notifies listeners of the change.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  ///   None
  void updateRecurrenceLabel() {
    if (!isRecurring) {
      recurrenceLabel = 'Does not repeat';
      return;
    }

    recurrenceLabel = RecurrenceUtils.getRecurrenceRuleText(
      frequency: frequency,
      interval: interval,
      weekDays: weekDays,
      byMonthDay: byMonthDay,
      byMonth: byMonth,
      count: count,
      endDate: recurrenceEndDate,
      never: never,
      byPosition: byPosition,
      useDayOfWeekMonthly: useDayOfWeekMonthly,
      useDayOfWeekYearly: useDayOfWeekYearly,
    );
    notifyListeners();
  }

  /// Navigate back to the previous screen.
  ///
  /// This method provides a clean interface for the View to navigate back
  /// without directly accessing the NavigationService.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  ///   None
  void navigateBack() {
    navigationService.pop();
  }

  /// Dispose controllers and focus nodes by calling cleanUp.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  ///   None
  @override
  void dispose() {
    cleanUp();
    super.dispose();
  }
}
