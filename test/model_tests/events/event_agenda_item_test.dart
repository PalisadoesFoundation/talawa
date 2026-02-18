import 'package:flutter_test/flutter_test.dart';
import 'package:talawa/models/events/agendaItems/event_agenda_item.dart';
import 'package:talawa/models/events/event_agenda_category.dart';

void main() {
  group('Test EventAgendaItem Model', () {
    test('Test EventAgendaItem fromJson with all fields', () {
      final eventAgendaItemJson = {
        'id': 'item1',
        'name': 'Opening Remarks',
        'description': 'Welcome speech and event overview',
        'duration': '00:30:00',
        'key': 'opening-remarks',
        'type': 'general',
        'attachments': ['https://example.com/attachment1.pdf'],
        'urls': ['https://example.com/agenda'],
        'categories': [
          {
            '_id': 'category1',
            'name': 'Introduction',
            'description': 'Opening session category',
          }
        ],
        'sequence': 1,
        'createdAt': '2025-08-04T10:00:00.000Z',
        'updatedAt': '2025-08-04T11:00:00.000Z',
      };

      final eventAgendaItem = EventAgendaItem.fromJson(eventAgendaItemJson);

      // Verifying that all fields were correctly deserialized
      expect(eventAgendaItem.id, 'item1');
      expect(eventAgendaItem.name, 'Opening Remarks');
      expect(eventAgendaItem.description, 'Welcome speech and event overview');
      expect(eventAgendaItem.duration, '00:30:00');
      expect(eventAgendaItem.key, 'opening-remarks');
      expect(eventAgendaItem.type, 'general');
      expect(
        eventAgendaItem.attachments,
        ['https://example.com/attachment1.pdf'],
      );
      expect(eventAgendaItem.urls, ['https://example.com/agenda']);
      expect(eventAgendaItem.categories?.length, 1);
      expect(eventAgendaItem.categories?[0].id, 'category1');
      expect(eventAgendaItem.categories?[0].name, 'Introduction');
      expect(eventAgendaItem.sequence, 1);
      expect(eventAgendaItem.createdAt, isA<DateTime>());
      expect(eventAgendaItem.updatedAt, isA<DateTime>());
    });

    test('Test EventAgendaItem fromJson with null values', () {
      final eventAgendaItemJson = {
        'id': null,
        'name': null,
        'description': null,
        'duration': null,
        'key': null,
        'type': null,
        'attachments': null,
        'urls': null,
        'categories': null,
        'sequence': null,
        'createdAt': null,
        'updatedAt': null,
      };

      final eventAgendaItem = EventAgendaItem.fromJson(eventAgendaItemJson);

      // Verifying that null values are handled correctly
      expect(eventAgendaItem.id, isNull);
      expect(eventAgendaItem.name, isNull);
      expect(eventAgendaItem.description, isNull);
      expect(eventAgendaItem.duration, isNull);
      expect(eventAgendaItem.key, isNull);
      expect(eventAgendaItem.type, isNull);
      expect(eventAgendaItem.attachments, isNull);
      expect(eventAgendaItem.urls, isNull);
      expect(eventAgendaItem.categories, isNull);
      expect(eventAgendaItem.sequence, isNull);
      expect(eventAgendaItem.createdAt, isNull);
      expect(eventAgendaItem.updatedAt, isNull);
    });

    test('Test EventAgendaItem fromJson with minimal data', () {
      final eventAgendaItemJson = {
        'id': 'minimal-item',
      };

      final eventAgendaItem = EventAgendaItem.fromJson(eventAgendaItemJson);

      expect(eventAgendaItem.id, 'minimal-item');
      expect(eventAgendaItem.name, isNull);
      expect(eventAgendaItem.description, isNull);
      expect(eventAgendaItem.duration, isNull);
      expect(eventAgendaItem.key, isNull);
      expect(eventAgendaItem.type, isNull);
      expect(eventAgendaItem.attachments, isNull);
      expect(eventAgendaItem.urls, isNull);
      expect(eventAgendaItem.categories, isNull);
      expect(eventAgendaItem.sequence, isNull);
      expect(eventAgendaItem.createdAt, isNull);
      expect(eventAgendaItem.updatedAt, isNull);
    });

    test('Test EventAgendaItem fromJson with empty json', () {
      final eventAgendaItemJson = <String, dynamic>{};

      final eventAgendaItem = EventAgendaItem.fromJson(eventAgendaItemJson);

      expect(eventAgendaItem.id, isNull);
      expect(eventAgendaItem.name, isNull);
      expect(eventAgendaItem.description, isNull);
      expect(eventAgendaItem.duration, isNull);
      expect(eventAgendaItem.key, isNull);
      expect(eventAgendaItem.type, isNull);
      expect(eventAgendaItem.attachments, isNull);
      expect(eventAgendaItem.urls, isNull);
      expect(eventAgendaItem.categories, isNull);
      expect(eventAgendaItem.sequence, isNull);
      expect(eventAgendaItem.createdAt, isNull);
      expect(eventAgendaItem.updatedAt, isNull);
    });

    test('Test EventAgendaItem fromJson with empty lists', () {
      final eventAgendaItemJson = {
        'id': 'empty-lists-item',
        'name': 'Empty Lists Test',
        'attachments': <String>[],
        'urls': <String>[],
        'categories': <Map<String, dynamic>>[],
      };

      final eventAgendaItem = EventAgendaItem.fromJson(eventAgendaItemJson);

      expect(eventAgendaItem.id, 'empty-lists-item');
      expect(eventAgendaItem.name, 'Empty Lists Test');
      expect(eventAgendaItem.attachments, isEmpty);
      expect(eventAgendaItem.urls, isEmpty);
      expect(eventAgendaItem.categories, isEmpty);
    });

    test('Test EventAgendaItem fromJson with multiple attachments and urls',
        () {
      final eventAgendaItemJson = {
        'id': 'multi-item',
        'name': 'Multi Resource Item',
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
      expect(eventAgendaItem.name, 'Multi Resource Item');
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
      final category1 = AgendaCategory(id: 'cat1', name: 'Category 1');
      final category2 = AgendaCategory(id: 'cat2', name: 'Category 2');
      final now = DateTime.now();

      final eventAgendaItem = EventAgendaItem(
        id: 'constructorTest',
        name: 'Constructor Test Item',
        description: 'Test item created via constructor',
        duration: '01:00:00',
        key: 'constructor-test',
        type: 'presentation',
        attachments: ['attachment1.pdf', 'attachment2.pdf'],
        urls: ['https://example.com/test'],
        categories: [category1, category2],
        sequence: 5,
        createdAt: now,
        updatedAt: now,
      );

      expect(eventAgendaItem.id, 'constructorTest');
      expect(eventAgendaItem.name, 'Constructor Test Item');
      expect(eventAgendaItem.description, 'Test item created via constructor');
      expect(eventAgendaItem.duration, '01:00:00');
      expect(eventAgendaItem.key, 'constructor-test');
      expect(eventAgendaItem.type, 'presentation');
      expect(eventAgendaItem.attachments?.length, 2);
      expect(eventAgendaItem.attachments?[0], 'attachment1.pdf');
      expect(eventAgendaItem.urls?.length, 1);
      expect(eventAgendaItem.urls?[0], 'https://example.com/test');
      expect(eventAgendaItem.categories?.length, 2);
      expect(eventAgendaItem.categories?[0], category1);
      expect(eventAgendaItem.sequence, 5);
      expect(eventAgendaItem.createdAt, now);
      expect(eventAgendaItem.updatedAt, now);
    });

    test('Test EventAgendaItem constructor with minimal parameters', () {
      final eventAgendaItem = EventAgendaItem();

      expect(eventAgendaItem.id, isNull);
      expect(eventAgendaItem.name, isNull);
      expect(eventAgendaItem.description, isNull);
      expect(eventAgendaItem.duration, isNull);
      expect(eventAgendaItem.key, isNull);
      expect(eventAgendaItem.type, isNull);
      expect(eventAgendaItem.attachments, isNull);
      expect(eventAgendaItem.urls, isNull);
      expect(eventAgendaItem.categories, isNull);
      expect(eventAgendaItem.sequence, isNull);
      expect(eventAgendaItem.createdAt, isNull);
      expect(eventAgendaItem.updatedAt, isNull);
    });

    test('Test EventAgendaItem constructor with some parameters', () {
      final eventAgendaItem = EventAgendaItem(
        id: 'partialTest',
        name: 'Partial Test',
        sequence: 3,
        type: 'workshop',
      );

      expect(eventAgendaItem.id, 'partialTest');
      expect(eventAgendaItem.name, 'Partial Test');
      expect(eventAgendaItem.sequence, 3);
      expect(eventAgendaItem.type, 'workshop');
      expect(eventAgendaItem.description, isNull);
      expect(eventAgendaItem.duration, isNull);
      expect(eventAgendaItem.key, isNull);
      expect(eventAgendaItem.attachments, isNull);
      expect(eventAgendaItem.urls, isNull);
      expect(eventAgendaItem.categories, isNull);
      expect(eventAgendaItem.createdAt, isNull);
      expect(eventAgendaItem.updatedAt, isNull);
    });

    test('Test EventAgendaItem fromJson with string sequence conversion', () {
      final eventAgendaItemJson = {
        'id': 'sequence-test',
        'name': 'Sequence Test',
        'sequence': '10', // String instead of int
      };

      final eventAgendaItem = EventAgendaItem.fromJson(eventAgendaItemJson);

      expect(eventAgendaItem.id, 'sequence-test');
      expect(eventAgendaItem.name, 'Sequence Test');
      expect(eventAgendaItem.sequence, 10);
    });

    test('Test EventAgendaItem fromJson with invalid date formats', () {
      final eventAgendaItemJson = {
        'id': 'date-test',
        'name': 'Date Test',
        'createdAt': 'invalid-date-format',
        'updatedAt': 'also-invalid',
      };

      final eventAgendaItem = EventAgendaItem.fromJson(eventAgendaItemJson);

      expect(eventAgendaItem.id, 'date-test');
      expect(eventAgendaItem.name, 'Date Test');
      expect(eventAgendaItem.createdAt, isNull);
      expect(eventAgendaItem.updatedAt, isNull);
    });
  });
}
