import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:talawa/models/events/event_model.dart';
import 'package:talawa/services/graphql_config.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/view_model/after_auth_view_models/event_view_models/event_info_view_model.dart';
import '../helpers/test_helpers.dart';
import '../helpers/test_locator.dart';

class MockBuildContext extends Mock implements BuildContext {}

void main() {
  testSetupLocator();
  locator<GraphqlConfig>().test();
  locator<SizeConfig>().test();

  setUp(() {
    registerServices();
    locator<SizeConfig>().test();
  });

  tearDown(() {
    unregisterServices();
  });

  group('Event Info Tests', () {
    final model = EventInfoViewModel();

    test("Test register for event" , () async{
      final Event event1 = Event(id: "1" , isRegisterable: true);
      model.event = event1;
      final mockEventService = getAndRegisterEventService();

      expect(model.getFabTitle(), "Register");

      // if registerForEvent is called with blank string
      when(mockEventService.registerForAnEvent("")).thenAnswer((realInvocation) async{
        return "ID can't be blank.";
      });

      final res = await mockEventService.registerForAnEvent("");
      expect(res , "ID can't be blank.");

      // if registerForEvent is given proper id
      when(mockEventService.registerForAnEvent(event1.id!)).thenAnswer((realInvocation) async{
        event1.isRegistered = true;
        return event1;
      });

      final res2 = await mockEventService.registerForAnEvent(event1.id!);
      expect(res2 , event1);

      // since the event is now registered the fab title must change to "Registered"
      expect(model.getFabTitle(), "Registered");
    });

    test("Test getFabTitle function" , (){
      final Event event1 = Event(id: "1" , isRegisterable: false);
      model.event = event1;
      expect(model.getFabTitle(), "Not Registrable");

      final Event event2 = Event(id: "2" , isRegisterable: true , isRegistered: false);
      model.event = event2;
      expect(model.getFabTitle(), "Register");

      final Event event3 = Event(id: "3" , isRegisterable: true , isRegistered: true);
      model.event = event3;
      expect(model.getFabTitle(), "Registered");
    });
  });
}
