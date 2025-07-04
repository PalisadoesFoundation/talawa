// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:intl/intl.dart';
import 'package:mockito/mockito.dart';
import 'package:talawa/models/events/event_model.dart';
import 'package:talawa/models/organization/org_info.dart';
import 'package:talawa/models/user/user_info.dart';
import 'package:talawa/services/user_action_handler.dart';
import 'package:talawa/utils/post_queries.dart';
import 'package:talawa/utils/queries.dart';
import 'package:talawa/view_model/after_auth_view_models/event_view_models/edit_event_view_model.dart';

import '../../../helpers/test_helpers.dart';
import '../../../helpers/test_locator.dart';

final testEvent = Event(
  id: '1',
  name: 'test',
  description: 'test',
  startAt: '2022-01-30T18:40:00.000Z',
  endAt: '2022-01-30T19:40:00.000Z',
  creator: User(
    id: 'xzy1',
    firstName: 'Test',
    lastName: 'User',
    email: 'testuser@gmail.com',
    refreshToken: 'testtoken',
    authToken: 'testtoken',
  ),
  organization: OrgInfo(id: 'XYZ'),
);

void main() {
  setUpAll(() {
    locator.registerSingleton(ActionHandlerService());
    registerServices();
    locator.registerSingleton<Queries>(Queries());
  });
  group('EditEventViewModel Test -', () {
    test("Check if it's initialized correctly", () {
      final model = EditEventViewModel();
      model.initialize(testEvent);

      expect(model.eventTitleTextController.text, 'test');
      expect(model.eventDescriptionTextController.text, 'test');
      expect(model.eventStartDate, DateTime.parse('2022-01-30T18:40:00.000Z'));
      expect(model.eventEndDate, DateTime.parse('2022-01-30T19:40:00.000Z'));
      expect(
        model.eventStartTime,
        const TimeOfDay(hour: 18, minute: 40),
      );
      expect(
        model.eventEndTime,
        const TimeOfDay(hour: 19, minute: 40),
      );
    });
    testWidgets('Check if updateEvent() is working fine', (tester) async {
      final model = EditEventViewModel();
      model.initialize(testEvent);
      await tester.pumpWidget(
        Form(
          key: model.formKey,
          child: Container(),
        ),
      );

      final DateTime startTime = DateTime(
        model.eventStartDate.month,
        model.eventStartDate.day,
        model.eventStartDate.year,
        model.eventStartTime.hour,
        model.eventStartTime.minute,
      );
      final DateTime endTime = DateTime(
        model.eventEndDate.year,
        model.eventEndDate.month,
        model.eventEndDate.day,
        model.eventEndTime.hour,
        model.eventEndTime.minute,
      );

      final variables = {
        'title': model.eventTitleTextController.text,
        'description': model.eventDescriptionTextController.text,
        'location': model.eventLocationTextController.text,
        'isPublic': model.isPublicSwitch,
        'isRegisterable': model.isRegisterableSwitch,
        'recurring': false,
        'allDay': false,
        'startDate': DateFormat('yyyy-MM-dd').format(model.eventStartDate),
        'endDate': DateFormat('yyyy-MM-dd').format(model.eventEndDate),
        'startTime': '${DateFormat('HH:mm:ss').format(startTime)}Z',
        'endTime': '${DateFormat('HH:mm:ss').format(endTime)}Z',
      };

      when(eventService.editEvent(eventId: testEvent.id!, variables: variables))
          .thenAnswer((_) async {
        return QueryResult(
          source: QueryResultSource.network,
          data: {
            'test': true,
          },
          options: QueryOptions(document: gql(queries.joinOrgById('id'))),
        );
      });

      await model.updateEvent();

      expect(model.validate, AutovalidateMode.disabled);
    });
    testWidgets(
        'Check if updateEvent() is working fine when formkey.currenstate.validate is true',
        (tester) async {
      final model = EditEventViewModel();
      final inValidEvent = Event(
        id: '',
        name: '',
        description: '',
        startAt: '2022-01-30T18:40:00.000Z',
        endAt: '2022-01-30T19:40:00.000Z',
        creator: User(
          id: 'xzy1',
          firstName: 'Test',
          lastName: 'User',
          email: 'testuser@gmail.com',
          refreshToken: 'testtoken',
          authToken: 'testtoken',
        ),
        organization: OrgInfo(id: 'XYZ'),
      );
      model.initialize(inValidEvent);
      await tester.pumpWidget(
        Form(
          child: Container(),
        ),
      );

      when(databaseFunctions.noData).thenReturn(
        QueryResult(
          options: QueryOptions(
            document: gql(
              PostQueries().addLike(),
            ),
          ),
          data: null,
          source: QueryResultSource.network,
        ),
      );

      await model.updateEvent();

      expect(model.validate, AutovalidateMode.always);
    });
  });
}
