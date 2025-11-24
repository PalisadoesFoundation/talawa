import 'package:flutter_test/flutter_test.dart';
import 'package:talawa/models/events/event_agenda_item.dart';

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
          'user': {
            'id': 'user1',
            'name': 'John Doe',
          },
        },
        'urls': ['https://example.com/agenda'],
        'relatedEvent': {
          '_id': 'event1',
          'title': 'Annual Conference',
        },
        'categories': [
          {
            '_id': 'category1',
            'name': 'Introduction',
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
      expect(eventAgendaItem.urls, ['https://example.com/agenda']);
      expect(eventAgendaItem.relatedEvent?.id, 'event1');
      expect(eventAgendaItem.categories?.length, 1);
      expect(eventAgendaItem.categories?[0].id, 'category1');
      expect(eventAgendaItem.sequence, 1);
      expect(eventAgendaItem.organization?.id, 'org1');
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
  });
}
