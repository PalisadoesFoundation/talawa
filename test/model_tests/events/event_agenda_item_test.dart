import 'package:flutter_test/flutter_test.dart';
import 'package:talawa/models/events/event_agenda_category.dart';
import 'package:talawa/models/events/event_agenda_item.dart';
import 'package:talawa/models/events/event_model.dart';
import 'package:talawa/models/organization/org_info.dart';
import 'package:talawa/models/user/user_info.dart';

import '../../helpers/test_json_utils.dart';

/// Comprehensive test suite for EventAgendaItem model.
///
/// This test file covers two important scenarios:
/// 1. Testing EventAgendaItem.fromJson() directly with the correct data format
///    to ensure 100% coverage of the actual model's deserialization logic
/// 2. Testing TestJsonUtils.createEventAgendaItemFromJson() with nested API response format
///    to ensure the utility method correctly handles real-world API responses
///
/// Both approaches are necessary because:
/// - EventAgendaItem.fromJson() expects direct user data (fromOrg: true format)
/// - Real API responses often have nested user structures that TestJsonUtils handles
/// - We need both the model coverage AND the utility method validation

void main() {
  group('Test EventAgendaItem Model', () {
    test('Test EventAgendaItem fromJson', () {
      final eventAgendaItemJson = {
        '_id': 'item1',
        'title': 'Opening Remarks',
        'description': 'Welcome speech and event overview',
        'duration': '00:30',
        'attachments': ['https://example.com/attachment1.pdf'],
        'createdBy': {
          'id': 'user1',
          'name': 'John Doe',
          'emailAddress': 'john.doe@example.com',
        },
        'urls': ['https://example.com/agenda'],
        'relatedEvent': {
          'id': 'event1',
          'name': 'Annual Conference',
          'description': 'Annual tech conference',
        },
        'categories': [
          {
            '_id': 'category1',
            'name': 'Introduction',
            'description': 'Opening session category',
          }
        ],
        'sequence': 1,
        'organization': {
          'id': 'org1',
          'name': 'Tech Conference Org',
        },
      };

      final eventAgendaItem = EventAgendaItem.fromJson(eventAgendaItemJson);

      // Verifying that all fields were correctly deserialized
      expect(eventAgendaItem.id, 'item1');
      expect(eventAgendaItem.title, 'Opening Remarks');
      expect(eventAgendaItem.description, 'Welcome speech and event overview');
      expect(eventAgendaItem.duration, '00:30');
      expect(
        eventAgendaItem.attachments,
        ['https://example.com/attachment1.pdf'],
      );
      expect(eventAgendaItem.createdBy?.id, 'user1');
      expect(eventAgendaItem.createdBy?.firstName, 'John');
      expect(eventAgendaItem.createdBy?.lastName, 'Doe');
      expect(eventAgendaItem.urls, ['https://example.com/agenda']);
      expect(eventAgendaItem.relatedEvent?.id, 'event1');
      expect(eventAgendaItem.relatedEvent?.name, 'Annual Conference');
      expect(eventAgendaItem.categories?.length, 1);
      expect(eventAgendaItem.categories?[0].id, 'category1');
      expect(eventAgendaItem.categories?[0].name, 'Introduction');
      expect(eventAgendaItem.sequence, 1);
      expect(eventAgendaItem.organization?.id, 'org1');
      expect(eventAgendaItem.organization?.name, 'Tech Conference Org');
    });

    test('Test EventAgendaItem fromJson with null values', () {
      final eventAgendaItemJson = {
        '_id': null,
        'title': null,
        'description': null,
        'duration': null,
        'attachments': null,
        'createdBy': null,
        'urls': null,
        'relatedEvent': null,
        'categories': null,
        'sequence': null,
        'organization': null,
      };

      final eventAgendaItem = EventAgendaItem.fromJson(eventAgendaItemJson);

      // Verifying that null values are handled correctly
      expect(eventAgendaItem.id, isNull);
      expect(eventAgendaItem.title, isNull);
      expect(eventAgendaItem.description, isNull);
      expect(eventAgendaItem.duration, isNull);
      expect(eventAgendaItem.attachments, isNull);
      expect(eventAgendaItem.createdBy, isNull);
      expect(eventAgendaItem.urls, isNull);
      expect(eventAgendaItem.relatedEvent, isNull);
      expect(eventAgendaItem.categories, isNull);
      expect(eventAgendaItem.sequence, isNull);
      expect(eventAgendaItem.organization, isNull);
    });

    test('Test EventAgendaItem fromJson with minimal data', () {
      final eventAgendaItemJson = {
        '_id': 'minimal-item',
      };

      final eventAgendaItem = EventAgendaItem.fromJson(eventAgendaItemJson);

      expect(eventAgendaItem.id, 'minimal-item');
      expect(eventAgendaItem.title, isNull);
      expect(eventAgendaItem.description, isNull);
      expect(eventAgendaItem.duration, isNull);
      expect(eventAgendaItem.attachments, isNull);
      expect(eventAgendaItem.createdBy, isNull);
      expect(eventAgendaItem.urls, isNull);
      expect(eventAgendaItem.relatedEvent, isNull);
      expect(eventAgendaItem.categories, isNull);
      expect(eventAgendaItem.sequence, isNull);
      expect(eventAgendaItem.organization, isNull);
    });

    test('Test EventAgendaItem fromJson with empty json', () {
      final eventAgendaItemJson = <String, dynamic>{};

      final eventAgendaItem = EventAgendaItem.fromJson(eventAgendaItemJson);

      expect(eventAgendaItem.id, isNull);
      expect(eventAgendaItem.title, isNull);
      expect(eventAgendaItem.description, isNull);
      expect(eventAgendaItem.duration, isNull);
      expect(eventAgendaItem.attachments, isNull);
      expect(eventAgendaItem.createdBy, isNull);
      expect(eventAgendaItem.urls, isNull);
      expect(eventAgendaItem.relatedEvent, isNull);
      expect(eventAgendaItem.categories, isNull);
      expect(eventAgendaItem.sequence, isNull);
      expect(eventAgendaItem.organization, isNull);
    });

    test('Test EventAgendaItem fromJson with empty lists', () {
      final eventAgendaItemJson = {
        '_id': 'empty-lists-item',
        'title': 'Empty Lists Test',
        'attachments': <String>[],
        'urls': <String>[],
        'categories': <Map<String, dynamic>>[],
      };

      final eventAgendaItem = EventAgendaItem.fromJson(eventAgendaItemJson);

      expect(eventAgendaItem.id, 'empty-lists-item');
      expect(eventAgendaItem.title, 'Empty Lists Test');
      expect(eventAgendaItem.attachments, isEmpty);
      expect(eventAgendaItem.urls, isEmpty);
      expect(eventAgendaItem.categories, isEmpty);
    });

    test('Test EventAgendaItem fromJson with multiple attachments and urls',
        () {
      final eventAgendaItemJson = {
        '_id': 'multi-item',
        'title': 'Multi Resource Item',
        'attachments': [
          'https://example.com/doc1.pdf',
          'https://example.com/doc2.pdf',
          'https://example.com/doc3.pdf',
        ],
        'urls': [
          'https://example.com/resource1',
          'https://example.com/resource2',
        ],
        'categories': [
          {
            '_id': 'cat1',
            'name': 'Category 1',
          },
          {
            '_id': 'cat2',
            'name': 'Category 2',
          },
        ],
      };

      final eventAgendaItem = EventAgendaItem.fromJson(eventAgendaItemJson);

      expect(eventAgendaItem.id, 'multi-item');
      expect(eventAgendaItem.title, 'Multi Resource Item');
      expect(eventAgendaItem.attachments?.length, 3);
      expect(eventAgendaItem.attachments?[0], 'https://example.com/doc1.pdf');
      expect(eventAgendaItem.attachments?[2], 'https://example.com/doc3.pdf');
      expect(eventAgendaItem.urls?.length, 2);
      expect(eventAgendaItem.urls?[0], 'https://example.com/resource1');
      expect(eventAgendaItem.categories?.length, 2);
      expect(eventAgendaItem.categories?[0].id, 'cat1');
      expect(eventAgendaItem.categories?[1].name, 'Category 2');
    });

    test('Test EventAgendaItem constructor with all parameters', () {
      final creator = User(id: 'creatorId', firstName: 'Creator');
      final event = Event(id: 'eventId', name: 'Test Event');
      final category1 = AgendaCategory(id: 'cat1', name: 'Category 1');
      final category2 = AgendaCategory(id: 'cat2', name: 'Category 2');
      final organization = OrgInfo(id: 'orgId', name: 'Test Org');

      final eventAgendaItem = EventAgendaItem(
        id: 'constructorTest',
        title: 'Constructor Test Item',
        description: 'Test item created via constructor',
        duration: '01:00',
        attachments: ['attachment1.pdf', 'attachment2.pdf'],
        createdBy: creator,
        urls: ['https://example.com/test'],
        relatedEvent: event,
        categories: [category1, category2],
        sequence: 5,
        organization: organization,
      );

      expect(eventAgendaItem.id, 'constructorTest');
      expect(eventAgendaItem.title, 'Constructor Test Item');
      expect(eventAgendaItem.description, 'Test item created via constructor');
      expect(eventAgendaItem.duration, '01:00');
      expect(eventAgendaItem.attachments?.length, 2);
      expect(eventAgendaItem.attachments?[0], 'attachment1.pdf');
      expect(eventAgendaItem.createdBy, creator);
      expect(eventAgendaItem.urls?.length, 1);
      expect(eventAgendaItem.urls?[0], 'https://example.com/test');
      expect(eventAgendaItem.relatedEvent, event);
      expect(eventAgendaItem.categories?.length, 2);
      expect(eventAgendaItem.categories?[0], category1);
      expect(eventAgendaItem.sequence, 5);
      expect(eventAgendaItem.organization, organization);
    });

    test('Test EventAgendaItem constructor with minimal parameters', () {
      final eventAgendaItem = EventAgendaItem();

      expect(eventAgendaItem.id, isNull);
      expect(eventAgendaItem.title, isNull);
      expect(eventAgendaItem.description, isNull);
      expect(eventAgendaItem.duration, isNull);
      expect(eventAgendaItem.attachments, isNull);
      expect(eventAgendaItem.createdBy, isNull);
      expect(eventAgendaItem.urls, isNull);
      expect(eventAgendaItem.relatedEvent, isNull);
      expect(eventAgendaItem.categories, isNull);
      expect(eventAgendaItem.sequence, isNull);
      expect(eventAgendaItem.organization, isNull);
    });

    test('Test EventAgendaItem constructor with some parameters', () {
      final eventAgendaItem = EventAgendaItem(
        id: 'partialTest',
        title: 'Partial Test',
        sequence: 3,
      );

      expect(eventAgendaItem.id, 'partialTest');
      expect(eventAgendaItem.title, 'Partial Test');
      expect(eventAgendaItem.sequence, 3);
      expect(eventAgendaItem.description, isNull);
      expect(eventAgendaItem.duration, isNull);
      expect(eventAgendaItem.attachments, isNull);
      expect(eventAgendaItem.createdBy, isNull);
      expect(eventAgendaItem.urls, isNull);
      expect(eventAgendaItem.relatedEvent, isNull);
      expect(eventAgendaItem.categories, isNull);
      expect(eventAgendaItem.organization, isNull);
    });

    test(
        'Test TestJsonUtils createEventAgendaItemFromJson with nested API response format',
        () {
      // This tests the TestJsonUtils method with the actual nested format
      // that comes from API responses (with nested 'user' structures)
      final eventAgendaItemJson = {
        '_id': 'utilsTest',
        'title': 'Utils Test Item',
        'description': 'Testing utils method',
        'duration': '00:45',
        'attachments': ['https://example.com/utils.pdf'],
        'createdBy': {
          'user': {
            'id': 'utilsUserId',
            'name': 'Utils User',
          },
        },
        'urls': ['https://example.com/utils'],
        'relatedEvent': {
          '_id': 'utilsEventId',
          'title': 'Utils Event',
        },
        'categories': [
          {
            '_id': 'utilsCategoryId',
            'name': 'Utils Category',
          }
        ],
        'sequence': 10,
        'organization': {
          'id': 'utilsOrgId',
          'name': 'Utils Organization',
        },
      };

      final eventAgendaItem =
          TestJsonUtils.createEventAgendaItemFromJson(eventAgendaItemJson);

      expect(eventAgendaItem.id, 'utilsTest');
      expect(eventAgendaItem.title, 'Utils Test Item');
      expect(eventAgendaItem.description, 'Testing utils method');
      expect(eventAgendaItem.duration, '00:45');
      expect(eventAgendaItem.attachments, ['https://example.com/utils.pdf']);
      expect(eventAgendaItem.createdBy?.id, 'utilsUserId');
      expect(eventAgendaItem.urls, ['https://example.com/utils']);
      expect(eventAgendaItem.relatedEvent?.id, 'utilsEventId');
      expect(eventAgendaItem.categories?.length, 1);
      expect(eventAgendaItem.categories?[0].id, 'utilsCategoryId');
      expect(eventAgendaItem.sequence, 10);
      expect(eventAgendaItem.organization?.id, 'utilsOrgId');
    });
  });
}
