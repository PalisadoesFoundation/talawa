import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:talawa/models/events/event_model.dart';
import 'package:talawa/models/organization/org_info.dart';
import 'package:talawa/services/database_mutation_functions.dart';
import 'package:talawa/services/user_config.dart';
import 'package:talawa/utils/event_queries.dart';

import 'package:talawa/services/event_service.dart';
import 'package:talawa/widgets/custom_progress_dialog.dart';

import '../widget_tests/widgets/task_schedule_test.dart';

class MockUserConfig extends Mock implements UserConfig {}

class MockDataBaseMutationFunctions extends Mock
    implements DataBaseMutationFunctions {}

void main() {
  late EventService eventService;
  late MockUserConfig mockUserConfig;
  late MockDataBaseMutationFunctions mockDataBaseMutationFunctions;

  setUp(() {
    mockUserConfig = MockUserConfig();
    mockDataBaseMutationFunctions = MockDataBaseMutationFunctions();
    eventService = EventService();
    eventService._userConfig = mockUserConfig;
    eventService._dbFunctions = mockDataBaseMutationFunctions;
  });

  group('setOrgStreamSubscription', () {
    test('sets the stream subscription for the organization', () async {
      final orgInfo = OrgInfo(id: 'org_001', name: 'Test Organization');
      final orgInfoStream = Stream<OrgInfo>.value(orgInfo);
      when(mockUserConfig.currentOrgInfoStream)
          .thenAnswer((_) => orgInfoStream);

      eventService.setOrgStreamSubscription();
      await Future.delayed(Duration(milliseconds: 100));

      expect(eventService._currentOrg, equals(orgInfo));
    });
  });

  group('fetchRegistrantsByEvent', () {
    test('registration details', () async {
      final eventId = '12345';
      final expectedQuery = EventQueries().registrantsByEvent(eventId);
      final expectedResult = {
        'registrants': ['Alice', 'Bob']
      };

      when(mockDataBaseMutationFunctions.refreshAccessToken(any))
          .thenAnswer((_) async => null);
      when(mockDataBaseMutationFunctions.gqlAuthQuery(expectedQuery))
          .thenAnswer((_) async => expectedResult);

      // Act
      final result = await myFunctions.fetchRegistrantsByEvent(eventId);

      // Assert
      verify(mockDataBaseMutationFunctions
              .refreshAccessToken(userConfig.currentUser.refreshToken!))
          .called(1);
      verify(mockDataBaseMutationFunctions.gqlAuthQuery(expectedQuery))
          .called(1);
      expect(result, expectedResult);
    });
  });
  group('getEvents', () {
    test('fetches all events of an organization', () async {
      final orgInfo = OrgInfo(id: 'org_001', name: 'Test Organization');
      final event1 = Event(id: 'event_001', title: 'Test Event 1');
      final event2 = Event(id: 'event_002', title: 'Test Event 2');
      //final events = [event1.toJson(), event2.toJson()];

      when(mockUserConfig.currentOrg).thenReturn(orgInfo);
      when(mockUserConfig.currentUser.id).thenReturn('user_001');
      when(mockDataBaseMutationFunctions.refreshAccessToken('testtoken'))
          .thenAnswer((_) async => true);
      when(mockDataBaseMutationFunctions.init()).thenAnswer((_) async => true);
      when(mockDataBaseMutationFunctions.gqlAuthMutation(any))
          .thenAnswer((_) async => {
                'data': {'eventsByOrganization': events}
              });

      await eventService.getEvents();

      expect(eventService.eventStream, emitsInOrder([event1, event2]));
    });
  });
  group('fetchRegistrantsByEvent', () {
    test('returns registrants for event', () async {
      // Arrange
      final registrants = [
        {'id': '1', 'name': 'John Doe'},
        {'id': '2', 'name': 'Jane Doe'},
      ];
      final eventQuery = EventQueries().registrantsByEvent(_eventId);
      final gqlAuthQueryMock = (query) async => registrants;

      // Mock the dependencies
      _dbFunctions.refreshAccessToken = (_) async {};
      _dbFunctions.gqlAuthQuery = gqlAuthQueryMock;
      _userConfig.currentUser.refreshToken = 'refresh_token';

      // Act
      final result = await fetchRegistrantsByEvent(_eventId);

      // Assert
      expect(result, equals(registrants));
      expect(_dbFunctions.refreshAccessToken, calledOnce);
      expect(_dbFunctions.gqlAuthQuery, calledOnceWith(eventQuery));
    });
  });
  group('registerForAnEvent', () {
    test('should return the result from gqlAuthMutation', () async {
      // Arrange
      final eventId = 'event_id';
      final expected = Future.value('result');
      final tokenResult = Future.value('token_result');
      final Map<String, dynamic> variables = {'eventId': eventId};

      when(mockDBFunctions.refreshAccessToken(any))
          .thenAnswer((_) => tokenResult);
      when(mockDBFunctions.gqlAuthMutation(any,
              variables: anyNamed('variables')))
          .thenAnswer((_) => expected);

      // Act
      final result = await registerEvent.registerForAnEvent(eventId);

      // Assert
      expect(result, expected);
      verify(mockDBFunctions
              .refreshAccessToken(userConfig.currentUser.refreshToken!))
          .called(1);
      verify(mockDBFunctions.gqlAuthMutation(EventQueries().registerForEvent(),
              variables: variables))
          .called(1);
    });
  });

  group('deleteEvent', () {
    test('should show a custom progress dialog and return the result',
        () async {
      // Arrange
      final eventId = 'event_id';
      final expected = Future.value('result');
      final tokenResult = Future.value('token_result');

      when(mockNavigationService.pushDialog(
              CustomProgressDialog(key: Key('DeleteEventProgress'))))
          .thenAnswer((_) => null);
      when(mockDBFunctions.refreshAccessToken(any))
          .thenAnswer((_) => tokenResult);
      when(mockDBFunctions.gqlAuthMutation(any)).thenAnswer((_) => expected);
      when(mockNavigationService.pop()).thenAnswer((_) => null);

      // Act
      final result = await deleteEvent.deleteEvent(eventId);

      // Assert
      expect(result, expected);
      verify(mockNavigationService.pushDialog(
              CustomProgressDialog(key: Key('DeleteEventProgress'))))
          .called(1);
      verify(mockDBFunctions
              .refreshAccessToken(userConfig.currentUser.refreshToken!))
          .called(1);
      verify(mockDBFunctions
              .gqlAuthMutation(EventQueries().deleteEvent(eventId)))
          .called(1);
      verify(mockNavigationService.pop()).called(1);
    });
  });

  group('editEvent', () {
    test(
        'should show a custom progress dialog and navigate to main screen on success',
        () async {
      // Arrange
      final eventId = 'event_id';
      final variables = {'variable1': 'value1', 'variable2': 'value2'};
      final expected = Future.value('result');
      final tokenResult = Future.value('token_result');

      when(mockNavigationService
              .pushDialog(CustomProgressDialog(key: Key('EditEventProgress'))))
          .thenAnswer((_) => null);
      when(mockDBFunctions.refreshAccessToken(any))
          .thenAnswer((_) => tokenResult);
      when(mockDBFunctions.gqlAuthMutation(any)).thenAnswer((_) => expected);
      when(mockNavigationService.pop()).thenAnswer((_) => null);
      when(mockNavigationService.removeAllAndPush('/mainScreen', '/'))
          .thenAnswer((_) => null);

      // Act
      await editEvent.editEvent(eventId: eventId, variables: variables);

      // Assert
      verify(mockNavigationService
              .pushDialog(CustomProgressDialog(key: Key('EditEventProgress'))))
          .called(1);
      verify(mockDBFunctions
              .refreshAccessToken(userConfig.currentUser.refreshToken!))
          .called(1);
      verify(mockDBFunctions.gqlAuthMutation(
              EventQueries().updateEvent(eventId: eventId),
              variables: variables))
          .called(1);
      verify(mockNavigationService.pop()).called(1);
      verify(mockNavigationService.removeAllAndPush('/mainScreen', '/'))
          .called(1);
    });
  });

// More tests can be written for the other functions of the EventService class.
}
