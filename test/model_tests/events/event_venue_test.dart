import 'package:flutter_test/flutter_test.dart';
import 'package:talawa/models/events/event_venue.dart';

void main() {
  group('Test Venue Model', () {
    test('Test Venue fromJson and toJson', () {
      final venue = Venue(
        id: '1',
        capacity: 100,
        description: 'A nice place',
        imageUrl: 'http://example.com/image.jpg',
        name: 'Main Hall',
        organizationId: 'org1',
      );

      final venueJson = {
        '_id': '1',
        'capacity': 100,
        'description': 'A nice place',
        'imageUrl': 'http://example.com/image.jpg',
        'name': 'Main Hall',
        'organization': {'_id': 'org1'},
      };

      final venueFromJson = Venue.fromJson(venueJson);

      expect(venue.id, venueFromJson.id);
      expect(venue.capacity, venueFromJson.capacity);
      expect(venue.description, venueFromJson.description);
      expect(venue.imageUrl, venueFromJson.imageUrl);
      expect(venue.name, venueFromJson.name);
      expect(venue.organizationId, venueFromJson.organizationId);
    });
  });
}
