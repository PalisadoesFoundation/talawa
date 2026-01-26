import 'package:flutter_test/flutter_test.dart';
import 'package:talawa/mappers/event_agenda_category_mapper.dart';
import 'package:talawa/models/events/event_agenda_category.dart' as dto;

void main() {
  group('EventAgendaCategoryMapper', () {
    group('fromDto', () {
      test('converts all fields correctly', () {
        final dtoCategory = dto.AgendaCategory(
          id: 'cat123',
          name: 'Main Events',
          description: 'Primary event category',
        );

        final domain = EventAgendaCategoryMapper.fromDto(dtoCategory);

        expect(domain.id, 'cat123');
        expect(domain.name, 'Main Events');
        expect(domain.description, 'Primary event category');
        expect(domain.displayName, 'Main Events');
        expect(domain.hasDescription, true);
      });

      test('handles null name', () {
        final dtoCategory = dto.AgendaCategory(id: 'cat456');

        final domain = EventAgendaCategoryMapper.fromDto(dtoCategory);

        expect(domain.displayName, 'Unnamed Category');
      });
    });

    group('fromDtoList', () {
      test('converts list of DTOs', () {
        final dtos = [
          dto.AgendaCategory(id: 'c1', name: 'Category 1'),
          dto.AgendaCategory(id: 'c2', name: 'Category 2'),
        ];

        final domains = EventAgendaCategoryMapper.fromDtoList(dtos);

        expect(domains.length, 2);
        expect(domains[0].id, 'c1');
        expect(domains[1].id, 'c2');
      });

      test('handles null list', () {
        final domains = EventAgendaCategoryMapper.fromDtoList(null);
        expect(domains, isEmpty);
      });
    });
  });
}
