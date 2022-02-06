import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';
import 'package:mockito/mockito.dart';
import 'package:talawa/models/events/event_model.dart';
import 'package:talawa/view_model/after_auth_view_models/event_view_models/explore_events_view_model.dart';

class MockExploreEventsViewModel extends Mock
    implements ExploreEventsViewModel {
  @override
  late List<Event> events = [];
  late Set<String> uniqueEventIds = {};

  @override
  Future<void> initialise() async {
    events = [];
  }

  @override
  Future<List<Event>> fetchNewEvents() async {
    return events;
  }

  @override
  void checkIfExistsAndAddNewEvent(Event newEvent) {
    if (!events.contains(newEvent)) {
      events.add(newEvent);
      uniqueEventIds.add("first");
    }
  }

  @override
  Future<void> deleteEvent({required String eventId}) async {
    if (uniqueEventIds.contains(eventId)) {
      uniqueEventIds.remove(eventId);
      events.removeWhere((element) => element.id == eventId);
    }
  }
}

void main() {
  final ExploreEventsViewModel model = ExploreEventsViewModel();
  final Event event = Event(
    id: "first",
    title: "title",
    description: "desc",
    attendees: "20",
    location: "location",
    recurring: false,
    allDay: false,
    startDate: DateTime.now().toString().substring(0, 10),
    endDate: DateTime.now().toString().substring(0, 10),
    startTime: DateFormat('hh:mm:ss').format(DateTime.now()).toString(),
    endTime: DateFormat('hh:mm:ss')
        .format(DateTime.now().add(const Duration(hours: 1)))
        .toString(),
    recurrence: "none",
    isPublic: true,
    isRegistered: true,
    isRegisterable: true,
  );
  group("Check for Explore Events View Model", () {
    model.initialise();

    test("Check for no comments created.", () {
      final hasEvents = model.events.isEmpty;
      //checks if no Events ae present
      expect(hasEvents, true);
    });

    test("Check if events are added to list", () {
      model.checkIfExistsAndAddNewEvent(event);
      //checks if event is craeted and added to list
      expect(model.events.isNotEmpty, true);

      //checks if event is same as input
      expect(model.events.first.id, "first");
    });

    test("Check if events are being deleted", () {
      model.deleteEvent(eventId: "first");

      //checks if event gets deleted successfully
      expect(model.events.isNotEmpty, false);
    });
  });
}
