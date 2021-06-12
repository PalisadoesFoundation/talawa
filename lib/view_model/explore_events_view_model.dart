import 'package:talawa/demo_server_data/events_demo_data.dart';
import 'package:talawa/models/events/event_model.dart';
import 'package:talawa/models/organization/org_info.dart';
import 'package:talawa/view_model/base_view_model.dart';

class ExploreEventsViewModel extends BaseModel {
  String _chosenValue = 'My Events';
  final List<Event> _events = [];
  late OrgInfo currentOrg;

  String get chosenValue => _chosenValue;
  choseValue(String value) {
    _chosenValue = value;
    notifyListeners();
  }

  List<Event> get events => _events;

  void initialise(OrgInfo org) {
    currentOrg = org;
    print('page refreshed');
    const eventJsonResult = eventsDemoData;

    eventJsonResult.forEach((eventJsonData) {
      _events.add(Event.fromJson(eventJsonData));
    });
  }
}
