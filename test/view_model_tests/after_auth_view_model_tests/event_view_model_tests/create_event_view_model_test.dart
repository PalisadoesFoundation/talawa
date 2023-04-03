// ignore_for_file: talawa_api_doc
// ignore_for_file: talawa_good_doc_comments

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';
import 'package:mockito/mockito.dart';
import 'package:talawa/models/user/user_info.dart';
import 'package:talawa/router.dart' as router;
import 'package:talawa/services/graphql_config.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/utils/event_queries.dart';
import 'package:talawa/utils/validators.dart';
import 'package:talawa/view_model/after_auth_view_models/event_view_models/create_event_view_model.dart';

import '../../../helpers/test_helpers.dart';
import '../../../helpers/test_locator.dart';

class MockBuildContext extends Mock implements BuildContext {}

class MockCallbackFunction extends Mock {
  void call();
}

Widget createApp(
  GlobalKey<FormState> formKey,
  TextEditingController eventTitleTextController,
  TextEditingController eventLocationTextController,
  TextEditingController eventDescriptionTextController,
) {
  return MaterialApp(
    locale: const Locale('en'),
    localizationsDelegates: [
      const AppLocalizationsDelegate(isTest: true),
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
    ],
    home: Scaffold(
      body: Container(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              TextFormField(
                controller: eventTitleTextController,
              ),
              TextFormField(
                controller: eventLocationTextController,
              ),
              TextFormField(
                controller: eventDescriptionTextController,
              ),
            ],
          ),
        ),
      ),
    ),
    navigatorKey: navigationService.navigatorKey,
    onGenerateRoute: router.generateRoute,
  );
}

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

  group('Create Event Tests', () {
    test("test getCurrentOrgUsersList with isAdmin false", () async {
      final model = CreateEventViewModel();
      model.initialize();

      final User user1 = User(id: "fakeUser1");
      final User user2 = User(id: "fakeUser2");
      final List<User> users = [user1, user2];

      when(organizationService.getOrgMembersList("XYZ"))
          .thenAnswer((realInvocation) async {
        return users;
      });

      await model.getCurrentOrgUsersList();

      bool isListCorrect = true;

      users.forEach((user) {
        final bool x = model.memberCheckedMap.containsKey(user.id);
        if (!x) {
          isListCorrect = false;
        }
      });

      expect(isListCorrect, true);
    });

    testWidgets("testing createEvent function", (tester) async {
      final model = CreateEventViewModel();
      model.initialize();
      await tester.pumpWidget(
        createApp(
          model.formKey,
          model.eventTitleTextController,
          model.eventLocationTextController,
          model.eventDescriptionTextController,
        ),
      );

      final DateTime startMoment = DateTime(
        model.eventStartDate.year,
        model.eventStartDate.month,
        model.eventStartDate.day,
        model.eventStartTime.hour,
        model.eventStartTime.minute,
      );
      final DateTime endMoment = DateTime(
        model.eventEndDate.year,
        model.eventEndDate.month,
        model.eventEndDate.day,
        model.eventEndTime.hour,
        model.eventEndTime.minute,
      );

      await tester.pump();
      await tester.pumpAndSettle();

      await tester.enterText(
        find.byType(TextFormField).first,
        'fakeEventTitle',
      );
      await tester.enterText(
        find.byType(TextFormField).last,
        'fakeEventDescription',
      );
      await tester.enterText(
        find.byType(TextFormField).at(1),
        'fakeEventLocation',
      );
      databaseFunctions.init();

      when(databaseFunctions.refreshAccessToken("testtoken"))
          .thenAnswer((realInvocation) async {
        return true;
      });

      when(
        databaseFunctions.gqlAuthMutation(
          EventQueries().addEvent(),
          variables: {
            'startDate': DateFormat('yyyy-MM-dd').format(startMoment),
            'endDate': DateFormat('yyyy-MM-dd').format(endMoment),
            'organizationId': "XYZ",
            'title': model.eventTitleTextController.text,
            'description': model.eventDescriptionTextController.text,
            'location': model.eventLocationTextController.text,
            'isPublic': model.isPublicSwitch,
            'isRegisterable': model.isRegisterableSwitch,
            'recurring': false,
            'allDay': false,
            'startTime': '${DateFormat('HH:mm:ss').format(startMoment)}Z',
            'endTime': '${DateFormat('HH:mm:ss').format(endMoment)}Z',
          },
        ),
      ).thenAnswer((_) async {
        return true;
      });

      await model.createEvent();

      verify(
        databaseFunctions.gqlAuthMutation(
          EventQueries().addEvent(),
          variables: {
            'startDate': DateFormat('yyyy-MM-dd').format(startMoment),
            'endDate': DateFormat('yyyy-MM-dd').format(endMoment),
            'organizationId': "XYZ",
            'title': model.eventTitleTextController.text,
            'description': model.eventDescriptionTextController.text,
            'location': model.eventLocationTextController.text,
            'isPublic': model.isPublicSwitch,
            'isRegisterable': model.isRegisterableSwitch,
            'recurring': false,
            'allDay': false,
            'startTime': '${DateFormat('HH:mm:ss').format(startMoment)}Z',
            'endTime': '${DateFormat('HH:mm:ss').format(endMoment)}Z',
          },
        ),
      );

      verify(navigationService.pop());
    });

    test("test getImageFromGallery and removeImage functions", () async {
      final notifyListenerCallback = MockCallbackFunction();
      final model = CreateEventViewModel()..addListener(notifyListenerCallback);
      model.initialize();

      // testing getImageFromGallery
      // with camera false
      when(multimediaPickerService.getPhotoFromGallery(camera: false))
          .thenAnswer((realInvocation) async {
        return null;
      });

      await model.getImageFromGallery();
      verify(multimediaPickerService.getPhotoFromGallery(camera: false));
      expect(model.imageFile, null);

      // with camera true
      final file = File('fakePath');
      when(multimediaPickerService.getPhotoFromGallery(camera: true))
          .thenAnswer((_) async {
        return file;
      });
      await model.getImageFromGallery(camera: true);
      verify(multimediaPickerService.getPhotoFromGallery(camera: true));
      expect(model.imageFile, file);
      verify(notifyListenerCallback());

      // testing removeImage
      model.removeImage();
      expect(model.imageFile, null);
      verify(notifyListenerCallback());
    });

    test('check that empty values are not accepted for required fields', () {
      final String? emptyTitle = Validator.validateEventForm("", "Title");
      expect(emptyTitle, "Title must not be left blank.");

      final String? emptyLocation = Validator.validateEventForm("", "Location");
      expect(emptyLocation, "Location must not be left blank.");

      final String? emptyDescription =
          Validator.validateEventForm("", "Description");
      expect(emptyDescription, "Description must not be left blank.");
    });

    test('Check validators return null for valid values', () {
      final String? validTitle =
          Validator.validateEventForm("Test Title", "Title");
      expect(validTitle, null);

      final String? validLocation =
          Validator.validateEventForm("Test Location", "Location");
      expect(validLocation, null);

      final String? validDescription =
          Validator.validateEventForm("Test Description", "Description");
      expect(validDescription, null);
    });

    test('Check addition of members', () {
      final model = CreateEventViewModel();
      model.initialize();

      final List<User> allMembers =
          userConfig.currentOrg.members! + userConfig.currentOrg.admins!;
      model.orgMembersList = allMembers;

      // non admins (normal members)
      final List<User> usersInCurrentOrg = userConfig.currentOrg.members!;
      model.memberCheckedMap[usersInCurrentOrg.first.id!] = true;
      model.buildUserList();
      final bool isMemberFound =
          model.selectedMembers.contains(usersInCurrentOrg.first);
      expect(isMemberFound, true);
    });

    test('Removing of members from event', () {
      final model = CreateEventViewModel();
      model.initialize();
      final List<User> allMembers =
          userConfig.currentOrg.members! + userConfig.currentOrg.admins!;
      model.orgMembersList = allMembers;

      // non admins (normal members)
      // to remove, first we need to add a member
      final List<User> usersInCurrentOrg = userConfig.currentOrg.members!;
      model.memberCheckedMap[usersInCurrentOrg.first.id!] = true;
      model.buildUserList();
      model.removeUserFromList(
        userId: usersInCurrentOrg.first.id!,
      );
      final bool isMemberFound =
          model.selectedMembers.contains(usersInCurrentOrg.first);
      expect(isMemberFound, false);
    });
  });
}
