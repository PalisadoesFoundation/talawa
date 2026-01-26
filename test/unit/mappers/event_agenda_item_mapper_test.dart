import 'package:flutter_test/flutter_test.dart';
import 'package:talawa/mappers/event_agenda_item_mapper.dart';
import 'package:talawa/models/events/agendaItems/event_agenda_item.dart' as dto;

void main() {
  group('EventAgendaItemMapper', () {
    test('fromDto converts agenda item', () {
      final dtoItem = dto.EventAgendaItem(
        id: 'item123',
        name: 'Opening Ceremony',
        description: 'Event kickoff',
        duration: '30 minutes',
        sequence: 1,
      );

      final domain = EventAgendaItemMapper.fromDto(dtoItem);

      expect(domain.id, 'item123');
      expect(domain.name, 'Opening Ceremony');
      expect(domain.displayName, 'Opening Ceremony');
    });
  });
}
