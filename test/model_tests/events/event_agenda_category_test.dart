import 'package:flutter_test/flutter_test.dart';
import 'package:talawa/models/events/event_agenda_category.dart';

void main() {
  group('Test AgendaCategory Model', () {
    test('Test AgendaCategory fromJson', () {
      final agendaCategory = AgendaCategory(
        id: 'category1',
        name: 'Discussion',
        description: 'A general discussion session',
      );

      final agendaCategoryJson = {
        '_id': 'category1',
        'name': 'Discussion',
        'description': 'A general discussion session',
      };

      final agendaCategoryFromJson =
          AgendaCategory.fromJson(agendaCategoryJson);

      // Verifying that all fields were correctly deserialized
      expect(agendaCategory.id, agendaCategoryFromJson.id);
      expect(agendaCategory.name, agendaCategoryFromJson.name);
      expect(agendaCategory.description, agendaCategoryFromJson.description);
    });

    test('Test AgendaCategory fromJson with null values', () {
      final agendaCategoryJson = {
        '_id': null,
        'name': null,
        'description': null,
      };

      final agendaCategoryFromJson =
          AgendaCategory.fromJson(agendaCategoryJson);

      // Verifying that null values are handled correctly
      expect(agendaCategoryFromJson.id, isNull);
      expect(agendaCategoryFromJson.name, isNull);
      expect(agendaCategoryFromJson.description, isNull);
    });
  });
}
