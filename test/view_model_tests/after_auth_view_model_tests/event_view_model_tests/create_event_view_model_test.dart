import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:intl/intl.dart';
import 'package:mockito/mockito.dart';
import 'package:talawa/constants/recurrence_values.dart';
import 'package:talawa/models/user/user_info.dart';
import 'package:talawa/router.dart' as router;
import 'package:talawa/services/event_service.dart';
import 'package:talawa/services/graphql_config.dart';
import 'package:talawa/services/size_config.dart';
import 'package:talawa/utils/app_localization.dart';
import 'package:talawa/utils/event_queries.dart';
import 'package:talawa/utils/validators.dart';
import 'package:talawa/view_model/after_auth_view_models/event_view_models/create_event_view_model.dart';
import 'package:talawa/view_model/connectivity_view_model.dart';

import '../../../helpers/test_helpers.dart';
import '../../../helpers/test_locator.dart';

/// `MockBuildContext` class represents mock instance of Build context.
class MockBuildContext extends Mock implements BuildContext {}

/// Instance of callback function.
class MockCallbackFunction extends Mock {
  /// Callback function.
  ///
  /// **params**:
  ///   None
  ///
  /// **returns**:
  ///   None
  void call();
}

/// a_line_ending_with_end_punctuation.
///
/// more_info_if_required
///
/// **params**:
/// * `formKey`: define_the_param
/// * `eventTitleTextController`: define_the_param
/// * `eventLocationTextController`: define_the_param
/// * `eventDescriptionTextController`: define_the_param
///
/// **returns**:
/// * `Widget`: define_the_return
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
  setUp(() {
    registerServices();
  });
  tearDown(() {
    unregisterServices();
  });
  setUpAll(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    testSetupLocator();
    locator<GraphqlConfig>().test();
    locator<SizeConfig>().test();
    locator<SizeConfig>().test();
    getAndRegisterDatabaseMutationFunctions();
  });

  group('Create Event Tests', () {
    test('check if fetchVenues method work properly when null is thrown', () {
      final model = CreateEventViewModel();
      model.initialize();
      final mockQueryResult = QueryResult(
        source: QueryResultSource.network,
        data: null,
        options: QueryOptions(document: gql(queries.venueListQuery())),
      );

      when(
        databaseFunctions.gqlAuthQuery(
          queries.venueListQuery(),
          variables: {
            "orgId": 'XYZ',
          },
        ),
      ).thenAnswer((_) async => mockQueryResult);

      model.fetchVenues();
    });
    test('check if fetchVenues method work properly', () {
      final model = CreateEventViewModel();
      model.initialize();

      final mockQueryResult = QueryResult(
        source: QueryResultSource.network,
        data: {
          'getVenueByOrgId': [
            {
              'id': '1',
              'name': 'Mock Venue 1',
              'capacity': 100,
              'imageUrl': '',
              'description': 'aaa',
            },
            {
              'id': '2',
              'name': 'Mock Venue 2',
              'capacity': 150,
              'imageUrl': '',
              'description': 'aaa',
            },
          ],
        },
        options: QueryOptions(document: gql(queries.venueListQuery())),
      );

      when(
        databaseFunctions.gqlAuthQuery(
          queries.venueListQuery(),
          variables: {
            "orgId": 'XYZ',
          },
        ),
      ).thenAnswer((_) async => mockQueryResult);

      model.fetchVenues();
    });
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

      final variables = {
        'data': {
          'title': model.eventTitleTextController.text,
          'description': model.eventDescriptionTextController.text,
          'location': model.eventLocationTextController.text,
          'isPublic': model.isPublicSwitch,
          'isRegisterable': model.isRegisterableSwitch,
          'recurring': model.isRecurring,
          'allDay': true,
          'organizationId': 'XYZ',
          'startDate': DateFormat('yyyy-MM-dd').format(startMoment),
          'endDate': DateFormat('yyyy-MM-dd').format(endMoment),
          'startTime': model.isAllDay
              ? null
              : '${DateFormat('HH:mm:ss').format(startMoment)}Z',
          'endTime': model.isAllDay
              ? null
              : '${DateFormat('HH:mm:ss').format(endMoment)}Z',
        },
        if (model.isRecurring)
          'recurrenceRuleData': {
            'recurrenceStartDate':
                DateFormat('yyyy-MM-dd').format(model.recurrenceStartDate),
            'recurrenceEndDate': model.recurrenceEndDate != null
                ? DateFormat('yyyy-MM-dd').format(model.recurrenceEndDate!)
                : null,
            'frequency': model.frequency,
            'weekDays': (model.frequency == Frequency.weekly ||
                    (model.frequency == Frequency.monthly &&
                        model.weekDayOccurenceInMonth != null))
                ? model.weekDays.toList()
                : null,
            'interval': model.interval,
            'count': model.count,
            'weekDayOccurenceInMonth': model.weekDayOccurenceInMonth,
          },
      };

      when(
        locator<EventService>().createEvent(variables: variables),
      ).thenAnswer((_) async {
        return QueryResult(
          options: QueryOptions(document: gql(EventQueries().addEvent())),
          exception: OperationException(
            graphqlErrors: [],
          ),
          data: {
            'test': 'data',
          },
          source: QueryResultSource.network,
        );
      });

      await model.createEvent();

      verify(
        locator<EventService>().createEvent(
          variables: variables,
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

    test('setEventEndDate should set the event end date and notify listeners',
        () {
      final model = CreateEventViewModel();
      model.initialize();

      final newDate = DateTime.now().add(const Duration(days: 1));
      final notifyListenerCallback = MockCallbackFunction();
      model.addListener(notifyListenerCallback);

      model.setEventEndDate(newDate);

      expect(model.eventEndDate, newDate);
      verify(notifyListenerCallback()).called(1);
    });

    testWidgets("testing createEvent function (Recurring)", (tester) async {
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

      model.isRecurring = true;

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

      model.weekDayOccurenceInMonth = 1;
      model.recurrenceEndDate = DateTime.now();
      model.frequency = 'MONTHLY';

      final vars = {
        'data': {
          'title': model.eventTitleTextController.text,
          'description': model.eventDescriptionTextController.text,
          'location': model.eventLocationTextController.text,
          'isPublic': model.isPublicSwitch,
          'isRegisterable': model.isRegisterableSwitch,
          'recurring': model.isRecurring,
          'allDay': true,
          'organizationId': 'XYZ',
          'startDate': DateFormat('yyyy-MM-dd').format(startMoment),
          'endDate': DateFormat('yyyy-MM-dd').format(endMoment),
          'startTime': model.isAllDay
              ? null
              : '${DateFormat('HH:mm:ss').format(startMoment)}Z',
          'endTime': model.isAllDay
              ? null
              : '${DateFormat('HH:mm:ss').format(endMoment)}Z',
        },
        if (model.isRecurring)
          'recurrenceRuleData': {
            'recurrenceStartDate':
                DateFormat('yyyy-MM-dd').format(model.recurrenceStartDate),
            'recurrenceEndDate': model.recurrenceEndDate != null
                ? DateFormat('yyyy-MM-dd').format(model.recurrenceEndDate!)
                : null,
            'frequency': model.frequency,
            'weekDays': (model.frequency == Frequency.weekly ||
                    (model.frequency == Frequency.monthly &&
                        model.weekDayOccurenceInMonth != null))
                ? model.weekDays.toList()
                : null,
            'interval': model.interval,
            'count': model.count,
            'weekDayOccurenceInMonth': model.weekDayOccurenceInMonth,
          },
      };

      when(
        locator<EventService>().createEvent(
          variables: vars,
        ),
      ).thenAnswer((_) async {
        return QueryResult(
          options: QueryOptions(document: gql(EventQueries().addEvent())),
          exception: OperationException(
            graphqlErrors: [],
          ),
          data: {
            'test': 'data',
          },
          source: QueryResultSource.network,
        );
      });

      await model.createEvent();

      verify(
        locator<EventService>().createEvent(
          variables: vars,
        ),
      );

      verify(navigationService.pop());

      model.recurrenceEndDate = DateTime.now();
      model.frequency = Frequency.monthly;
      model.weekDayOccurenceInMonth = 1;

      await model.createEvent();

      verify(
        locator<EventService>().createEvent(
          variables: vars,
        ),
      );

      verify(navigationService.pop());

      model.initialize();
      model.isAllDay = false;

      await model.createEvent();
    });

    testWidgets("testing createEvent function (Recurring)", (tester) async {
      final model = CreateEventViewModel();
      AppConnectivity.isOnline = false;
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

      model.isRecurring = true;

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

      model.weekDayOccurenceInMonth = 1;
      model.recurrenceEndDate = DateTime.now();
      model.frequency = 'MONTHLY';

      final vars = {
        'data': {
          'title': model.eventTitleTextController.text,
          'description': model.eventDescriptionTextController.text,
          'location': model.eventLocationTextController.text,
          'isPublic': model.isPublicSwitch,
          'isRegisterable': model.isRegisterableSwitch,
          'recurring': model.isRecurring,
          'allDay': true,
          'organizationId': 'XYZ',
          'startDate': DateFormat('yyyy-MM-dd').format(startMoment),
          'endDate': DateFormat('yyyy-MM-dd').format(endMoment),
          'startTime': model.isAllDay
              ? null
              : '${DateFormat('HH:mm:ss').format(startMoment)}Z',
          'endTime': model.isAllDay
              ? null
              : '${DateFormat('HH:mm:ss').format(endMoment)}Z',
        },
        if (model.isRecurring)
          'recurrenceRuleData': {
            'recurrenceStartDate':
                DateFormat('yyyy-MM-dd').format(model.recurrenceStartDate),
            'recurrenceEndDate': model.recurrenceEndDate != null
                ? DateFormat('yyyy-MM-dd').format(model.recurrenceEndDate!)
                : null,
            'frequency': model.frequency,
            'weekDays': (model.frequency == Frequency.weekly ||
                    (model.frequency == Frequency.monthly &&
                        model.weekDayOccurenceInMonth != null))
                ? model.weekDays.toList()
                : null,
            'interval': model.interval,
            'count': model.count,
            'weekDayOccurenceInMonth': model.weekDayOccurenceInMonth,
          },
      };

      when(
        locator<EventService>().createEvent(
          variables: vars,
        ),
      ).thenAnswer((_) async {
        return QueryResult(
          options: QueryOptions(document: gql(EventQueries().addEvent())),
          exception: OperationException(
            graphqlErrors: [],
          ),
          data: {
            'test': 'data',
          },
          source: QueryResultSource.network,
        );
      });

      await model.createEvent();
    });
  });
}
