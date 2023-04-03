// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments

import 'dart:async';

import 'package:intl/intl.dart';
import 'package:talawa/enums/enums.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/models/events/event_model.dart';
import 'package:talawa/services/event_service.dart';
import 'package:talawa/view_model/base_view_model.dart';
import 'package:talawa/widgets/custom_alert_dialog.dart';

/// ExploreEventsViewModel class helps to interact with model to serve data to view for event explore section.
///
/// Methods include:
/// * `fetchNewEvents` : to fetch new events in the organization.
/// * `refreshEvents` : to refersh the event.
/// * `checkIfExistsAndAddNewEvent` : to check if the event exists or not, if now add a new event.
/// * `deleteEvent` : to delete the event.
/// * `choseValueFromDropdown` : to return the relevant message in the dropdown after any action.
class ExploreEventsViewModel extends BaseModel {
  final _eventService = locator<EventService>();
  late StreamSubscription _eventStreamSubscription;

  String _chosenValue = 'All Events';
  String _emptyListMessage = "Looks like there aren't any events.";
  List<Event> _events = [];
  final Set<String> _uniqueEventIds = {};
  late StreamSubscription _currentOrganizationStreamSubscription;
  late final List<Event> _bufferEvents;
  List<Event> get events => _events;
  EventService get eventService => _eventService;
  String get emptyListMessage => _emptyListMessage;

  String get chosenValue => _chosenValue;

  /// This function is used to fetch new events in the organization.
  /// The function uses `getEvents` method from `EventService`.
  Future<void> fetchNewEvents() async {
    setState(ViewState.busy);
    notifyListeners();
    await _eventService.getEvents();
    setState(ViewState.idle);
  }

  /// This function is used to refresh the events in the organization.
  /// The function uses `getEvents` method from `EventService`.
  Future<void> refreshEvents() async {
    setState(ViewState.busy);
    _events.clear();
    _uniqueEventIds.clear();
    await _eventService.getEvents();
    setState(ViewState.idle);
  }

  // initialiser
  Future<void> initialise() async {
    setState(ViewState.busy);
    _currentOrganizationStreamSubscription = userConfig.currentOrgInfoStream
        .listen((updatedOrganization) => refreshEvents());
    await _eventService.getEvents();

    _eventStreamSubscription = _eventService.eventStream.listen(
      (newEvent) => checkIfExistsAndAddNewEvent(newEvent),
    );
    _bufferEvents = _events;
    setState(ViewState.idle);
  }

  /// This function add a new event if the event not exist.
  ///
  /// params:
  /// * [newEvent] : `Event` type variable containing data to create a new event.
  Future<void> checkIfExistsAndAddNewEvent(Event newEvent) async {
    // checking if the `newEvent.id` is unique and not exist already.
    if ((!_uniqueEventIds.contains(newEvent.id)) &&
        (newEvent.organization!.id == userConfig.currentOrg.id)) {
      _uniqueEventIds.add(newEvent.id!);
      _parseEventDateTime(newEvent);
      notifyListeners();
    }
  }

  /// The helper function that used to parse the date and time.
  void _parseEventDateTime(Event newEvent) {
    // Maybe needed for the tests. Can be further discussed.
    if (newEvent.startDate == null ||
        newEvent.endDate == null ||
        newEvent.startTime == null ||
        newEvent.endTime == null) {
      newEvent.startDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
      newEvent.endDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
      newEvent.startTime = DateFormat('HH:mm:ss').format(DateTime.now());
      newEvent.endTime = DateFormat('HH:mm:ss').format(DateTime.now());
    }

    final startMoment = DateTime.parse(
      '${newEvent.startDate!} ${newEvent.startTime!}',
    ).toLocal();

    final endMoment = DateTime.parse(
      '${newEvent.endDate!} ${newEvent.endTime!}',
    ).toLocal();

    newEvent.startDate = DateFormat('yMd').format(startMoment);
    newEvent.endDate = DateFormat('yMd').format(endMoment);
    newEvent.startTime = DateFormat.jm().format(startMoment);
    newEvent.endTime = DateFormat.jm().format(endMoment);

    _events.insert(0, newEvent);
  }

  /// This function deletes the event.
  ///
  /// params:
  /// * [eventId] : id of the event that need to be delete.
  Future<void> deleteEvent({required String eventId}) async {
    // push the custom alert dialog to ask for confirmation.
    navigationService.pushDialog(
      CustomAlertDialog(
        reverse: true,
        dialogSubTitle: 'Are you sure you want to delete this event?',
        successText: 'Delete',
        success: () {
          navigationService.pop();
          _eventService.deleteEvent(eventId).then(
            (result) async {
              if (result != null) {
                navigationService.pop();
                setState(ViewState.busy);
                print(result);
                _uniqueEventIds.remove(eventId);
                _events.removeWhere((element) => element.id == eventId);
                await Future.delayed(const Duration(milliseconds: 500));
                setState(ViewState.idle);
              }
            },
          );
        },
      ),
    );
  }

  /// This function takes the choosen value from dropdown and
  /// return the filter events, if empty list then return relevant message.
  ///
  /// params:
  /// * [value] : choosen value from dropdown.
  Future<void> choseValueFromDropdown(String value) async {
    _chosenValue = value;
    notifyListeners();
    setState(ViewState.busy);

    switch (_chosenValue) {
      // if `_chosenValue` is "All events".
      case 'All Events':
        {
          // all events
          _events = _bufferEvents;
          // if list is empty
          _emptyListMessage = "Looks like there aren't any events.";
        }
        break;
      // if `_chosenValue` is "created event".
      case 'Created Events':
        {
          // loop through the `_events` list and check
          // for the creator id matched the current user id.
          _events = List.from(
            _bufferEvents.where(
              (element) => element.creator!.id == userConfig.currentUser.id,
            ),
          );
          // if list is empty
          _emptyListMessage = "You have not created any event.";
        }
        break;
      // if `_chosenValue` is "Registered Events".
      case 'Registered Events':
        {
          // loop through the `_events` list and filter elements
          // if `element.isRegistered` is true and user is not the creator.
          _events = List.from(
            _bufferEvents.where(
              (element) =>
                  element.isRegistered == true &&
                  element.creator!.id != userConfig.currentUser.id,
            ),
          );
          // if list is empty
          _emptyListMessage = "No registered events are present";
        }
        break;
      // if `_chosenValue` is "Registered Events".
      case 'Public Events':
        {
          // loop through the `_events` list and filter elements
          // with the `isPublic` as true.
          _events = _bufferEvents
              .where((element) => element.isPublic == true)
              .toList();

          // if list is empty
          _emptyListMessage = "There aren't any public events.";
        }
        break;
      case 'Private Events':
        {
          // loop through the `_events` list and filter elements
          // with the `isPublic` as false.
          _events = _bufferEvents
              .where((element) => element.isPublic == false)
              .toList();
          // if list is empty
          _emptyListMessage = "There aren't any private events.";
        }
        break;

      default:
        {
          _events = _bufferEvents;
        }
    }
    await Future.delayed(const Duration(milliseconds: 500));
    setState(ViewState.idle);
  }

  @override
  void dispose() {
    _eventStreamSubscription.cancel();
    _currentOrganizationStreamSubscription.cancel();
    super.dispose();
  }
}
