import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:talawa/enums/enums.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/models/events/agendaItems/event_agenda_item.dart';
import 'package:talawa/models/events/event_agenda_category.dart';
import 'package:talawa/models/events/event_model.dart';
import 'package:talawa/models/events/event_volunteer_group.dart';
import 'package:talawa/services/event_service.dart';
import 'package:talawa/services/user_config.dart';
import 'package:talawa/view_model/after_auth_view_models/event_view_models/explore_events_view_model.dart';
import 'package:talawa/view_model/base_view_model.dart';
import 'package:talawa/widgets/custom_progress_dialog.dart';

/// EventInfoViewModel class helps interacting with model to serve view with the event information data.
class EventInfoViewModel extends BaseModel {
  /// ExploreEventsViewModel instance to fetch the event data.
  late ExploreEventsViewModel exploreEventsInstance;

  /// Event instance to store the event data.
  late Event event;

  /// String type variable to store the FAB title.
  late String fabTitle;

  /// List of Attendee type to store the attendees data.
  late List<Attendee> attendees = [];

  late final List<EventVolunteerGroup> _volunteerGroups = [];

  /// List of volunteer groups of an event.
  List<EventVolunteerGroup> get volunteerGroups => _volunteerGroups;

  late List<EventAgendaItem> _agendaItems = [];

  /// List of volunteer groups of an event.
  List<EventAgendaItem> get agendaItems => _agendaItems;

  late List<AgendaCategory> _categories = [];
  late List<AgendaCategory> _selectedCategories = [];

  /// List of Agenda categories in an organisation.
  List<AgendaCategory> get categories => _categories;

  /// List of selected Agenda categories for an agenda item.
  List<AgendaCategory> get selectedCategories => _selectedCategories;

  /// This function initializes the EventInfoViewModel class with the required arguments.
  ///
  /// **params**:
  /// * `args`: A map of arguments required to initialize the EventInfoViewModel class.
  ///
  /// **returns**:
  ///   None
  Future<void> initialize({required Map<String, dynamic> args}) async {
    event = args["event"] as Event;
    exploreEventsInstance =
        args["exploreEventViewModel"] as ExploreEventsViewModel;
    fabTitle = getFabTitle();
    await fetchCategories();
    await fetchAgendaItems();
    selectedCategories.clear();
    setState(ViewState.busy);
    attendees = event.attendees ?? [];
    setState(ViewState.idle);
  }

  /// The function allows user to register for an event.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  ///   None
  Future<void> registerForEvent() async {
    // if event registration is open and user not already registered for the event.
    if (event.isRegisterable == true && event.isRegistered == false) {
      navigationService.pushDialog(
        const CustomProgressDialog(
          key: Key('RegisterEvent'),
        ),
      );

      // use `registerForAnEvent` function provided by `EventService` service.
      final registerResult =
          await locator<EventService>().registerForAnEvent(event.id ?? '');
      if (registerResult != null) {
        event.isRegistered = true;
        final userConfig = locator<UserConfig>();
        attendees.add(
          Attendee(
            id: userConfig.currentUser.id,
            firstName: userConfig.currentUser.firstName,
            lastName: userConfig.currentUser.lastName,
            image: userConfig.currentUser.image,
          ),
        );
      }
      fabTitle = getFabTitle();
      navigationService.pop();
      notifyListeners();
    }
  }

  /// The funtion returns title to be displayed on Floating Action Button.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  /// * `String`: Returns the title to be displayed on Floating Action Button.
  String getFabTitle() {
    if (event.isRegisterable == false) {
      return "Not Registrable";
    } else if (event.isRegistered == true) {
      return "Registered";
    } else {
      return "Register";
    }
  }

  /// This function is used to create a new volunteer group for an event.
  ///
  /// **params**:
  /// * `event`: Name of the group
  /// * `groupName`: Name of the group
  /// * `volunteersRequired`: Total number of volunteers required for the group
  ///
  /// **returns**:
  /// * `Future<EventVolunteerGroup?>`: returns the new volunteer group for an event
  Future<EventVolunteerGroup?> createVolunteerGroup(
    Event event,
    String groupName,
    int volunteersRequired,
  ) async {
    try {
      final variables = {
        'eventId': event.id,
        'name': groupName,
        'volunteersRequired': volunteersRequired,
      };

      final result = await locator<EventService>()
          .createVolunteerGroup(variables) as QueryResult;

      if (result.data == null ||
          result.data!['createEventVolunteerGroup'] == null) {
        throw Exception('Failed to create volunteer group or no data returned');
      }

      final data = result.data!['createEventVolunteerGroup'];
      final newGroup =
          EventVolunteerGroup.fromJson(data as Map<String, dynamic>);

      _volunteerGroups.add(newGroup);
      notifyListeners();

      return newGroup;
    } catch (e) {
      print('Error creating volunteer group: $e');
    }
    return null;
  }

  /// Fetches all volunteer groups for the current event.
  ///
  /// **params**:
  /// * `eventId`: The ID of the event to fetch volunteer groups for.
  ///
  /// **returns**:
  ///   None
  Future<void> fetchVolunteerGroups(String eventId) async {
    try {
      final result =
          await locator<EventService>().fetchVolunteerGroupsByEvent(eventId);

      _volunteerGroups.clear();
      _volunteerGroups.addAll(result);
      notifyListeners();
    } catch (e) {
      print('Error fetching volunteer groups: $e');
      setState(ViewState.idle);
    }
  }

  /// Method to fecth all agenda categories of an organisation.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  ///   None
  Future<void> fetchCategories() async {
    try {
      final result = await locator<EventService>()
          .fetchAgendaCategories(userConfig.currentOrg.id!) as QueryResult;

      if (result.data == null) return;

      final List categoryJson =
          result.data!['agendaItemCategoriesByOrganization'] as List;
      _categories = categoryJson
          .map((json) => AgendaCategory.fromJson(json as Map<String, dynamic>))
          .toList();

      notifyListeners();
    } catch (e) {
      print('Error fetching categories: $e');
    }
  }

  /// method to select multiple categories.
  ///
  /// **params**:
  /// * `categories`: define_the_param
  ///
  /// **returns**:
  ///   None
  void setSelectedCategories(List<AgendaCategory> categories) {
    _selectedCategories = categories;
    notifyListeners();
  }

  /// Method to fetch all agenda items of an organization.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  ///   None
  Future<void> fetchAgendaItems() async {
    try {
      _agendaItems = event.agendaItems ?? [];
      _agendaItems.sort((a, b) => a.sequence!.compareTo(b.sequence!));
      notifyListeners();
    } catch (e) {
      print('Error fetching agenda items: $e');
    }
  }

  /// This function is used to create a new agenda item for an event.
  ///
  /// **params**:
  /// * `title`: Title of the agenda item.
  /// * `description`: Description of the agenda item (optional).
  /// * `duration`: Duration of the agenda item.
  /// * `attachments`: List of attachment URLs (optional).
  /// * `urls`: List of related URLs (optional).
  /// * `categories`: List of category IDs (optional).
  /// * `sequence`: Sequence number of the agenda item.
  /// * `itemType`: Type of the agenda item.
  /// * `isNote`: Whether the agenda item is a note or not.
  ///
  /// **returns**:
  /// * `Future<EventAgendaItem?>`: Returns the new agenda item if creation is successful.
  Future<EventAgendaItem?> createAgendaItem({
    required String title,
    String? description,
    required String duration,
    List<String>? attachments,
    List<String>? urls,
    List<String>? categories,
    int? sequence,
  }) async {
    try {
      final variables = {
        'title': title,
        'description': description,
        'duration': duration,
        'attachments': attachments,
        'relatedEventId': event.id,
        'urls': urls,
        'categories': categories,
        'sequence': _agendaItems.length + 1,
        'organizationId': userConfig.currentOrg.id,
      };
      final result = await locator<EventService>().createAgendaItem(variables)
          as QueryResult;
      if (result.data == null || result.data!['createAgendaItem'] == null) {
        throw Exception('Failed to create agenda item or no data returned');
      }

      final data = result.data!['createAgendaItem'];

      final newAgendaItem =
          EventAgendaItem.fromJson(data as Map<String, dynamic>);

      _agendaItems.add(newAgendaItem);
      selectedCategories.clear();
      notifyListeners();

      return newAgendaItem;
    } catch (e) {
      print('Error creating agenda item: $e');
    }
    return null;
  }

  /// Method to delete an agenda item.
  ///
  /// more_info_if_required
  ///
  /// **params**:
  /// * `id`: id of the gaenda item that is to be deleted
  ///
  /// **returns**:
  ///   None
  Future<void> deleteAgendaItem(String id) async {
    try {
      await locator<EventService>()
          .deleteAgendaItem({"removeAgendaItemId": id});
      _agendaItems.removeWhere((item) => item.id == id);
      notifyListeners();
    } catch (e) {
      print('Error deleting agenda item: $e');
    }
  }

  /// Method to update the sequence of an agenda item.
  ///
  /// **params**:
  /// * `itemId`: id of the agenda item whose sequence need to be updated
  /// * `newSequence`: new sequence of the item
  ///
  /// **returns**:
  ///   None
  Future<void> updateAgendaItemSequence(String itemId, int newSequence) async {
    try {
      final result = await locator<EventService>().updateAgendaItem(
        itemId,
        {'sequence': newSequence},
      ) as QueryResult<Object?>;

      final updatedItem = EventAgendaItem.fromJson(
        result.data!['updateAgendaItem'] as Map<String, dynamic>,
      );
      final index = _agendaItems.indexWhere((item) => item.id == itemId);
      if (index != -1) {
        _agendaItems[index] = updatedItem;
        notifyListeners();
      }
    } catch (e) {
      print('Error updating agenda item sequence: $e');
    }
  }

  /// Method to redorder the sequence of agenda items.
  ///
  /// **params**:
  /// * `oldIndex`: old index of the item
  /// * `newIndex`: new index of the item
  ///
  /// **returns**:
  ///   None
  Future<void> reorderAgendaItems(int oldIndex, int newIndex) async {
    int adjustedNewIndex = newIndex;

    if (oldIndex < adjustedNewIndex) {
      adjustedNewIndex -= 1;
    }

    final EventAgendaItem item = _agendaItems.removeAt(oldIndex);
    _agendaItems.insert(adjustedNewIndex, item);

    // Update sequences for all items
    for (int i = 0; i < _agendaItems.length; i++) {
      final item = _agendaItems[i];
      if (item.sequence != i + 1) {
        await updateAgendaItemSequence(item.id!, i + 1);
      }
    }

    notifyListeners();
  }
}
