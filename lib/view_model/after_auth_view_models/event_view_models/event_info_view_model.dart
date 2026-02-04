import 'dart:io';

import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:talawa/enums/enums.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/models/events/agendaItems/event_agenda_item.dart';
import 'package:talawa/models/events/event_agenda_category.dart';
import 'package:talawa/models/events/event_model.dart';
import 'package:talawa/models/events/event_volunteer_group.dart';
import 'package:talawa/services/event_service.dart';
import 'package:talawa/services/image_service.dart';
import 'package:talawa/services/third_party_service/multi_media_pick_service.dart';
import 'package:talawa/services/user_config.dart';
import 'package:talawa/view_model/after_auth_view_models/event_view_models/event_calendar_view_model.dart';
import 'package:talawa/view_model/base_view_model.dart';
import 'package:talawa/widgets/custom_progress_dialog.dart';

/// EventInfoViewModel class helps interacting with model to serve view with the event information data.
class EventInfoViewModel extends BaseModel {
  /// Event instance to store the event data.
  late Event event;

  /// Instance of EventService to manage event-related operations.
  final eventService = locator<EventService>();

  /// Instance  of calendar view model to manage calendar related operations.
  final calendarViewModel = locator<EventCalendarViewModel>();

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

  /// List to store selected Agenda categories for an agenda item.
  late List<AgendaCategory> _selectedCategories = [];

  /// List of Agenda categories in an organisation.
  List<AgendaCategory> get categories => _categories;

  /// List of selected Agenda categories for an agenda item.
  List<AgendaCategory> get selectedCategories => _selectedCategories;

  /// This function initializes the EventInfoViewModel class with the required arguments.
  ///
  /// **params**:
  /// * `event`: An instance of the Event class required to initialize the EventInfoViewModel class.
  ///
  /// **returns**:
  ///   None
  Future<void> initialize(Event event) async {
    this.event = event;
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
          await eventService.registerForAnEvent(event.id ?? '');
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

      final result = await eventService.createVolunteerGroup(variables);

      if (result is! QueryResult ||
          result.data == null ||
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
      final result = await eventService.fetchVolunteerGroupsByEvent(eventId);

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
      final result =
          await eventService.fetchAgendaCategories(userConfig.currentOrg.id!);

      if (result is! QueryResult || result.data == null) return;

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
    _agendaItems = event.agendaItems ?? [];
    _agendaItems.sort(
      (a, b) => (a.sequence ?? 0).compareTo(b.sequence ?? 0),
    );
    notifyListeners();
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
      final result = await eventService.createAgendaItem(variables);

      if (result is! QueryResult ||
          result.data == null ||
          result.data!['createAgendaItem'] == null) {
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
      await eventService.deleteAgendaItem({"removeAgendaItemId": id});
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
      final result = await eventService.updateAgendaItem(
        itemId,
        {'sequence': newSequence},
      );

      if (result is! QueryResult ||
          result.data == null ||
          result.data!['updateAgendaItem'] == null) {
        throw Exception('Failed to update agenda item sequence');
      }

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

  /// Method to delete an event. Shows a simple Yes/No dialog for standalone events and full dialog for recurrence events.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  ///   None
  Future<void> deleteEvent() async {
    print('Deleting event with id: ${event.id}');
    print("event recurring: ${event.recurring}");
    if (event.recurring == true || event.recurrenceRule != null) {
      await _showRecurringEventDeleteDialog();
    } else {
      await _showStandaloneEventDeleteDialog();
    }
  }

  /// Shows a dialog for deleting a standalone event.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  ///   None
  Future<void> _showStandaloneEventDeleteDialog() async {
    final bool? confirm = await showDialog<bool>(
      context: navigationService.navigatorKey.currentContext!,
      builder: (context) => AlertDialog(
        title: const Text('Delete Event'),
        content: const Text('Are you sure you want to delete this event?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: Text(
              'Delete',
              style: TextStyle(color: Theme.of(context).colorScheme.error),
            ),
          ),
        ],
      ),
    );
    if (confirm == true) {
      try {
        navigationService.pushDialog(
          const CustomProgressDialog(
            key: Key('DeleteEvent'),
          ),
        );
        final result = await eventService.deleteEvent(
          event,
          recurrenceType: 'standalone',
        );
        navigationService.pop();

        if (result.hasException) {
          throw Exception('Failed to delete event: ${result.exception}');
        }

        calendarViewModel.refreshCurrentViewEvents();
        navigationService.pop();
      } catch (e) {
        navigationService.pop();
        navigationService.showTalawaErrorSnackBar(
          'Failed to delete event: $e',
          MessageType.error,
        );
      }
    }
  }

  /// Shows a dialog for deleting a recurring event with options.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  ///   None
  Future<void> _showRecurringEventDeleteDialog() async {
    final String? option = await showDialog<String>(
      context: navigationService.navigatorKey.currentContext!,
      builder: (context) => AlertDialog(
        title: const Text('Delete Recurring Event'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('How would you like to delete this event?'),
            const SizedBox(height: 16),
            _buildDeleteOption(context, 'Delete this event only', 'single'),
            const SizedBox(height: 8),
            _buildDeleteOption(
              context,
              'Delete this and all future events',
              'thisAndFollowing',
            ),
            const SizedBox(height: 8),
            _buildDeleteOption(
              context,
              'Delete all events in the series',
              'series',
            ),
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

    if (option != null) {
      try {
        navigationService.pushDialog(
          const CustomProgressDialog(
            key: Key('DeleteEvent'),
          ),
        );

        final result = await eventService.deleteEvent(
          event,
          recurrenceType: option,
        );

        navigationService.pop();

        if (result.hasException) {
          throw Exception('Failed to delete event: ${result.exception}');
        }
        calendarViewModel.refreshCurrentViewEvents();
        navigationService.pop();
      } catch (e) {
        navigationService.pop();
        navigationService.showTalawaErrorSnackBar(
          'Failed to delete event: $e',
          MessageType.error,
        );
      }
      setState(ViewState.idle);
    }
  }

  /// Builds a delete option button for recurring events.
  ///
  /// **params**:
  /// * `context`: Build context
  /// * `text`: Display text for the option
  /// * `value`: Value to return when selected
  ///
  /// **returns**:
  /// * `Widget`: A button widget for the delete option
  Widget _buildDeleteOption(BuildContext context, String text, String value) {
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

  /// Pick an attachment from gallery or camera.
  ///
  /// This method provides a clean interface for the View to pick attachments
  /// without directly accessing the MultiMediaPickerService.
  ///
  /// **params**:
  /// * `fromCamera`: If true, opens camera; if false, opens gallery
  ///
  /// **returns**:
  /// * `Future<File?>`: The picked file, or null if cancelled
  Future<File?> pickAttachment({bool fromCamera = false}) async {
    final multiMediaPickerService = locator<MultiMediaPickerService>();
    return await multiMediaPickerService.getPhotoFromGallery(
        camera: fromCamera);
  }

  /// Convert file to base64.
  ///
  /// This method uses the ImageService to convert a file to a base64 string.
  ///
  /// **params**:
  /// * `file`: File to convert
  ///
  /// **returns**:
  /// * `Future<String>`: Base64 encoded string
  Future<String> convertToBase64(File file) async {
    final imageService = locator<ImageService>();
    return await imageService.convertToBase64(file);
  }
}
