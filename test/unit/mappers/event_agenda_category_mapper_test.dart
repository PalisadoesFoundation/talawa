import 'package:flutter_test/flutter_test.dart';
import 'package:talawa/mappers/event_agenda_category_mapper.dart';
import 'package:talawa/models/events/event_agenda_category.dart' as dto;

void main() {
  group('EventAgendaCategoryMapper', () {
    test('fromDto converts category', () {
      final dtoCategory = dto.AgendaCategory(
        id: 'cat123',
        name: 'Workshops',
        description: 'Educational sessions',
      );

      final domain = EventAgendaCategoryMapper.fromDto(dtoCategory);

      expect(domain.id, 'cat123');
      expect(domain.name, 'Workshops');
      expect(domain.hasDescription, true);
    });
  });
}
