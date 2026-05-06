import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:talawa/constants/recurrence_utils.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/models/events/event_model.dart';
import 'package:talawa/models/events/event_venue.dart';
import 'package:talawa/models/user/user_info.dart';
import 'package:talawa/view_model/after_auth_view_models/event_view_models/base_event_view_model.dart';
import 'package:talawa/widgets/custom_progress_dialog.dart';

/// View model for creating events in an organization.
class CreateEventViewModel extends BaseEventViewModel {
  late final Map<String, bool> _memberCheckedMap = {};
  late final List<User> _selectedMembers = [];

  /// Organization members list.
  late List<User> orgMembersList = [];

  /// Selected members for event.
  List<User> get selectedMembers => _selectedMembers;

  /// Member selection map.
  Map<String, bool> get memberCheckedMap => _memberCheckedMap;

  /// Formats a [DateTime] as `YYYY-MM-DD` for all-day event date fields.
  ///
  /// **params**:
  /// * `d`: The date to format.
  ///
  /// **returns**:
  /// * `String`: `YYYY-MM-DD` representation of [d].
  String _formatDateOnly(DateTime d) => '${d.year.toString().padLeft(4, '0')}-'
      '${d.month.toString().padLeft(2, '0')}-'
      '${d.day.toString().padLeft(2, '0')}';

  @override
  Future<void> execute() async {
    try {
      final description = eventDescriptionTextController.text.trim();
      final location = eventLocationTextController.text.trim();

      final Map<String, dynamic> input = {
        'name': eventTitleTextController.text,
        'isPublic': isPublicSwitch,
        'isRegisterable': isRegisterableSwitch,
        'allDay': isAllDay,
        'organizationId': currentOrg.id,
        // API rejects empty strings on optional fields with min(1) validation.
        if (description.isNotEmpty) 'description': description,
        if (location.isNotEmpty) 'location': location,
      };

      if (isAllDay) {
        // API requires endDate strictly greater than startDate. Bump end to
        // the day after when the user picked the same (or earlier) end date.
        DateTime endForApi = eventEndDate;
        if (!endForApi.isAfter(eventStartDate)) {
          endForApi = eventStartDate.add(const Duration(days: 1));
        }
        input['startDate'] = _formatDateOnly(eventStartDate);
        input['endDate'] = _formatDateOnly(endForApi);
      } else {
        final start = combineDateTime(eventStartDate, eventStartTime).toUtc();
        DateTime end = combineDateTime(eventEndDate, eventEndTime).toUtc();
        if (!end.isAfter(start)) {
          end = start.add(const Duration(hours: 1));
        }
        input['startAt'] = start.toIso8601String();
        input['endAt'] = end.toIso8601String();
      }

      final Map<String, dynamic> variables = {"input": input};

      if (isRecurring) {
        final recurrenceData = _buildRecurrenceData();
        if (recurrenceData.isNotEmpty) {
          // ignore: avoid_dynamic_calls
          variables['input']['recurrence'] = recurrenceData;
        }
      }

      // Snapshot the date BEFORE clearFormState resets controllers so the
      // refetch window stays anchored on the new event's actual date.
      final eventDate = eventStartDate;

      navigationService.pushDialog(
        const CustomProgressDialog(),
      );

      final result = await eventService.createEvent(variables: variables);
      if (result.data != null) {
        // Pop the progress dialog.
        navigationService.pop();

        // Insert returned event directly into the in-memory feed so it shows
        // even when a refetch would page-skip it (e.g. >100 events in window).
        final createdJson = result.data!['createEvent'];
        if (createdJson is Map<String, dynamic>) {
          eventService.addLocalEvent(Event.fromJson(createdJson));
        }

        // Refetch around the created event's date as a secondary refresh so
        // server-side fields (cursor, sequence, etc.) reconcile with the feed.
        final rangeStart = eventDate.subtract(const Duration(days: 60));
        final rangeEnd = eventDate.add(const Duration(days: 60));
        await eventService.fetchEventsWithDates(rangeStart, rangeEnd);

        clearFormState();

        // Pop the create-event screen so the user lands back on the events
        // list with the new event visible.
        navigationService.pop();
        navigationService.showSnackBar('Event created successfully');
      } else {
        throw Exception('Event creation failed');
      }
    } catch (e) {
      navigationService.pop();
      navigationService
          .showSnackBar('An error occurred while creating the event');
      return;
    }
  }

  /// Get current organization users list.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  /// * `Future<List<User>>`: Organization users list
  Future<List<User>> getCurrentOrgUsersList() async {
    if (orgMembersList.isEmpty) {
      orgMembersList =
          await organizationService.getOrgMembersList(currentOrg.id!);
    }

    for (final orgMember in orgMembersList) {
      _memberCheckedMap.putIfAbsent(orgMember.id!, () => false);
    }
    return orgMembersList;
  }

  /// Build selected user list.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  ///   None
  void buildUserList() {
    _selectedMembers.clear();
    for (final orgMember in orgMembersList) {
      if (_memberCheckedMap[orgMember.id] == true) {
        _selectedMembers.add(orgMember);
      }
    }
    notifyListeners();
  }

  /// Remove user from selected list.
  ///
  /// **params**:
  /// * `userId`: User ID to remove
  ///
  /// **returns**:
  ///   None
  void removeUserFromList({required String userId}) {
    _selectedMembers.removeWhere((user) => user.id == userId);
    _memberCheckedMap[userId] = false;
    notifyListeners();
  }

  /// Fetch venues for organization.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  /// * `Future<List<Venue>>`: List of venues
  Future<List<Venue>> fetchVenues() async {
    final String query = queries.venueListQuery();
    final QueryResult result = await databaseFunctions.gqlAuthQuery(
      query,
      variables: {"orgId": currentOrg.id},
    );

    if (result.data == null) return [];

    final List<dynamic> venuesList =
        result.data!['getVenueByOrgId'] as List<dynamic>;
    return venuesList.map((venue) {
      return Venue.fromJson(venue as Map<String, dynamic>);
    }).toList();
  }

  /// Build recurrence data for API.
  ///
  /// Constructs a structured recurrence data map based on the current recurrence settings
  /// by delegating to the centralized RecurrenceUtils.buildRecurrenceData method.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  /// * `Map<String, dynamic>`: Recurrence data map ready for the API
  Map<String, dynamic> _buildRecurrenceData() {
    return RecurrenceUtils.buildRecurrenceData(
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
  }

  /// Clear form state after event creation.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  ///   None
  void clearFormState() {
    eventTitleTextController.clear();
    eventLocationTextController.clear();
    eventDescriptionTextController.clear();
    repeatsEveryCountController.text = '1';
    validate = AutovalidateMode.disabled;
    resetRecurrenceSettings();
    isPublicSwitch = true;
    isRegisterableSwitch = true;
    isAllDay = true;
    final now = DateTime.now();
    eventStartDate = now;
    eventEndDate = now;
    recurrenceEndDate = null;
    eventStartTime = TimeOfDay.now();
    eventEndTime = TimeOfDay.now();
    imageFile = null;
    _selectedMembers.clear();
    _memberCheckedMap.clear();
    notifyListeners();
  }
}
