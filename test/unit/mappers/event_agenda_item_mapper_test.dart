import 'package:flutter_test/flutter_test.dart';
import 'package:talawa/mappers/event_agenda_item_mapper.dart';
import 'package:talawa/models/domain/event_agenda_category.dart';
import 'package:talawa/models/events/agendaItems/event_agenda_item.dart' as dto;
import 'package:talawa/models/events/event_agenda_category.dart' as dto;

void main() {
  group('EventAgendaItemMapper', () {
    group('fromDto', () {
      test('converts all fields correctly', () {
        final dtoItem = dto.EventAgendaItem(
          id: 'item123',
          name: 'Opening Ceremony',
          description: 'Event opening',
          duration: '30 minutes',
          key: 'key1',
          type: 'ceremony',
          createdAt: DateTime(2024, 1, 1),
          updatedAt: DateTime(2024, 1, 2),
          attachments: ['file1.pdf', 'file2.jpg'],
          urls: ['https://example.com'],
          categories: [
            dto.AgendaCategory(id: 'cat1', name: 'Category 1'),
          ],
          sequence: 1,
        );

        final domain = EventAgendaItemMapper.fromDto(dtoItem);

        expect(domain.id, 'item123');
        expect(domain.name, 'Opening Ceremony');
        expect(domain.description, 'Event opening');
        expect(domain.duration, '30 minutes');
        expect(domain.displayName, 'Opening Ceremony');
        expect(domain.hasDescription, true);
        expect(domain.hasAttachments, true);
        expect(domain.attachmentCount, 2);
      });

      test('handles null name', () {
        final dtoItem = dto.EventAgendaItem(id: 'item456');

        final domain = EventAgendaItemMapper.fromDto(dtoItem);

        expect(domain.displayName, 'Unnamed Item');
        expect(domain.hasDescription, false);
        expect(domain.hasAttachments, false);
      });
    });

    group('fromDtoList', () {
      test('converts list of DTOs', () {
        final dtos = [
          dto.EventAgendaItem(id: 'i1', name: 'Item 1'),
          dto.EventAgendaItem(id: 'i2', name: 'Item 2'),
        ];

        final domains = EventAgendaItemMapper.fromDtoList(dtos);

        expect(domains.length, 2);
        expect(domains[0].id, 'i1');
        expect(domains[1].id, 'i2');
      });

      test('handles null list', () {
        final domains = EventAgendaItemMapper.fromDtoList(null);
        expect(domains, isEmpty);
      });
    });
  });
}
