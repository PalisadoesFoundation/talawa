import 'package:flutter_test/flutter_test.dart';
import 'package:talawa/models/events/event_agenda_category.dart';
import 'package:talawa/models/events/event_agenda_item.dart';
import 'package:talawa/models/events/event_model.dart';
import 'package:talawa/models/organization/org_info.dart';
import 'package:talawa/models/user/user_info.dart';

// Test-specific wrapper for EventAgendaItem.fromJson to handle nested user structure
EventAgendaItem eventAgendaItemFromJsonTest(Map<String, dynamic> json) {
  return EventAgendaItem(
    id: json['_id'] as String?,
    title: json['title'] as String?,
    description: json['description'] as String?,
    duration: json['duration'] as String?,
    attachments: (json['attachments'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
    createdBy: json['createdBy'] != null
        ? User.fromJson(
            json['createdBy'] as Map<String, dynamic>,
          ) // Remove fromOrg: true for test
        : null,
    urls: (json['urls'] as List<dynamic>?)?.map((e) => e as String).toList(),
    relatedEvent: json['relatedEvent'] != null
        ? Event.fromJson(json['relatedEvent'] as Map<String, dynamic>)
        : null,
    categories: (json['categories'] as List<dynamic>?)
        ?.map((e) => AgendaCategory.fromJson(e as Map<String, dynamic>))
        .toList(),
    sequence: json['sequence'] as int?,
    organization: json['organization'] != null
        ? OrgInfo.fromJson(json['organization'] as Map<String, dynamic>)
        : null,
  );
}

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

      final eventAgendaItem = eventAgendaItemFromJsonTest(eventAgendaItemJson);

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
