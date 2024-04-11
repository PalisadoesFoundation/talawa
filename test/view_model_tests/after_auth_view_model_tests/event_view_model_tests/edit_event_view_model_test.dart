// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';
import 'package:talawa/models/events/event_model.dart';
import 'package:talawa/models/organization/org_info.dart';
import 'package:talawa/models/user/user_info.dart';
import 'package:talawa/view_model/after_auth_view_models/event_view_models/edit_event_view_model.dart';

import '../../../helpers/test_helpers.dart';

final testEvent = Event(
  id: '1',
  title: 'test',
  startDate: '2024-01-30', // yyyy-MM-dd
  endDate: '2024-01-30',
  startTime: '06:40:00',
  endTime: '06:40:00',
  location: 'ABC',
  description: 'test',
  creator: User(
    id: 'xzy1',
    firstName: 'Test',
    lastName: 'User',
    email: 'testuser@gmail.com',
    refreshToken: 'testtoken',
    authToken: 'testtoken',
  ),
  isPublic: true,
  isRegisterable: true,
  organization: OrgInfo(id: 'XYZ'),
);

void main() {
  setUp(() {
    registerServices();
  });
  group('EditEventViewModel Test -', () {
    test("Check if it's initialized correctly", () {
      final model = EditEventViewModel();
      model.initialize(testEvent);

      expect(model.eventTitleTextController.text, 'test');
      expect(model.eventLocationTextController.text, 'ABC');
      expect(model.eventDescriptionTextController.text, 'test');
      expect(model.isPublicSwitch, true);
      expect(model.isRegisterableSwitch, true);
      expect(
        model.eventStartDate,
        DateFormat('yyyy-MM-dd').parse('2024-01-30'),
      );
      expect(model.eventEndDate, DateFormat('yyyy-MM-dd').parse('2024-01-30'));
      expect(
        model.eventStartTime,
        TimeOfDay.fromDateTime(DateFormat("HH:mm:ss").parse("06:40:00")),
      );
      expect(
        model.eventEndTime,
        TimeOfDay.fromDateTime(DateFormat("HH:mm:ss").parse("06:40:00")),
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

      await model.updateEvent();

      expect(model.validate, AutovalidateMode.disabled);
    });
  });
}
