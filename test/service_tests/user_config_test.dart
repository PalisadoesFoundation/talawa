import 'package:talawa/utils/event_queries.dart';
import 'package:test/test.dart';

void main() {
  group('EventQueries', () {
    final eventQueries = EventQueries();

    test('fetchOrgEvents should return a valid query', () {
      final query = eventQueries.fetchOrgEvents('organization_id');
      expect(query, isNotNull);
      expect(query, contains('eventsByOrganization'));
      expect(query, contains('organization'));
      expect(query, contains('creator'));
    });

    test('registrantsByEvent should return a valid query', () {
      final query = eventQueries.registrantsByEvent('event_id');
      expect(query, isNotNull);
      expect(query, contains('registrantsByEvent'));
    });

    test('addEvent should return a valid query', () {
      final query = eventQueries.addEvent();
      expect(query, isNotNull);
      expect(query, contains('createEvent'));
    });

    test('registerForEvent should return a valid query', () {
      final query = eventQueries.registerForEvent();
      expect(query, isNotNull);
      expect(query, contains('registerForEvent'));
    });

    test('deleteEvent should return a valid query', () {
      final query = eventQueries.deleteEvent('event_id');
      expect(query, isNotNull);
      expect(query, contains('removeEvent'));
    });

    test('updateEvent should return a valid query', () {
      final query = eventQueries.updateEvent(eventId: 'event_id');
      expect(query, isNotNull);
      expect(query, contains('updateEvent'));
    });
  });
}
