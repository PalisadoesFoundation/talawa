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

      test('handles null id', () {
        final dtoCategory = dto.AgendaCategory(name: 'Category without ID');

        final domain = EventAgendaCategoryMapper.fromDto(dtoCategory);

        expect(domain.id, '');
        expect(domain.name, 'Category without ID');
      });

      test('handles null name', () {
        final dtoCategory = dto.AgendaCategory(id: 'cat456');

        final domain = EventAgendaCategoryMapper.fromDto(dtoCategory);

        expect(domain.displayName, 'Unnamed Category');
      });

      test('handles null description', () {
        final dtoCategory = dto.AgendaCategory(
          id: 'cat789',
          name: 'Category without desc',
          description: null,
        );

        final domain = EventAgendaCategoryMapper.fromDto(dtoCategory);

        expect(domain.hasDescription, false);
      });

      test('handles empty description', () {
        final dtoCategory = dto.AgendaCategory(
          id: 'cat101',
          name: 'Category empty desc',
          description: '',
        );

        final domain = EventAgendaCategoryMapper.fromDto(dtoCategory);

        expect(domain.hasDescription, false);
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
