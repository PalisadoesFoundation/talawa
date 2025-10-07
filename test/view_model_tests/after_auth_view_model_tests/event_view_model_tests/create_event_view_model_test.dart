// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments

import 'package:flutter_test/flutter_test.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:mockito/mockito.dart';
import 'package:talawa/constants/recurrence_values.dart';
import 'package:talawa/models/user/user_info.dart';
import 'package:talawa/view_model/after_auth_view_models/event_view_models/create_event_view_model.dart';

import '../../../helpers/test_helpers.dart';
import '../../../helpers/test_locator.dart';

class MockCallbackFunction extends Mock {
  void call();
}

void main() {
  setUpAll(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    testSetupLocator();
  });

  setUp(() {
    registerServices();
  });

  tearDown(() {
    unregisterServices();
  });

  group('CreateEventViewModel Tests', () {
    test('initializes with default values', () {
      final model = CreateEventViewModel();

      expect(model.orgMembersList, isEmpty);
      expect(model.selectedMembers, isEmpty);
      expect(model.memberCheckedMap, isEmpty);
      expect(model.isPublicSwitch, true);
      expect(model.isRegisterableSwitch, true);
      expect(model.isAllDay, true);
      expect(model.isRecurring, false);
    });

    test('fetchVenues returns empty list when data is null', () async {
      final model = CreateEventViewModel();

      final mockQueryResult = QueryResult(
        source: QueryResultSource.network,
        data: null,
        options: QueryOptions(document: gql(queries.venueListQuery())),
      );

      when(
        databaseFunctions.gqlAuthQuery(
          queries.venueListQuery(),
          variables: {"orgId": 'XYZ'},
        ),
      ).thenAnswer((_) async => mockQueryResult);

      final result = await model.fetchVenues();

      expect(result, isEmpty);
    });

    test('fetchVenues returns venue list successfully', () async {
      final model = CreateEventViewModel();

      final mockQueryResult = QueryResult(
        source: QueryResultSource.network,
        data: {
          'getVenueByOrgId': [
            {
              'id': '1',
              'name': 'Venue 1',
              'capacity': 100,
              'imageUrl': 'url1',
              'description': 'Description 1',
            },
            {
              'id': '2',
              'name': 'Venue 2',
              'capacity': 200,
              'imageUrl': 'url2',
              'description': 'Description 2',
            },
          ],
        },
        options: QueryOptions(document: gql(queries.venueListQuery())),
      );

      when(
        databaseFunctions.gqlAuthQuery(
          queries.venueListQuery(),
          variables: {"orgId": 'XYZ'},
        ),
      ).thenAnswer((_) async => mockQueryResult);

      final result = await model.fetchVenues();

      expect(result.length, 2);
      expect(result[0].name, 'Venue 1');
      expect(result[0].capacity, 100);
      expect(result[1].name, 'Venue 2');
      expect(result[1].capacity, 200);
    });

    test('getCurrentOrgUsersList populates members list', () async {
      final model = CreateEventViewModel();

      final user1 = User(id: "user1", firstName: "Test1");
      final user2 = User(id: "user2", firstName: "Test2");
      final users = [user1, user2];

      when(organizationService.getOrgMembersList("XYZ"))
          .thenAnswer((_) async => users);

      final result = await model.getCurrentOrgUsersList();

      expect(result.length, 2);
      expect(model.orgMembersList.length, 2);
      expect(model.memberCheckedMap.containsKey("user1"), true);
      expect(model.memberCheckedMap.containsKey("user2"), true);
      expect(model.memberCheckedMap["user1"], false);
      expect(model.memberCheckedMap["user2"], false);
    });

    test('buildUserList adds selected members correctly', () {
      final model = CreateEventViewModel();

      final user1 = User(id: "user1", firstName: "Test1");
      final user2 = User(id: "user2", firstName: "Test2");
      model.orgMembersList = [user1, user2];
      model.memberCheckedMap["user1"] = true;
      model.memberCheckedMap["user2"] = false;

      model.buildUserList();

      expect(model.selectedMembers.length, 1);
      expect(model.selectedMembers.first.id, "user1");
    });

    test('buildUserList clears and rebuilds selected members', () {
      final model = CreateEventViewModel();

      final user1 = User(id: "user1", firstName: "Test1");
      final user2 = User(id: "user2", firstName: "Test2");
      model.orgMembersList = [user1, user2];

      // First selection
      model.memberCheckedMap["user1"] = true;
      model.buildUserList();
      expect(model.selectedMembers.length, 1);

      // Change selection
      model.memberCheckedMap["user1"] = false;
      model.memberCheckedMap["user2"] = true;
      model.buildUserList();

      expect(model.selectedMembers.length, 1);
      expect(model.selectedMembers.first.id, "user2");
    });

    test('removeUserFromList removes user and updates state', () {
      final model = CreateEventViewModel();
      final notifyListenerCallback = MockCallbackFunction();
      model.addListener(notifyListenerCallback);

      final user1 = User(id: "user1", firstName: "Test1");
      model.orgMembersList = [user1];
      model.memberCheckedMap["user1"] = true;
      model.buildUserList();

      model.removeUserFromList(userId: "user1");

      expect(model.selectedMembers, isEmpty);
      expect(model.memberCheckedMap["user1"], false);
      verify(notifyListenerCallback()).called(greaterThan(0));
    });

    test('clearFormState resets all fields to defaults', () {
      final model = CreateEventViewModel();

      // Set various values
      model.eventTitleTextController.text = 'Title';
      model.eventLocationTextController.text = 'Location';
      model.eventDescriptionTextController.text = 'Description';
      model.isPublicSwitch = false;
      model.isRegisterableSwitch = false;
      model.isAllDay = false;
      model.isRecurring = true;
      model.frequency = Frequency.daily;
      model.weekDays = {WeekDays.monday};
      model.interval = 5;
      model.count = 10;

      model.clearFormState();

      expect(model.eventTitleTextController.text, isEmpty);
      expect(model.eventLocationTextController.text, isEmpty);
      expect(model.eventDescriptionTextController.text, isEmpty);
      expect(model.repeatsEveryCountController.text, '1');
      expect(model.isPublicSwitch, true);
      expect(model.isRegisterableSwitch, true);
      expect(model.isAllDay, true);
      expect(model.isRecurring, false);
      expect(model.frequency, Frequency.weekly);
      expect(model.weekDays, isEmpty);
      expect(model.interval, 1);
      expect(model.count, null);
      expect(model.selectedMembers, isEmpty);
      expect(model.memberCheckedMap, isEmpty);
    });

    test('clearFormState resets recurrence settings', () {
      final model = CreateEventViewModel();

      model.isRecurring = true;
      model.count = 10;
      model.recurrenceEndDate = DateTime.now();
      model.never = false;
      model.byMonth = [6, 12];
      model.byMonthDay = [15];

      model.clearFormState();

      expect(model.isRecurring, false);
      expect(model.count, null);
      expect(model.recurrenceEndDate, null);
      expect(model.never, true);
      expect(model.byMonth, null);
      expect(model.byMonthDay, null);
    });

    test('clearFormState resets image file', () {
      final model = CreateEventViewModel();

      model.imageFile = null; // Simulate having an image

      model.clearFormState();

      expect(model.imageFile, null);
    });
  });
}
