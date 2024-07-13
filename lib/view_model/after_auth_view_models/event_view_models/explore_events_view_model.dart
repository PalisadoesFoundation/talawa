import 'dart:async';
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
  ExploreEventsViewModel({this.demoMode = false});

  /// flag to check if the app is in demo mode.
  bool demoMode;

  final _eventService = locator<EventService>();
  StreamSubscription? _eventStreamSubscription;

  String _chosenValue = 'All Events';
  String _emptyListMessage = "Looks like there aren't any events.";
  List<Event> _events = [];
  final List<Event> _userEvents = [];
  final Set<String> _uniqueEventIds = {};
  late StreamSubscription _currentOrganizationStreamSubscription;
  late final List<Event> _bufferEvents;

  /// Getter method to retrieve the list of events.
  List<Event> get events => _events;

  /// Getter method to retrieve the list of User events.
  List<Event> get userEvents => _userEvents;

  /// Getter method to retrieve the EventService instance.
  EventService get eventService => _eventService;

  /// Getter method to retrieve the empty list message.
  String get emptyListMessage => _emptyListMessage;

  /// Getter method to retrieve the chosen value.
  String get chosenValue => _chosenValue;

  /// This function is used to fetch new events in the organization.
  ///
  /// The function uses `getEvents` method from `EventService`.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  ///   None
  Future<void> fetchNewEvents() async {
    setState(ViewState.busy);
    notifyListeners();
    await _eventService.getEvents();
    setState(ViewState.idle);
  }

  /// This function is used to refresh the events in the organization.
  ///
  /// The function uses `getEvents` method from `EventService`.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  ///   None
  Future<void> refreshEvents() async {
    setState(ViewState.busy);
    _events.clear();
    _userEvents.clear();
    _uniqueEventIds.clear();
    await _eventService.getEvents();
    setState(ViewState.idle);
  }

  /// initialiser.
  ///
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  ///   None
  Future<void> initialise() async {
    setState(ViewState.busy);
    if (!demoMode) {
      print(demoMode);
      _currentOrganizationStreamSubscription = userConfig.currentOrgInfoStream
          .listen((updatedOrganization) => refreshEvents());
      await _eventService.getEvents();

      _eventStreamSubscription = _eventService.eventStream.listen(
        (newEvent) => checkIfExistsAndAddNewEvent(newEvent),
      );
      _bufferEvents = _events;
    }
    setState(ViewState.idle);
  }

  /// This function add a new event if the event not exist.
  ///
  /// **params**:
  /// * `newEvent`: `Event` type variable containing data to create a new event.
  ///
  /// **returns**:
  ///   None
  Future<void> checkIfExistsAndAddNewEvent(Event newEvent) async {
    // Check if the event is unique and belongs to the current organization
    if (!_uniqueEventIds.contains(newEvent.id) &&
        newEvent.organization!.id == userConfig.currentOrg.id) {
      _uniqueEventIds.add(newEvent.id!);
      _events.insert(0, newEvent);
    }
    if (!_userEvents.any((event) => event.id == newEvent.id) &&
        newEvent.creator!.id == userConfig.currentUser.id) {
      _userEvents.insert(0, newEvent);
    }
    notifyListeners();
  }

  /// This function deletes the event.
  ///
  /// **params**:
  /// * `eventId`: id of the event that need to be delete.
  ///
  /// **returns**:
  ///   None
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
                _uniqueEventIds.remove(eventId);
                _events.removeWhere((element) => element.id == eventId);
                _userEvents.removeWhere((element) => element.id == eventId);
                await Future.delayed(const Duration(milliseconds: 500));
                setState(ViewState.idle);
              }
            },
          );
        },
      ),
    );
  }

  /// This function takes the choosen value from dropdown and return the filter events, if empty list then return relevant message.
  ///
  /// **params**:
  /// * `value`: choosen value from dropdown.
  ///
  ///
  /// **returns**:
  ///   None
  Future<void> choseValueFromDropdown(String value) async {
    _chosenValue = value;
    notifyListeners();
    setState(ViewState.busy);

    if (!demoMode) {
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
        case 'My Events':
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
    }
    await Future.delayed(const Duration(milliseconds: 500));
    setState(ViewState.idle);
  }

  @override
  void dispose() {
    _eventStreamSubscription?.cancel();
    _currentOrganizationStreamSubscription.cancel();
    super.dispose();
  }
}
