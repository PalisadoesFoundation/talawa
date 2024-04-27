// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/view_model/after_auth_view_models/event_view_models/edit_event_view_model.dart';
import 'package:talawa/views/after_auth_screens/events/edit_events_form.dart';

import '../../../helpers/test_helpers.dart';

Widget createEditEventForm(EditEventViewModel model) =>
    MaterialApp(home: Scaffold(body: EditEventForm(model: model)));

void main() {
  SizeConfig().test();
  setUp(() {
    registerServices();
    registerViewModels();
  });
  tearDown(() {
    unregisterViewModels();
  });
  group('Test EditEventForm', () {
    testWidgets('Test titleFocus', (tester) async {
      final model = EditEventViewModel();

      await tester.pumpWidget(createEditEventForm(model));

      await tester.tap(find.byIcon(Icons.edit).first);

      expect(model.titleFocus.hasFocus, true);
    });
    testWidgets('Test locationFocus', (tester) async {
      final model = EditEventViewModel();

      await tester.pumpWidget(createEditEventForm(model));

      await tester.tap(find.byIcon(Icons.edit).at(1));

      expect(model.locationFocus.hasFocus, true);
    });
    testWidgets('Test descriptionFocus', (tester) async {
      final model = EditEventViewModel();

      await tester.pumpWidget(createEditEventForm(model));

      await tester.tap(find.byIcon(Icons.edit).last);

      expect(model.descriptionFocus.hasFocus, true);
    });
    testWidgets('Test descriptionFocus', (tester) async {
      final model = EditEventViewModel();

      await tester.pumpWidget(createEditEventForm(model));

      expect(model.formKey.currentState!.validate(), false);
    });
  });
}
