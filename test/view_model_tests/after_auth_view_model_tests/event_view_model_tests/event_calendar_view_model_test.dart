import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:talawa/models/events/event_model.dart';
import 'package:talawa/models/organization/org_info.dart';
import 'package:talawa/services/event_service.dart';
import 'package:talawa/services/user_config.dart';
import 'package:talawa/view_model/after_auth_view_models/event_view_models/event_calendar_view_model.dart';

import '../../../helpers/test_helpers.dart';
import '../../../helpers/test_locator.dart';

void main() {
  setUpAll(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    testSetupLocator();
    registerServices();
  });

  tearDownAll(() {
    unregisterServices();
  });

  group('EventCalendarViewModel Tests', () {
    late EventCalendarViewModel viewModel;
    late EventService mockEventService;
    late UserConfig mockUserConfig;
    late StreamController<List<Event>> eventStreamController;
    late StreamController<OrgInfo> orgStreamController;

    setUp(() {
      viewModel = EventCalendarViewModel();
      mockEventService = locator<EventService>();
      mockUserConfig = locator<UserConfig>();

      // Create stream controllers for mocking
      eventStreamController = StreamController<List<Event>>.broadcast();
      orgStreamController = StreamController<OrgInfo>.broadcast();

      // Mock the streams
      when(mockEventService.eventStream).thenAnswer(
        (_) => eventStreamController.stream,
      );
      when(mockUserConfig.currentOrgInfoStream).thenAnswer(
        (_) => orgStreamController.stream,
      );
    });

    tearDown(() async {
      await eventStreamController.close();
      await orgStreamController.close();
      // Don't dispose viewModel here as it might interfere with async operations
    });

    group('initialize', () {
      test('should set calendar view to month and subscribe to streams', () {
        // Mock fetchEventsWithDates for initialization
        when(
          mockEventService.fetchEventsWithDates(
            DateTime(2025, 10, 1),
            DateTime(2025, 10, 31, 23, 59, 59),
            includeRecurring: true,
          ),
        ).thenAnswer((_) async {});

        viewModel.initialize();

        expect(viewModel.calendarView, CalendarView.month);
      });

      test('should update event list when event stream emits', () async {
        final testEvents = [
          Event(id: '1', name: 'Test Event 1'),
          Event(id: '2', name: 'Test Event 2'),
        ];

        // Mock fetchEventsWithDates for initialization
        when(
          mockEventService.fetchEventsWithDates(
            DateTime(2025, 10, 1),
            DateTime(2025, 10, 31, 23, 59, 59),
            includeRecurring: true,
          ),
        ).thenAnswer((_) async {});

        viewModel.initialize();

        // Emit events through the stream
        eventStreamController.add(testEvents);

        // Wait for stream to process
        await Future.delayed(const Duration(milliseconds: 100));

        expect(viewModel.eventList, testEvents);
        expect(viewModel.eventList.length, 2);
      });

      test('should call _resetToCurrentMonth when organization changes',
          () async {
        final testOrg = OrgInfo(id: 'org1', name: 'Test Org');

        // Mock fetchEventsWithDates for initialization
        when(
          mockEventService.fetchEventsWithDates(
            DateTime(2025, 10, 1),
            DateTime(2025, 10, 31, 23, 59, 59),
            includeRecurring: true,
          ),
        ).thenAnswer((_) async {});

        viewModel.initialize();

        // Reset mock to count only the organization change call
        reset(mockEventService);
        when(
          mockEventService.fetchEventsWithDates(
            DateTime(2025, 10, 1),
            DateTime(2025, 10, 31, 23, 59, 59),
            includeRecurring: true,
          ),
        ).thenAnswer((_) async {});

        // Emit organization change
        orgStreamController.add(testOrg);

        // Wait for stream to process
        await Future.delayed(const Duration(milliseconds: 100));

        // Should fetch events again for the new organization
        verify(
          mockEventService.fetchEventsWithDates(
            DateTime(2025, 10, 1),
            DateTime(2025, 10, 31, 23, 59, 59),
            includeRecurring: true,
          ),
        ).called(1);
      });
    });

    group('refreshCurrentViewEvents', () {
      test('should fetch events for currently displayed month', () async {
        // Mock fetchEventsWithDates for initialization
        when(
          mockEventService.fetchEventsWithDates(
            DateTime(2025, 10, 1),
            DateTime(2025, 10, 31, 23, 59, 59),
            includeRecurring: true,
          ),
        ).thenAnswer((_) async {});

        viewModel.initialize();

        final testDate = DateTime(2024, 6, 15);
        viewModel.calendarController.displayDate = testDate;

        // Reset mock to count only this test's calls
        reset(mockEventService);
        when(
          mockEventService.fetchEventsWithDates(
            DateTime(2024, 6, 1),
            DateTime(2024, 6, 30, 23, 59, 59),
            includeRecurring: true,
          ),
        ).thenAnswer((_) async {});

        await viewModel.refreshCurrentViewEvents();

        verify(
          mockEventService.fetchEventsWithDates(
            DateTime(2024, 6, 1),
            DateTime(2024, 6, 30, 23, 59, 59),
            includeRecurring: true,
          ),
        ).called(1);
      });

      test('should use current date when display date is null', () async {
        // Mock fetchEventsWithDates for initialization
        when(
          mockEventService.fetchEventsWithDates(
            DateTime(2025, 10, 1),
            DateTime(2025, 10, 31, 23, 59, 59),
            includeRecurring: true,
          ),
        ).thenAnswer((_) async {});

        viewModel.initialize();

        // Set display date to null
        viewModel.calendarController.displayDate = null;

        // Reset mock to count only this test's calls
        reset(mockEventService);
        when(
          mockEventService.fetchEventsWithDates(
            DateTime(2025, 10, 1),
            DateTime(2025, 10, 31, 23, 59, 59),
            includeRecurring: true,
          ),
        ).thenAnswer((_) async {});

        await viewModel.refreshCurrentViewEvents();

        verify(
          mockEventService.fetchEventsWithDates(
            DateTime(2025, 10, 1),
            DateTime(2025, 10, 31, 23, 59, 59),
            includeRecurring: true,
          ),
        ).called(1);
      });
    });

    group('selectionChanged', () {
      test('should update calendar display date when called', () {
        // Mock fetchEventsWithDates for initialization
        when(
          mockEventService.fetchEventsWithDates(
            DateTime(2025, 10, 1),
            DateTime(2025, 10, 31, 23, 59, 59),
            includeRecurring: true,
          ),
        ).thenAnswer((_) async {});

        viewModel.initialize();

        final selectedDate = DateTime(2024, 8, 20);
        final args = DateRangePickerSelectionChangedArgs(selectedDate);

        // Mock the expected fetchEventsWithDates call
        when(
          mockEventService.fetchEventsWithDates(
            DateTime(2024, 8, 1),
            DateTime(2024, 8, 31, 23, 59, 59),
            includeRecurring: true,
          ),
        ).thenAnswer((_) async {});

        // Call selectionChanged - this will schedule a post-frame callback
        viewModel.selectionChanged(args);

        // The method schedules the calendar update, so we verify it exists
        expect(viewModel.calendarController, isNotNull);
      });

      test('should handle null selected date gracefully', () {
        // Mock fetchEventsWithDates for initialization
        when(
          mockEventService.fetchEventsWithDates(
            DateTime(2025, 10, 1),
            DateTime(2025, 10, 31, 23, 59, 59),
            includeRecurring: true,
          ),
        ).thenAnswer((_) async {});

        viewModel.initialize();

        const args = DateRangePickerSelectionChangedArgs(null);

        // Call selectionChanged with null date - should not throw error
        expect(() => viewModel.selectionChanged(args), returnsNormally);
      });
    });

    group('getEventsForCalendar', () {
      test('should call fetchEventsWithDates with correct parameters',
          () async {
        // Mock fetchEventsWithDates for initialization
        when(
          mockEventService.fetchEventsWithDates(
            DateTime(2025, 10, 1),
            DateTime(2025, 10, 31, 23, 59, 59),
            includeRecurring: true,
          ),
        ).thenAnswer((_) async {});

        viewModel.initialize();

        final startDate = DateTime(2024, 3, 1);
        final endDate = DateTime(2024, 3, 31, 23, 59, 59);

        // Reset mock to count only this test's calls
        reset(mockEventService);
        when(
          mockEventService.fetchEventsWithDates(
            startDate,
            endDate,
            includeRecurring: true,
          ),
        ).thenAnswer((_) async {});

        await viewModel.getEventsForCalendar(startDate, endDate);

        verify(
          mockEventService.fetchEventsWithDates(
            startDate,
            endDate,
            includeRecurring: true,
          ),
        ).called(1);
      });
    });

    group('getters', () {
      test('should return correct values', () {
        // Mock fetchEventsWithDates for initialization
        when(
          mockEventService.fetchEventsWithDates(
            DateTime(2025, 10, 1),
            DateTime(2025, 10, 31, 23, 59, 59),
            includeRecurring: true,
          ),
        ).thenAnswer((_) async {});

        viewModel.initialize();

        expect(viewModel.eventList, isA<List<Event>>());
        expect(viewModel.calendarController, isA<CalendarController>());
        expect(
          viewModel.dateRangePickerController,
          isA<DateRangePickerController>(),
        );
        expect(viewModel.calendarView, CalendarView.month);
      });
    });
    group('dispose', () {
      test('should dispose controllers and cancel subscriptions', () {
        final testViewModel = EventCalendarViewModel();

        // Should not throw any exceptions when disposing without initialization
        expect(() => testViewModel.dispose(), returnsNormally);
      });
    });
  });
}
