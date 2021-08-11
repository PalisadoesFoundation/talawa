import 'dart:async';

import 'package:talawa/enums/enums.dart';
import 'package:talawa/locator.dart';
import 'package:talawa/models/events/event_model.dart';
import 'package:talawa/services/event_service.dart';
import 'package:talawa/view_model/base_view_model.dart';

class ExploreEventsViewModel extends BaseModel {
  final _eventService = locator<EventService>();
  late StreamSubscription _eventStreamSubscription;

  String _chosenValue = 'My Events';
  List<Event> _events = [];

  late StreamSubscription _currentOrganizationStreamSubscription;
  late final List<Event> _bufferEvents;

  String get chosenValue => _chosenValue;
  choseValue(String value) {
    _chosenValue = value;
    notifyListeners();

    if (chosenValue == 'Private Events') {
      print(_events.length);

      _events =
          _bufferEvents.where((element) => element.isPublic == false).toList();
      print(_events.length);
    } else if (chosenValue == 'Public Events') {
      print(_events.length);

      _events =
          _bufferEvents.where((element) => element.isPublic == true).toList();
      print(_events.length);
    } else if (chosenValue == 'My Events') {
      _events = _bufferEvents;
    }
  }

  List<Event> get events => _events;

  void fetchNewEvents() {
    _eventService.getEvents();
  }

  void refreshEvents() {
    _events.clear();
    notifyListeners();
  }

  void initialise() {
    setState(ViewState.busy);
    _currentOrganizationStreamSubscription = userConfig.currentOrfInfoStream
        .listen((updatedOrganization) => refreshEvents());
    _eventStreamSubscription =
        _eventService.eventStream.listen((newEvent) => addNewEvent(newEvent));
    _eventService.getEvents();
    _bufferEvents = _events;
    setState(ViewState.idle);
  }

  @override
  void dispose() {
    // Canceling the subscription so that there will be no rebuild after the widget is disposed.
    _eventStreamSubscription.cancel();
    _currentOrganizationStreamSubscription.cancel();
    super.dispose();
  }

  addNewEvent(Event newEvent) {
    _events.insert(0, newEvent);
    notifyListeners();
  }
}
