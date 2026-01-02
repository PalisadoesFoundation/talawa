import 'package:flutter_test/flutter_test.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:mockito/mockito.dart';
import 'package:talawa/models/events/agendaItems/event_agenda_item.dart';
import 'package:talawa/models/events/event_agenda_category.dart';
import 'package:talawa/view_model/after_auth_view_models/event_view_models/edit_agenda_view_model.dart';

import '../../../helpers/test_helpers.dart';
import '../../../helpers/test_locator.dart';

void main() {
  late EditAgendaItemViewModel model;

  final testAgendaItem = EventAgendaItem(
    id: '1',
    name: 'Test Agenda Item',
    description: 'Test Description',
    duration: '60',
    urls: ['https://example.com'],
    attachments: ['base64image1'],
    categories: [AgendaCategory(id: 'cat1', name: 'Category 1')],
  );

  final testCategories = [
    AgendaCategory(id: 'cat1', name: 'Category 1'),
    AgendaCategory(id: 'cat2', name: 'Category 2'),
  ];

  setUpAll(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    testSetupLocator();
  });

  setUp(() {
    registerServices();
    model = EditAgendaItemViewModel();
  });

  tearDown(() {
    unregisterServices();
  });

  group('EditAgendaItemViewModel Tests -', () {
    test('initialize() populates the form correctly', () {
      model.initialize(testAgendaItem, testCategories);

      expect(model.titleController.text, 'Test Agenda Item');
      expect(model.descriptionController.text, 'Test Description');
      expect(model.durationController.text, '60');
      expect(model.urls, ['https://example.com']);
      expect(model.attachments, ['base64image1']);
      expect(model.selectedCategories.length, 1);
      expect(model.selectedCategories[0].id, 'cat1');
    });

    test('setSelectedCategories() updates selected categories', () {
      model.initialize(testAgendaItem, testCategories);
      model.setSelectedCategories([testCategories[1]]);

      expect(model.selectedCategories.length, 1);
      expect(model.selectedCategories[0].id, 'cat2');
    });

    test('addUrl() adds a new URL', () {
      model.initialize(testAgendaItem, testCategories);
      model.addUrl('https://newexample.com');

      expect(model.urls.length, 2);
      expect(model.urls.contains('https://newexample.com'), true);
    });

    test('removeUrl() removes a URL', () {
      model.initialize(testAgendaItem, testCategories);
      model.removeUrl('https://example.com');

      expect(model.urls.length, 0);
    });

    test('removeAttachment() removes an attachment', () {
      model.initialize(testAgendaItem, testCategories);
      model.removeAttachment('base64image1');

      expect(model.attachments.length, 0);
    });

    test('checkForChanges() detects changes correctly', () {
      model.initialize(testAgendaItem, testCategories);
      expect(model.checkForChanges(), false);

      model.titleController.text = 'Updated Title';
      expect(model.checkForChanges(), true);
    });

    test('updateAgendaItem() success updates local state', () async {
      model.initialize(testAgendaItem, testCategories);
      model.titleController.text = 'Updated Title';

      when(
        eventService.updateAgendaItem('1', {
          'title': 'Updated Title',
          'description': 'Test Description',
          'duration': '60',
          'attachments': ['base64image1'],
          'urls': ['https://example.com'],
          'categories': ['cat1'],
        }),
      ).thenAnswer(
        (_) async => QueryResult(
          source: QueryResultSource.network,
          data: {
            'updateAgendaItem': {
              '_id': '1',
              'name': 'Updated Title',
              'description': 'Test Description',
              'duration': '60',
            },
          },
          options: QueryOptions(document: gql('')),
        ),
      );

      await model.updateAgendaItem();

      verify(
        eventService.updateAgendaItem('1', {
          'title': 'Updated Title',
          'description': 'Test Description',
          'duration': '60',
          'attachments': ['base64image1'],
          'urls': ['https://example.com'],
          'categories': ['cat1'],
        }),
      ).called(1);
    });

    test('updateAgendaItem() handles hasException gracefully', () async {
      model.initialize(testAgendaItem, testCategories);
      model.titleController.text = 'Updated Title';

      when(
        eventService.updateAgendaItem('1', {
          'title': 'Updated Title',
          'description': 'Test Description',
          'duration': '60',
          'attachments': ['base64image1'],
          'urls': ['https://example.com'],
          'categories': ['cat1'],
        }),
      ).thenAnswer(
        (_) async => QueryResult(
          source: QueryResultSource.network,
          options: QueryOptions(document: gql('')),
          exception: OperationException(
            graphqlErrors: [const GraphQLError(message: 'Test error')],
          ),
        ),
      );

      // Should not throw, just handle the exception gracefully
      await model.updateAgendaItem();

      // Verify the hasException path was taken (debugPrint called)
    });

    test('updateAgendaItem() handles null data gracefully', () async {
      model.initialize(testAgendaItem, testCategories);
      model.titleController.text = 'Updated Title';

      when(
        eventService.updateAgendaItem('1', {
          'title': 'Updated Title',
          'description': 'Test Description',
          'duration': '60',
          'attachments': ['base64image1'],
          'urls': ['https://example.com'],
          'categories': ['cat1'],
        }),
      ).thenAnswer(
        (_) async => QueryResult(
          source: QueryResultSource.network,
          options: QueryOptions(document: gql('')),
          data: null,
        ),
      );

      // Should not throw, just handle the null data gracefully
      await model.updateAgendaItem();

      // Method should complete without throwing
    });

    test('updateAgendaItem() handles null updateAgendaItem in response',
        () async {
      model.initialize(testAgendaItem, testCategories);
      model.titleController.text = 'Updated Title';

      when(
        eventService.updateAgendaItem('1', {
          'title': 'Updated Title',
          'description': 'Test Description',
          'duration': '60',
          'attachments': ['base64image1'],
          'urls': ['https://example.com'],
          'categories': ['cat1'],
        }),
      ).thenAnswer(
        (_) async => QueryResult(
          source: QueryResultSource.network,
          options: QueryOptions(document: gql('')),
          data: {'updateAgendaItem': null},
        ),
      );

      // Should not throw, just handle the null response gracefully
      await model.updateAgendaItem();

      // Method should complete without throwing
    });
  });
}
