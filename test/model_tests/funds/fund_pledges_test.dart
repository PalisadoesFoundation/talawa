import 'package:flutter_test/flutter_test.dart';
import 'package:talawa/models/funds/fund_campaign.dart';
import 'package:talawa/models/funds/fund_pledges.dart';
import 'package:talawa/models/user/user_info.dart';

void main() {
  group('Pledge Model Test', () {
    test('fromJson should parse JSON correctly', () {
      // Sample JSON data representing a pledge
      final jsonData = {
        '_id': 'pledge123',
        'campaigns': [
          Campaign(name: 'Education Fund'),
          Campaign(name: 'Health Fund'),
        ],
        'users': [
          <String, dynamic>{
            'firstName': 'Alice',
          },
          <String, dynamic>{
            'firstName': 'Bob',
          },
        ],
        'startDate': '2024-01-01T00:00:00.000Z',
        'endDate': '2024-12-31T23:59:59.999Z',
        'amount': 500,
        'currency': 'USD',
        'createdAt': '2024-01-01T00:00:00.000Z',
        'updatedAt': '2024-06-30T00:00:00.000Z',
      };

      // Parse the JSON data into a Pledge instance
      final pledge = Pledge.fromJson(jsonData);

      // Assertions
      expect(pledge.id, 'pledge123');
      expect(pledge.campaigns, isA<List<Campaign>>());
      expect(pledge.campaigns?.length, 2);
      expect(pledge.campaigns?[0].name, 'Education Fund');
      expect(pledge.campaigns?[1].name, 'Health Fund');

      expect(pledge.pledgers, isA<List<User>>());
      expect(pledge.pledgers?.length, 2);
      expect(pledge.pledgers?[0].firstName, 'Alice');
      expect(pledge.pledgers?[1].firstName, 'Bob');

      expect(pledge.startDate, DateTime.parse('2024-01-01T00:00:00.000Z'));
      expect(pledge.endDate, DateTime.parse('2024-12-31T23:59:59.999Z'));
      expect(pledge.amount, 500);
      expect(pledge.currency, 'USD');
      expect(pledge.createdAt, DateTime.parse('2024-01-01T00:00:00.000Z'));
      expect(pledge.updatedAt, DateTime.parse('2024-06-30T00:00:00.000Z'));
    });
    test('fromJson should handle null values correctly', () {
      // Sample JSON data with null values
      final jsonData = {
        '_id': null,
        'campaigns': null,
        'users': null,
        'startDate': null,
        'endDate': null,
        'amount': null,
        'currency': null,
        'createdAt': null,
        'updatedAt': null,
      };

      // Parse the JSON data into a Pledge instance
      final pledge = Pledge.fromJson(jsonData);

      // Assertions for null values
      expect(pledge.id, isNull);
      expect(pledge.campaigns, isNull);
      expect(pledge.pledgers, isNull);
      expect(pledge.startDate, isNull);
      expect(pledge.endDate, isNull);
      expect(pledge.amount, isNull);
      expect(pledge.currency, isNull);
      expect(pledge.createdAt, isNull);
      expect(pledge.updatedAt, isNull);
    });
  });
}
