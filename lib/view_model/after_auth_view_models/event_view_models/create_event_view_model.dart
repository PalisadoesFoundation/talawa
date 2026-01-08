import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:talawa/constants/recurrence_utils.dart';
import 'package:talawa/locator.dart';
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

  @override
  Future<void> execute() async {
    try {
      final Map<String, dynamic> variables = {
        "input": {
          'name': eventTitleTextController.text,
          'description': eventDescriptionTextController.text,
          'location': eventLocationTextController.text,
          'isPublic': isPublicSwitch,
          'isRegisterable': isRegisterableSwitch,
          'allDay': isAllDay,
          'organizationId': currentOrg.id,
          'startAt': combineDateTime(
            eventStartDate,
            eventStartTime,
          ).toUtc().toIso8601String(),
          'endAt': combineDateTime(
            eventEndDate,
            eventEndTime,
          ).toUtc().toIso8601String(),
        },
      };

      if (isRecurring) {
        final recurrenceData = _buildRecurrenceData();
        if (recurrenceData.isNotEmpty) {
          // ignore: avoid_dynamic_calls
          variables['input']['recurrence'] = recurrenceData;
        }
      }

      navigationService.pushDialog(
        const CustomProgressDialog(),
      );

      final result = await eventService.createEvent(variables: variables);
      if (result.hasException || result.data == null) {
        throw Exception('Event creation failed: ${result.exception}');
      }
      navigationService.pop();
      navigationService.showSnackBar('Event created successfully');
      clearFormState();
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

    if (result.hasException || result.data == null) return [];

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
