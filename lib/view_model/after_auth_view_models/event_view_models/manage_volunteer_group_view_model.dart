import 'package:flutter/foundation.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:talawa/enums/enums.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/models/events/event_model.dart';
import 'package:talawa/models/events/event_volunteer.dart';
import 'package:talawa/models/events/event_volunteer_group.dart';
import 'package:talawa/models/user/user_info.dart';
import 'package:talawa/services/event_service.dart';
import 'package:talawa/view_model/base_view_model.dart';

/// A ViewModel for managing volunteer groups within an event.
///
/// This class handles operations related to volunteer groups including
/// initializing the group, adding/removing volunteers, and updating group details.
class ManageVolunteerGroupViewModel extends BaseModel {
  /// The event associated with the volunteer group.
  late Event event;

  /// List of organization members.
  late List<User> orgMembersList = [];

  /// A map to track the selection state of organization members.
  late final Map<String, bool> _memberCheckedMap = {};

  /// Gets the map of member IDs and their selection state.
  Map<String, bool> get memberCheckedMap => _memberCheckedMap;

  /// List of volunteers in the group.
  List<EventVolunteer> _volunteers = [];

  /// Gets the list of volunteers in the group.
  List<EventVolunteer> get volunteers => _volunteers;

  /// Indicates whether the view model is currently fetching volunteers.
  final bool _isFetchingVolunteers = false;

  /// Gets whether the view model is currently fetching volunteers.
  bool get isFetchingVolunteers => _isFetchingVolunteers;

  /// Initializes the view model with the given event and volunteer group.
  ///
  /// **params**:
  /// * `parentEvent`: The event associated with the volunteer group.
  /// * `group`: The volunteer group to be managed.
  ///
  /// **returns**:
  ///   None
  Future<void> initialize(Event parentEvent, EventVolunteerGroup group) async {
    setState(ViewState.busy);

    event = parentEvent;
    if (group.volunteers != null) {
      _volunteers = List<EventVolunteer>.from(group.volunteers!);
    }

    setState(ViewState.idle);
  }

  /// Fetches the list of current organization members.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  /// * `Future<List<User>>`: A list of organization members.
  Future<List<User>> getCurrentOrgUsersList() async {
    if (orgMembersList.isEmpty) {
      orgMembersList = await organizationService
          .getOrgMembersList(userConfig.currentOrg.id!);
    }
    final availableMembers = orgMembersList.where((member) {
      return !volunteers.any((volunteer) => volunteer.user?.id == member.id);
    }).toList();

    for (final member in availableMembers) {
      if (member.id == null) continue;
      _memberCheckedMap.putIfAbsent(member.id!, () => false);
    }

    return availableMembers;
  }

  /// Adds a volunteer to the specified group.
  ///
  /// **params**:
  /// * `volunteerId`: The ID of the volunteer to add.
  /// * `eventId`: The ID of the event.
  /// * `groupId`: The ID of the group.
  ///
  /// **returns**:
  ///   None
  Future<void> addVolunteerToGroup(
    String volunteerId,
    String eventId,
    String groupId,
  ) async {
    try {
      final variables = {
        'eventId': eventId,
        'userId': volunteerId,
        'groupId': groupId,
      };
      final result =
          await locator<EventService>().addVolunteerToGroup(variables);
      final queryResult = result as QueryResult?;
      if (queryResult?.hasException == true) {
        debugPrint(
            "Error adding volunteer to group: ${queryResult?.exception?.graphqlErrors}");
        navigationService.showTalawaErrorSnackBar(
          "Failed to add volunteer to group",
          MessageType.error,
        );
        return;
      }
      if (queryResult?.data == null ||
          queryResult?.data!['createEventVolunteer'] == null) {
        debugPrint('Failed to add volunteer to group or no data returned');
        navigationService.showTalawaErrorSnackBar(
          "Failed to add volunteer to group",
          MessageType.error,
        );
        return;
      }

      final data = queryResult?.data;
      if (data?['createEventVolunteer'] == null) {
        navigationService.showTalawaErrorSnackBar(
          "Failed to add volunteer to group",
          MessageType.error,
        );
        return;
      }
      final addedVolunteerData =
          data?['createEventVolunteer'] as Map<String, dynamic>;
      final addedVolunteer = EventVolunteer.fromJson(addedVolunteerData);
      _volunteers.add(addedVolunteer);
      notifyListeners();
    } catch (e, stackTrace) {
      debugPrint('Error adding volunteer to group: $e');
      debugPrint('Stack trace: $stackTrace');
      navigationService.showTalawaErrorSnackBar(
        "Error adding volunteer to group",
        MessageType.error,
      );
    }
  }

  /// Deletes a volunteer group.
  ///
  /// **params**:
  /// * `groupId`: The ID of the group to delete.
  ///
  /// **returns**:
  ///   None
  Future<void> deleteVolunteerGroup(String groupId) async {
    try {
      final variables = {
        'id': groupId,
      };
      final result =
          await locator<EventService>().removeVolunteerGroup(variables);
      final queryResult = result as QueryResult?;
      if (queryResult?.hasException == true) {
        debugPrint(
            "Error removing volunteer group: ${queryResult?.exception?.graphqlErrors}");
        navigationService.showTalawaErrorSnackBar(
          "Failed to remove volunteer group",
          MessageType.error,
        );
        return;
      }
      if (queryResult?.data == null ||
          queryResult?.data!['removeEventVolunteerGroup'] == null) {
        debugPrint('Failed to remove volunteer group or no data returned');
        navigationService.showTalawaErrorSnackBar(
          "Failed to remove volunteer group",
          MessageType.error,
        );
        return;
      }

      final data = queryResult?.data;

      if (data != null && data['removeEventVolunteerGroup'] != null) {
        notifyListeners();
      }
    } catch (e, stackTrace) {
      debugPrint('Error deleting volunteer group: $e');
      debugPrint('Stack trace: $stackTrace');
      navigationService.showTalawaErrorSnackBar(
        "Error deleting volunteer group",
        MessageType.error,
      );
    }
  }

  /// Removes a volunteer from the group.
  ///
  /// **params**:
  /// * `volunteerId`: The ID of the volunteer to remove.
  ///
  /// **returns**:
  ///   None
  Future<void> removeVolunteerFromGroup(String volunteerId) async {
    try {
      final variables = {
        'id': volunteerId,
      };
      final result =
          await locator<EventService>().removeVolunteerFromGroup(variables);
      final queryResult = result as QueryResult?;
      if (queryResult?.hasException == true) {
        debugPrint(
            "Error removing volunteer from group: ${queryResult?.exception?.graphqlErrors}");
        navigationService.showTalawaErrorSnackBar(
          "Failed to remove volunteer from group",
          MessageType.error,
        );
        return;
      }
      if (queryResult?.data == null ||
          queryResult?.data!['removeEventVolunteer'] == null) {
        debugPrint('Failed to remove volunteer or no data returned');
        navigationService.showTalawaErrorSnackBar(
          "Failed to remove volunteer from group",
          MessageType.error,
        );
        return;
      }

      final data = queryResult?.data;

      if (data != null && data['removeEventVolunteer'] != null) {
        _volunteers.removeWhere((volunteer) => volunteer.id == volunteerId);
        notifyListeners();
      } else {
        debugPrint('Failed to remove volunteer or no data returned');
        navigationService.showTalawaErrorSnackBar(
          "Failed to remove volunteer from group",
          MessageType.error,
        );
      }
    } catch (e, stackTrace) {
      debugPrint('Error removing volunteer from group: $e');
      debugPrint('Stack trace: $stackTrace');
      navigationService.showTalawaErrorSnackBar(
        "Error removing volunteer from group",
        MessageType.error,
      );
    }
  }

  /// Updates the details of a volunteer group.
  ///
  /// **params**:
  /// * `group`: The volunteer group to update.
  /// * `eventId`: The ID of the event.
  /// * `name`: The new name for the group.
  /// * `volunteersRequired`: The new number of volunteers required.
  ///
  /// **returns**:
  ///   None
  Future<void> updateVolunteerGroup(
    EventVolunteerGroup group,
    String eventId,
    String name,
    int volunteersRequired,
  ) async {
    final variables = {
      'id': group.id,
      'data': {
        'eventId': eventId,
        'name': name,
        'volunteersRequired': volunteersRequired,
      },
    };

    try {
      final result =
          await locator<EventService>().updateVolunteerGroup(variables);
      final queryResult = result as QueryResult?;
      if (queryResult?.hasException == true) {
        debugPrint(
            "Error updating volunteer group: ${queryResult?.exception?.graphqlErrors}");
        navigationService.showTalawaErrorSnackBar(
          "Failed to update volunteer group",
          MessageType.error,
        );
        return;
      }
      if (queryResult?.data == null ||
          queryResult?.data!['updateEventVolunteerGroup'] == null) {
        debugPrint('Failed to update volunteer group or no data returned');
        navigationService.showTalawaErrorSnackBar(
          "Failed to update volunteer group",
          MessageType.error,
        );
        return;
      }

      if (queryResult?.data != null) {
        group.name = name;
        group.volunteersRequired = volunteersRequired;
        notifyListeners();
      }
    } catch (e, stackTrace) {
      debugPrint('Error updating volunteer group: $e');
      debugPrint('Stack trace: $stackTrace');
      navigationService.showTalawaErrorSnackBar(
        "Error updating volunteer group",
        MessageType.error,
      );
    }
  }
}
