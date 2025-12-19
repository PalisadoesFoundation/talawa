import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:mockito/mockito.dart';
import 'package:talawa/models/events/event_agenda_category.dart';
import 'package:talawa/models/events/event_agenda_item.dart';
import 'package:talawa/services/event_service.dart';
import 'package:talawa/view_model/after_auth_view_models/event_view_models/edit_agenda_view_model.dart';
import 'package:talawa/services/third_party_service/multi_media_pick_service.dart';
import 'package:talawa/services/image_service.dart';

import '../../../helpers/test_helpers.dart';
import '../../../helpers/test_locator.dart';

class FakeEventService extends Fake implements EventService {
  Map<String, dynamic>? lastVariables;
  bool shouldThrow = false;
  int callCount = 0;

  @override
  Future<dynamic> updateAgendaItem(
      String itemId, Map<String, dynamic> variables) async {
    callCount++;
    if (shouldThrow) throw Exception('Update failed');
    lastVariables = variables;
    return QueryResult(
      source: QueryResultSource.network,
      data: {
        'updateAgendaItem': {'id': itemId}
      },
      options: QueryOptions(document: gql('')),
    );
  }
}

class FakeImageService extends Fake implements ImageService {
  @override
  Future<String> convertToBase64(File image) async {
    return 'base64EncodedString';
  }
}

void main() {
  late EditAgendaItemViewModel model;
  late FakeEventService fakeEventService;
  late FakeImageService fakeImageService;

  final testAgendaItem = EventAgendaItem(
    id: '1',
    title: 'Test Agenda Item',
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

  setUp(() {
    registerServices();
    getAndRegisterUserProfileService();

    // register FakeEventService
    locator.unregister<EventService>();
    fakeEventService = FakeEventService();
    locator.registerSingleton<EventService>(fakeEventService);

    // register FakeImageService
    locator.unregister<ImageService>();
    fakeImageService = FakeImageService();
    locator.registerSingleton<ImageService>(fakeImageService);

    model = EditAgendaItemViewModel();
  });

  tearDown(() {
    // Services are cleaned up in setUp by registerServices
  });

  group('EditAgendaItemViewModel Tests -', () {
    test('initialize() populates the form correctly', () {
      model.initialize(testAgendaItem, testCategories);

      expect(model.titleController.text, 'Test Agenda Item');
      expect(model.descriptionController.text, 'Test Description');
      expect(model.durationController.text, '60');
      expect(model.urls, ['https://example.com']);
      expect(model.attachments, ['base64image1']);
      // Accessing getter to ensure coverage
      expect(model.categories.length, 2);
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

    testWidgets('updateAgendaItem() calls event service with correct data',
        (WidgetTester tester) async {
      model.initialize(testAgendaItem, testCategories);
      model.titleController.text = 'Updated Title';

      await model.updateAgendaItem();

      expect(fakeEventService.callCount, 1);
      final vars = fakeEventService.lastVariables!;
      expect(vars['title'], 'Updated Title');
      expect(vars['description'], 'Test Description');
      expect(vars['duration'], '60');
      // Verify other fields as needed
    });

    test('pickAttachment() adds a new attachment when file is picked',
        () async {
      model.initialize(testAgendaItem, testCategories);
      final file = File('path/to/image.jpg');

      final mockMultiMediaPickerService = locator<MultiMediaPickerService>();
      // ImageService is now fakeImageService, no need to mock convertToBase64

      when(mockMultiMediaPickerService.getPhotoFromGallery(camera: false))
          .thenAnswer((_) async => file);

      await model.pickAttachment(fromCamera: false);

      expect(model.attachments.length, 2);
      expect(model.attachments.contains('base64EncodedString'), true);
      verify(mockMultiMediaPickerService.getPhotoFromGallery(camera: false))
          .called(1);
    });

    test('pickAttachment() does not add attachment when no file is picked',
        () async {
      model.initialize(testAgendaItem, testCategories);
      final mockMultiMediaPickerService = locator<MultiMediaPickerService>();

      when(mockMultiMediaPickerService.getPhotoFromGallery(camera: false))
          .thenAnswer((_) async => null);

      await model.pickAttachment(fromCamera: false);

      expect(model.attachments.length, 1);
      verify(mockMultiMediaPickerService.getPhotoFromGallery(camera: false))
          .called(1);
    });

    test('pickAttachment() uses camera when fromCamera is true', () async {
      model.initialize(testAgendaItem, testCategories);
      final file = File('path/to/camera/image.jpg');

      final mockMultiMediaPickerService = locator<MultiMediaPickerService>();

      when(mockMultiMediaPickerService.getPhotoFromGallery(camera: true))
          .thenAnswer((_) async => file);

      await model.pickAttachment(fromCamera: true);

      expect(model.attachments.contains('base64EncodedString'), true);
      verify(mockMultiMediaPickerService.getPhotoFromGallery(camera: true))
          .called(1);
    });

    testWidgets('updateAgendaItem() handles error gracefully',
        (WidgetTester tester) async {
      model.initialize(testAgendaItem, testCategories);
      model.titleController.text = 'Updated Title';

      fakeEventService.shouldThrow = true;

      // This should complete without throwing to the test (caught inside VM)
      await model.updateAgendaItem();

      expect(fakeEventService.callCount, 1);
    });

    testWidgets('updateAgendaItem() does nothing if no changes',
        (WidgetTester tester) async {
      fakeEventService.callCount = 0;
      model.initialize(testAgendaItem, testCategories);
      // No changes made

      await model.updateAgendaItem();

      expect(fakeEventService.callCount, 0);
    });

    test('dispose() releases resources', () {
      model.dispose();
      // Verify no errors occur; internal controller disposal is handled by framework
    });
  });
}
